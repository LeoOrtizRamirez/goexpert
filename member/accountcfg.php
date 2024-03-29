<?php
if (!defined('OK_LOADME')) {
    die('o o p s !');
}

$pgdatatokenarr = get_optionvals($payrow['pgdatatoken']);
$pgdatatoken = $mbrstr['pgdatatoken'];
$pgmbrtokenarr = get_optionvals($pgdatatoken);

$mbrperfectmoneycfg = get_optarr($pgmbrtokenarr['perfectmoneycfg']);
$mbrpayfastcfg = get_optarr($pgmbrtokenarr['payfastcfg']);
$mbrpaystackcfg = get_optarr($pgmbrtokenarr['paystackcfg']);
$mbrcoinpaymentscfg = get_optarr($pgmbrtokenarr['coinpaymentscfg']);
$mbrpaypalcfg = get_optarr($pgmbrtokenarr['paypalcfg']);

$mbrstripecfg = get_optarr($pgmbrtokenarr['stripecfg']);

$strmbr_intro = base64_decode($mbrstr['mbr_intro']);
$mbr_sosmed = get_optionvals($mbrstr['mbr_sosmed']);
$mbrstr['mbr_twitter'] = $mbr_sosmed['mbr_twitter'];
$mbrstr['mbr_facebook'] = $mbr_sosmed['mbr_facebook'];

$country_array = array_map('strtolower', $country_array);
$country_array = array_map('ucwords', $country_array);
$country_menu = select_opt($country_array, $mbrstr['country']);

$mbrsite_cat_menu = select_opt($webcategory_array, $mbrstr['mbrsite_cat']);

$optinmearr = array(0, 1);
$optinme_cek = radiobox_opt($optinmearr, $mbrstr['optinme']);
$showsitearr = array(0, 1);
$showsite_cek = radiobox_opt($showsitearr, $mbrstr['showsite']);

$mbrimgstr = ($mbrstr['mbr_image']) ? $mbrstr['mbr_image'] : $cfgrow['mbr_defaultimage'];

if (isset($_FILES['mbr_image']) && $_FILES['mbr_image']["tmp_name"] != '') {
    // process images
    if (!defined('ISDEMOMODE')) {
        $mbr_image = do_imgresize('mbr_image_' . $mbrstr['id'], $_FILES["mbr_image"]["tmp_name"], $cfgrow['mbrmax_image_width'], $cfgrow['mbrmax_image_height'], 'jpeg');
        $data = array(
            'mbr_image' => $mbr_image,
        );

        $update = $db->update(DB_TBLPREFIX . '_mbrs', $data, array('id' => $mbrstr['id']));
        if ($update) {
            $_SESSION['dotoaster'] = "toastr.success('Profile picture updated successfully!', 'Success');";
        }
    } else {
        $_SESSION['dotoaster'] = "toastr.warning('Profile picture is not updated!', 'Demo Mode');";
    }
    redirpageto('index.php?hal=' . $hal);
    exit;
}

if (isset($FORM['dosubmit']) and $FORM['dosubmit'] == '1') {

    if ($mbrstr['mbrstatus'] > 1) {
        $_SESSION['dotoaster'] = "toastr.error({$LANG['g_nomajorchanges']}, 'Account limited');";
        redirpageto('index.php?hal=' . $hal);
        exit;
    }

    extract($FORM);

    $mbr_sosmed = put_optionvals($mbr_sosmed, 'mbr_twitter', mystriptag($mbr_twitter));
    $mbr_sosmed = put_optionvals($mbr_sosmed, 'mbr_facebook', mystriptag($mbr_facebook));

    // if password change
    if ($password1 == $password2 && $ischangeok == 1) {
        $data = array(
            'password' => getpasshash($password1),
        );
        $update0 = $db->update(DB_TBLPREFIX . '_mbrs', $data, array('id' => $mbrstr['id']));
    }

    $imgtofile = getwebssdata($mbrstr, $mbrsite_url);
    if ($mbrsite_url != $mbrsite_url_old && $imgtofile != '') {
        $mbrsite_img = ".." . $imgtofile;
    } else {
        $mbrsite_img = $mbrsite_img_old;
    }

    $mbr_intro = mystriptag($mbr_intro);

    $data = array(
        'firstname' => mystriptag($firstname),
        'lastname' => mystriptag($lastname),
        'email' => mystriptag($email, 'email'),
        'optinme' => $optinme,
        'mbr_intro' => base64_encode($mbr_intro),
        'address' => mystriptag($address),
        'state' => mystriptag($state),
        'country' => $country,
        'phone' => mystriptag($phone),
        'mbr_sosmed' => mystriptag($mbr_sosmed),
        'mbrsite_url' => mystriptag($mbrsite_url, 'url'),
        'mbrsite_title' => substr(mystriptag($mbrsite_title), 0, $cfgrow['mbrmax_title_char']),
        'mbrsite_desc' => base64_encode(mystriptag(substr($mbrsite_desc, 0, $cfgrow['mbrmax_descr_char']))),
        'mbrsite_cat' => $mbrsite_cat,
        'mbrsite_img' => $mbrsite_img,
        'showsite' => $showsite,
    );

    $update = $db->update(DB_TBLPREFIX . '_mbrs', $data, array('id' => $mbrstr['id']));

    // ---

    $perfectmoneyarr = array('perfectmoneyacc' => $perfectmoneyacc);
    $perfectmoneycfg = put_optarr($pgmbrtokenarr['perfectmoneycfg'], $perfectmoneyarr);
    $pgdatatoken = put_optionvals($pgdatatoken, 'perfectmoneycfg', $perfectmoneycfg);

    $payfastarr = array('payfastmercid' => $payfastmercid);
    $payfastcfg = put_optarr($pgmbrtokenarr['payfastcfg'], $payfastarr);
    $pgdatatoken = put_optionvals($pgdatatoken, 'payfastcfg', $payfastcfg);

    $stripearr = array('stripeacc' => $stripeacc);
    $stripecfg = put_optarr($pgmbrtokenarr['stripecfg'], $stripearr);
    $pgdatatoken = put_optionvals($pgdatatoken, 'stripecfg', $stripecfg);

    $paystackarr = array('paystackpub' => $paystackpub);
    $paystackcfg = put_optarr($pgmbrtokenarr['paystackcfg'], $paystackarr);
    $pgdatatoken = put_optionvals($pgdatatoken, 'paystackcfg', $paystackcfg);

    $coinpaymentsarr = array('coinpaymentsmercid' => $coinpaymentsmercid);
    $coinpaymentscfg = put_optarr($pgmbrtokenarr['coinpaymentscfg'], $coinpaymentsarr);
    $pgdatatoken = put_optionvals($pgdatatoken, 'coinpaymentscfg', $coinpaymentscfg);

    $paypalarr = array('paypalacc' => $paypalacc);
    $paypalcfg = put_optarr($pgmbrtokenarr['paypalcfg'], $paypalarr);
    $pgdatatoken = put_optionvals($pgdatatoken, 'paypalcfg', $paypalcfg);

    $data = array(
        'pgdatatoken' => $pgdatatoken,
        'manualpayipn' => base64_encode(mystriptag($manualpayipn)),
    );
    $condition = ' AND pgidmbr = "' . $mbrstr['id'] . '" ';
    $sql = $db->getRecFrmQry("SELECT * FROM " . DB_TBLPREFIX . "_paygates WHERE 1 " . $condition . "");
    if (count($sql) > 0) {
        $update1 = $db->update(DB_TBLPREFIX . '_paygates', $data, array('pgidmbr' => $mbrstr['id']));
    } else {
        $data_add = array(
            'pgidmbr' => $mbrstr['id'],
        );
        $data = array_merge($data, $data_add);
        $insert = $db->insert(DB_TBLPREFIX . '_paygates', $data);
    }
    // ---

    if ($update0 || $update || $update1 || $insert) {
        $_SESSION['dotoaster'] = "toastr.success('Record updated successfully!', 'Success');";
    } else {
        $_SESSION['dotoaster'] = "toastr.warning({$LANG['g_nomajorchanges']}, 'Info');";
    }

    redirpageto('index.php?hal=' . $hal);
    exit;
}

$faiconcolor = ($mbrstr['mbrstatus'] == 2) ? '<div class="section-header-breadcrumb"><i class="fa fa-2x fa-fw fa-lock text-danger"></i></div>' : '';
?>

<div class="section-header">
    <h1><i class="fa fa-fw fa-user-cog"></i> <?php echo myvalidate($LANG['m_profilecfg']); ?></h1>
    <?php echo myvalidate($faiconcolor); ?>
</div>

<div class="section-body">
    <div class="row">
        <div class="col-md-4">	
            <div class="card">
                <div class="card-header text-center">
                    <h4><?php echo myvalidate($mbrstr['firstname'] . ' ' . $mbrstr['lastname']); ?></h4>
                </div>
                <div class="card-body">
                    <span class="text-small"><i class="fas fa-user-tag fa-fw"></i> <?php echo myvalidate($mbrstr['username']); ?></span>
                    <form enctype="multipart/form-data" method="post" role="form" id="update_mbr_image">
                        <input type="hidden" name="hal" value="accountcfg">
                        <div class="text-center mt-2">
                            <img id="mbr_image_btn" width='<?php echo myvalidate($cfgrow['mbrmax_image_width']); ?>' height='<?php echo myvalidate($cfgrow['mbrmax_image_height']); ?>' alt="<?php echo myvalidate($mbrstr['username']); ?>" src="<?php echo myvalidate($mbrimgstr); ?>" class="img-fluid rounded-circle img-thumbnail img-shadow author-box-picture" style="cursor: pointer;">
                            <input type="file" id="my_file" name="mbr_image" style="display: none;" />
                        </div>
                    </form>
                </div>
            </div>
            <div class="card">
                <div class="card-header">
                    <h4>Configuración</h4>
                </div>
                <div class="card-body">
                    <ul class="nav nav-pills flex-column" id="myTab4" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" id="config-tab1" data-toggle="tab" href="#cfgtab1" role="tab" aria-controls="profile" aria-selected="true">Perfil</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="config-tab2" data-toggle="tab" href="#cfgtab2" role="tab" aria-controls="account" aria-selected="false">Cuenta</a>
                        </li>
            

                        <li class="nav-item">
                            <a class="nav-link" id="config-tab4" data-toggle="tab" href="#cfgtab4" role="tab" aria-controls="password" aria-selected="false">Contraseña</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="col-md-8">	
            <div class="card">

                <form method="post" action="index.php" id="cfgform" oninput='password1.setCustomValidity(password2.value != password1.value ? "Passwords do not match." : "")'>
                    <input type="hidden" name="hal" value="accountcfg">

                    <div class="card-header">
                        <h4>Opciones</h4>
                    </div>

                    <div class="card-body">
                        <div class="tab-content no-padding" id="myTab2Content">

                            <div class="tab-pane fade show active" id="cfgtab1" role="tabpanel" aria-labelledby="config-tab1">
                                <p class="text-muted"><?php echo myvalidate($LANG['m_profileaccnote']); ?></p>

                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label><?php echo myvalidate($LANG['g_firstname']); ?> <span class="text-danger">*</span></label>
                                        <input type="text" name="firstname" id="firstname" class="form-control" value="<?php echo isset($mbrstr['firstname']) ? $mbrstr['firstname'] : ''; ?>" placeholder="Member first name" required>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label><?php echo myvalidate($LANG['g_lastname']); ?> <span class="text-danger">*</span></label>
                                        <input type="text" name="lastname" id="lastname" class="form-control" value="<?php echo isset($mbrstr['lastname']) ? $mbrstr['lastname'] : ''; ?>" placeholder="Member last name" required>
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label>Email <span class="text-danger">*</span></label>
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text"><i class="fa fa-fw fa-envelope"></i></div>
                                            </div>
                                            <input type="email" name="email" id="email" class="form-control" value="<?php echo isset($mbrstr['email']) ? $mbrstr['email'] : ''; ?>" placeholder="Member email" required>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="selectgroup-pills">Optar por recibir notificaciones</label>
                                        <div class="selectgroup selectgroup-pills">
                                            <label class="selectgroup-item">
                                                <input type="radio" name="optinme" value="0" class="selectgroup-input"<?php echo myvalidate($optinme_cek[0]); ?>>
                                                <span class="selectgroup-button selectgroup-button-icon"><i class="fas fa-fw fa-times-circle"></i> No</span>
                                            </label>
                                            <label class="selectgroup-item">
                                                <input type="radio" name="optinme" value="1" class="selectgroup-input"<?php echo myvalidate($optinme_cek[1]); ?>>
                                                <span class="selectgroup-button selectgroup-button-icon"><i class="fas fa-fw fa-check-circle"></i> Yes</span>
                                            </label>
                                        </div>
                                    </div>
                                </div>
<!--
                                <div class="form-group">
                                    <label>Sobre mí</label>
                                    <textarea name="mbr_intro" class="form-control rowsize-md" id="mbr_intro" placeholder="Perfil"><?php echo isset($strmbr_intro) ? $strmbr_intro : ''; ?></textarea>
                                </div>
-->
                                <div class="form-group">
                                    <label>Dirección</label>
                                    <textarea name="address" class="form-control rowsize-sm" id="address" rows="16" ><?php echo isset($mbrstr['address']) ? $mbrstr['address'] : ''; ?></textarea>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-md-4">
                                        <label>Estado o Provincia</label>
                                        <input type="text" name="state" id="state" class="form-control" value="<?php echo isset($mbrstr['state']) ? $mbrstr['state'] : ''; ?>" >
                                    </div>
                                    <div class="form-group col-md-5">
                                        <label>País</label>
                                        <select name="country" id="country" class="form-control">
                                            <?php echo myvalidate($country_menu); ?>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-3">
                                        <label>Teléfono</label>
                                        <input type="tel" class="tel form-control" name="phone" id="phone" x-autocompletetype="tel" value="<?php echo isset($mbrstr['phone']) ? $mbrstr['phone'] : ''; ?>" >
                                    </div>
                                </div>
<!--
                                <div class="form-row">
                                    <input type="hidden" name="mbr_sosmed" value="<?php echo isset($mbrstr['mbr_sosmed']) ? $mbrstr['mbr_sosmed'] : ''; ?>">
                                    <div class="form-group col-md-6">
                                        <label>Twitter</label>
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text"><i class="fab fa-fw fa-twitter"></i></div>
                                            </div>
                                            <input type="text" name="mbr_twitter" id="mbr_twitter" class="form-control" value="<?php echo isset($mbrstr['mbr_twitter']) ? $mbrstr['mbr_twitter'] : ''; ?>" placeholder="Member twitter account">
                                        </div>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>Facebook</label>
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text"><i class="fab fa-fw fa-facebook-f"></i></div>
                                            </div>
                                            <input type="text" name="mbr_facebook" id="mbr_facebook" class="form-control" value="<?php echo isset($mbrstr['mbr_facebook']) ? $mbrstr['mbr_facebook'] : ''; ?>" placeholder="Member facebook account">
                                        </div>
                                    </div>
                                </div>
-->
                            </div>

                            <div class="tab-pane fade" id="cfgtab2" role="tabpanel" aria-labelledby="config-tab2">
                                <p class="text-muted"><?php echo myvalidate($LANG['m_profilepaynote']); ?></p>

                                <?php
                                if ($pgdatatokenarr['coinpayments4usr'] == 1) {
                                    ?>
                                    <div class="form-group">
                                        <label>Dirección de Bitcoin</label>
                                        <input type="text" name="coinpaymentsmercid" id="coinpaymentsmercid" class="form-control" value="<?php echo isset($mbrcoinpaymentscfg['coinpaymentsmercid']) ? $mbrcoinpaymentscfg['coinpaymentsmercid'] : ''; ?>" placeholder="Your Bitcoin address">
                                    </div>
                                    <?php
                                }
                                if ($pgdatatokenarr['perfectmoney4usr'] == 1) {
                                    ?>
                                    <div class="form-group">
                                        <label>Perfectmoney Account</label>
                                        <input type="text" name="perfectmoneyacc" id="perfectmoneyacc" class="form-control" value="<?php echo isset($mbrperfectmoneycfg['perfectmoneyacc']) ? $mbrperfectmoneycfg['perfectmoneyacc'] : ''; ?>" placeholder="Your Perfectmoney Account">
                                    </div>
                                    <?php
                                }
                                if ($pgdatatokenarr['payfast4usr'] == 1) {
                                    ?>
                                    <div class="form-group">
                                        <label>Payfast Account</label>
                                        <input type="text" name="payfastmercid" id="payfastmercid" class="form-control" value="<?php echo isset($mbrpayfastcfg['payfastmercid']) ? $mbrpayfastcfg['payfastmercid'] : ''; ?>" placeholder="Your Payfast">
                                    </div>
                                    <?php
                                }
                                if ($pgdatatokenarr['stripe4usr'] == 1) {
                                    ?>
                                    <div class="form-group">
                                        <label>Publishable Key</label>
                                        <input type="text" name="stripeacc" id="stripeacc" class="form-control" value="<?php echo isset($mbrstripecfg['stripeacc']) ? $mbrstripecfg['stripeacc'] : ''; ?>" placeholder="Your Stripe Publishable Key">
                                    </div>
                                    <?php
                                }
                                if ($pgdatatokenarr['paypal4usr'] == 1) {
                                    ?>
                                    <div class="form-group">
                                        <label>Cuenta de Paypal</label>
                                        <input type="text" name="paypalacc" id="paypalacc" class="form-control" value="<?php echo isset($mbrpaypalcfg['paypalacc']) ? $mbrpaypalcfg['paypalacc'] : ''; ?>" placeholder="Su dirección de correo electrónico de Paypal">
                                    </div>
                                    <?php
                                }
                                if ($pgdatatokenarr['paystack4usr'] == 1) {
                                    ?>
                                    <div class="form-group">
                                        <label>Tu pila de pago</label>
                                        <input type="text" name="paystackpub" id="paystackpub" class="form-control" value="<?php echo isset($mbrpaystackcfg['paystackpub']) ? $mbrpaystackcfg['paystackpub'] : ''; ?>" placeholder="Tu pila de pago">
                                    </div>
                                    <?php
                                }
                                if ($payrow['manualpay4usr'] == 1) {
                                    ?>
                                    <div class="form-group">
                                        <label><?php echo myvalidate($payrow['manualpayname']); ?></label>
                                        <textarea name="manualpayipn" class="form-control rowsize-sm" id="manualpayipn" rows="16" placeholder="<?php echo myvalidate($payrow['manualpayname']); ?>"><?php echo isset($mbrstr['manualpayipn']) ? base64_decode($mbrstr['manualpayipn']) : ''; ?></textarea>
                                    </div>
                                    <?php
                                }
                                ?>

                            </div>

                            <div class="tab-pane fade" id="cfgtab3" role="tabpanel" aria-labelledby="config-tab3">
                                <p class="text-muted"><?php echo myvalidate($LANG['m_profilewebnote']); ?></p>

                                <div class="form-group">
                                    <label>Site URL</label>
                                    <input type="text" name="mbrsite_url" id="mbrsite_url" class="form-control" value="<?php echo isset($mbrstr['mbrsite_url']) ? $mbrstr['mbrsite_url'] : ''; ?>" placeholder="Member site URL">
                                    <input type="hidden" name="mbrsite_url_old" value="<?php echo isset($mbrstr['mbrsite_url']) ? $mbrstr['mbrsite_url'] : ''; ?>">
                                    <input type="hidden" name="mbrsite_img_old" value="<?php echo isset($mbrstr['mbrsite_img']) ? $mbrstr['mbrsite_img'] : DEFIMG_SITE; ?>">
                                </div>

                                <div class="form-group">
                                    <label>Site Title</label>
                                    <input type="text" name="mbrsite_title" id="mbrsite_title" class="form-control" value="<?php echo isset($mbrstr['mbrsite_title']) ? $mbrstr['mbrsite_title'] : ''; ?>" maxlength="<?php echo myvalidate($cfgrow['mbrmax_title_char']); ?>" placeholder="Member site title">
                                </div>

                                <div class="form-group">
                                    <label>Site Description</label>
                                    <textarea name="mbrsite_desc" class="form-control rowsize-sm" id="mbrsite_desc" rows="16" maxlength="<?php echo myvalidate($cfgrow['mbrmax_descr_char']); ?>" placeholder="Member site description"><?php echo isset($mbrstr['mbrsite_desc']) ? base64_decode($mbrstr['mbrsite_desc']) : ''; ?></textarea>
                                </div>

                                <div class="form-group">
                                    <label>Site Category</label>
                                    <select name="mbrsite_cat" id="mbrsite_cat" class="form-control">
                                        <?php echo myvalidate($mbrsite_cat_menu); ?>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="selectgroup-pills">Display My Site</label>
                                    <div class="selectgroup selectgroup-pills">
                                        <label class="selectgroup-item">
                                            <input type="radio" name="showsite" value="0" class="selectgroup-input"<?php echo myvalidate($showsite_cek[0]); ?>>
                                            <span class="selectgroup-button selectgroup-button-icon"><i class="fas fa-fw fa-times-circle"></i> No</span>
                                        </label>
                                        <label class="selectgroup-item">
                                            <input type="radio" name="showsite" value="1" class="selectgroup-input"<?php echo myvalidate($showsite_cek[1]); ?>>
                                            <span class="selectgroup-button selectgroup-button-icon"><i class="fas fa-fw fa-check-circle"></i> Yes</span>
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <div class="tab-pane fade" id="cfgtab4" role="tabpanel" aria-labelledby="config-tab4">
                                <p class="text-muted"><?php echo myvalidate($LANG['m_profilepassnote']); ?></p>

                                <div class="form-row">
                                    <input type="hidden" name="password" value="<?php echo isset($mbrstr['password']) ? $mbrstr['password'] : ''; ?>">
                                    <div class="form-group col-md-6">
                                        <label>Contraseña</label>
                                        <input type="password" class="form-control" name="password2" id="password2" value="" >
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>Confirmar Contraseña</label>
                                        <input type="password" class="form-control" name="password1" id="password1" value="" placeholder="Confirmar contraseña">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="custom-control custom-checkbox">
                                        <input name="ischangeok" value="1" type="checkbox" class="custom-control-input" id="ischangeok">
                                        <label class="custom-control-label" for="ischangeok"><?php echo myvalidate($LANG['m_confirmpass']); ?></label>
                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>

                    <div class="card-footer bg-whitesmoke text-md-right">
                        <button type="reset" name="reset" value="reset" id="reset" class="btn btn-warning">
                            <i class="fa fa-fw fa-undo"></i> Reiniciar
                        </button>
                        <button type="submit" name="submit" value="submit" id="submit" class="btn btn-primary">
                            <i class="fa fa-fw fa-plus-circle"></i> Guardar Cambios
                        </button>
                        <input type="hidden" name="dosubmit" value="1">
                    </div>

                </form>

            </div>
        </div>
    </div>
</div>

<script language="JavaScript" type="text/javascript">
<!--
    $(document).ready(function () {
        $("#mbr_image_btn").on("click", function () {
            $("#my_file").click();
        });
        $("#my_file").on("change", function () {
            //alert('=> ' + $("#my_file").val());
            //$("form").submit();
            $("#update_mbr_image")[0].submit();
        });

    });

-->
</script>
