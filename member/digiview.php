<?php
if (!defined('OK_LOADME')) {
    die('o o p s !');
}



/*Si hay una pagina seleccionada, llenar contenido*/
if (isset($FORM['pgid'])) {
    $pgid = mystriptag($FORM['pgid']);
    $row = $db->getAllRecords(DB_TBLPREFIX . "_pages", "*", " AND pgid = '{$pgid}' AND pgstatus = '1' AND (pglang = '' OR pglang = '{$mbrstr['mylang']}')");

    $pgcntrow = array();
    foreach ($row as $value) {
        $pgcntrow = array_merge($pgcntrow, $value);
    }

    if (!iscontentmbr($pgcntrow['pgavalon'], $pgcntrow['pgppids'], $mbrstr)) {
        $pgcntrow['pgtitle'] = "We couldn't find any data";
        $pgcntrow['pgsubtitle'] = $pgcntrow['pgcontent'] = '';
    } else {
        $pgcntrow['pgsubtitle'] = base64_decode($pgcntrow['pgsubtitle']);
        $pgcntrow['pgcontent'] = base64_decode($pgcntrow['pgcontent']);
    }
}


/*Llenar el combo desplegable de los grupos*/
$pggrid = intval($FORM['grid']);
$groupcatlist = '<option value="">-</option>';
$row = $db->getAllRecords(DB_TBLPREFIX . '_groups', '*', " AND grtype = 'content'");
$grouprow = array();
foreach ($row as $value) {
    $grouprow = array_merge($grouprow, $value);
    $strsel = ($grouprow['grid'] == $pggrid) ? ' selected' : '';
    $groupcatlist .= "<option value='{$grouprow['grid']}'{$strsel}>{$grouprow['grtitle']}</option>";
}

/*Llenar el combo desplegable del modulo segun el grupo seleccionado*/
if(isset($FORM['grid']) && $FORM['grid'] != "") {
    $grid = intval($FORM['grid']);//Grupo seleccionado
    $mdid = intval($FORM['mdid']);//Modulo seleccionado

    $row = $db->getAllRecords(DB_TBLPREFIX . '_modules', "*", " AND mdgrid = '{$grid}'");//Buscar modulos relacionados al grupo seleccionado

    /*
    $modulerow = array();
    foreach ($row as $value) {
        $modulerow = array_merge($modulerow, $value);
        $strsel = ($modulerow['mdid'] == $mdid) ? ' selected' : '';
        $modulecatlist .= "<option value='{$modulerow['mdid']}'{$strsel}>{$modulerow['mdtitle']}</option>";
    }
    */

    $modulerow = array();
    foreach ($row as $value) {
        $modulerow = array_merge($modulerow, $value);
        $strsel = ($modulerow['mdid'] == $mdid) ? ' selected' : '';
        $modulecatlist .=   "<div class='card page-content '>
                      <div class='card-header page-content'>
                        <a class='card-link page-content' data-toggle='collapse' href='#module_{$modulerow['mdid']}'>
                          {$modulerow['mdtitle']}
                        </a>
                      </div>
                      <div id='module_{$modulerow['mdid']}' class='collapse' data-parent='#accordion'>
                        <div class='card-body page-content'>";

                        
                        $mdid = $modulerow['mdid'];
                        $msgListData = $db->getAllRecords(DB_TBLPREFIX . "_pages", "*", " AND pgmdid = '{$mdid}' AND pgstatus = '1' AND (pglang = '' OR pglang = '{$mbrstr['mylang']}')");
                        

                        if (count($msgListData) > 0) {
                            $numpage = 0;
                            foreach ($msgListData as $val) {
                                if (iscontentmbr($val['pgavalon'], $val['pgppids'], $mbrstr)) {
                                    $strsel = ($FORM['pgid'] == $val['pgid']) ? ' selected' : '';
                                    $pagelink = "index.php?hal=digiview&pgid={$val['pgid']}&grid={$pggrid}&mdid={$mdid}";
                                    

                                    $modulecatlist .=
                                    "
                                    <div class='row'>
                                     
                                        <div class='col-12'>
                                                <ul class='page-content'>
                                                    <li class='page-content' onclick='location.href=" . '"' . myvalidate($pagelink) . '"' ."' >" . $val['pgmenu'] . "</li>

                                                </ul>
                                        </div>
                                    </div>
                                    ";


                                    $numpage++;
                                } else {
                                    continue;
                                }
                            }
                            if ($numpage < 1) {
                                echo "No Record(s) Found!";
                            } else {
                                $noviewpage = '<i class="fa fa-fw fa-long-arrow-alt-left"></i> ' . $LANG['m_clicklefttocnt'];
                            }
                        }
                        
                        




        $modulecatlist .= "</div></div></div>";
    }

    







}

/*Buscar las paginas relacionadas al modulo seleccionado*/
if(isset($FORM['mdid']) && $FORM['mdid'] != "") {
    $mdid = intval($FORM['mdid']);
    $sqlpggrid = ($pggrid > 0) ? " AND pgmdid = '{$mdid}'" : '';
    $msgListData = $db->getRecFrmQry("SELECT * FROM " . DB_TBLPREFIX . "_pages WHERE 1 AND pgstatus = '1' AND (pglang = '' OR pglang = '{$mbrstr['mylang']}'){$sqlpggrid}");
}

$noviewpage = <<<INI_HTML
                <div class="empty-state">
                    <div class="empty-state-icon bg-info">
                        <i class="fas fa-question"></i>
                    </div>
                    <h2>{$LANG['g_nocontent']}</h2>
                    <p class="lead">
                        {$LANG['g_nocontentinfo']}
                    </p>
                </div>
INI_HTML;
?>

<div class="section-header">
    <h1><i class="fa fa-fw fa-window-restore"></i> <?php echo myvalidate($LANG['a_digicontent']); ?></h1>
</div>

<div class="section-body">
    <div class="row">
        <div class="col-md-4">  
            <div class="card">
                <div class="card-body digiview">
                    <div class="form-group">
                        <form method="get" action="index.php" id="dgview">
                            <input type="hidden" name="hal" value="digiview">
                            <div class="input-group">
                                <select name="grid" class="custom-select digital-content-select digiview">
                                    <?php echo myvalidate($groupcatlist); ?>
                                </select>
                            </div>
                            <div id="accordion">
                                <?php echo myvalidate($modulecatlist); ?>
                            </div>
                        </form>
                    </div>
                    <!--
                    <div class="form-group">
                        <?php
                        if (count($msgListData) > 0) {
                            $numpage = 0;
                            foreach ($msgListData as $val) {
                                if (iscontentmbr($val['pgavalon'], $val['pgppids'], $mbrstr)) {
                                    $strsel = ($FORM['pgid'] == $val['pgid']) ? ' selected' : '';
                                    $pagelink = "index.php?hal=digiview&pgid={$val['pgid']}&grid={$pggrid}&mdid={$mdid}";
                                    ?>



                                    <div class="row">
                                        <div class="col-8 pgminiature">
                                            <img src="<?php echo $val['pgminiature']; ?>" width="250" onclick="location.href = '<?php echo myvalidate($pagelink); ?>'">
                                        </div>
                                        <div class="col-4">
                                            <button type="button" class="btn btn-info mt-2" onclick="location.href = '<?php echo myvalidate($pagelink); ?>'"><?php echo isset($val['pgmenu']) ? $val['pgmenu'] : '?'; ?></button>
                                        </div>
                                    </div>


                                    
                                    <?php
                                    $numpage++;
                                } else {
                                    continue;
                                }
                            }
                            if ($numpage < 1) {
                                echo "No Record(s) Found!";
                            } else {
                                $noviewpage = '<i class="fa fa-fw fa-long-arrow-alt-left"></i> ' . $LANG['m_clicklefttocnt'];
                            }
                        }
                        ?>
                    </div>
                -->
                </div>
            </div>
        </div>
        <div class="col-md-8">	
            <div class="card">

                <div class="card-header digiview">
                    <h4 style="display:none">NOMBRE DE CARRERA</h4>
                </div>

                <div class="card-body digiview-content">
                    <p class="text-muted"><?php echo ($FORM['pgid'] != '') ? "<div class='section-title mt-2'>{$pgcntrow['pgtitle']} <span style='display:none'>- {$pgcntrow['pgsubtitle']} </span></div>" : $noviewpage; ?></p>

                    <?php
                  
                    if ($FORM['pgid'] != '') {
                       if(isset($pgcntrow['pgcontent'])){
                        echo("<div class='video-content'>{$pgcntrow['pgcontent']} </div>");
                       }else{
                        echo("No hay Contenido");
                       }
                       
                    }



                    ?>

                </div>

            </div>
        </div>
    </div>
</div>

