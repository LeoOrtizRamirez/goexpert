<?php
if (!defined('OK_LOADME')) {
    die('o o p s !');
}

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

$pggrid = intval($FORM['grid']);

$groupcatlist = '<option value="">-</option>';
$row = $db->getAllRecords(DB_TBLPREFIX . '_groups', '*', " AND grtype = 'content'");
$grouprow = array();
foreach ($row as $value) {
    $grouprow = array_merge($grouprow, $value);
    $strsel = ($grouprow['grid'] == $pggrid) ? ' selected' : '';
    $groupcatlist .= "<option value='{$grouprow['grid']}'{$strsel}>{$grouprow['grtitle']}</option>";
}

$sqlpggrid = ($pggrid > 0) ? " AND pggrid = '{$pggrid}'" : '';
$msgListData = $db->getRecFrmQry("SELECT * FROM " . DB_TBLPREFIX . "_pages WHERE 1 AND pgstatus = '1' AND (pglang = '' OR pglang = '{$mbrstr['mylang']}'){$sqlpggrid}");

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
<style>
    .section {
    z-index: unset !important;
}
</style>
<div class="section-header">
    <h1><i class="fa fa-fw fa-window-restore"></i> Bibioteca</h1>
</div>

<div class="section-body">

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
    <div class="row">
        <div class="col-md-12">	
            <div class="card">
                <div class="card-header" style="display:none">
                    <h4><?php echo myvalidate($LANG['g_content']); ?></h4>
                </div>
                <div class="card-body">

                    <div class="form-group">
                        <?php
                        if (count($msgListData) > 0) {
                            $numpage = 0;
                            foreach ($msgListData as $val) {
                                if (iscontentmbr($val['pgavalon'], $val['pgppids'], $mbrstr)) {
                                    $strsel = ($FORM['pgid'] == $val['pgid']) ? ' selected' : '';
                                    $pagelink = "index.php?hal=digiview&pgid={$val['pgid']}&grid={$pggrid}";
                                    ?>
                                    <img src="<?php echo isset($val['pgsubtitle']) ? base64_decode($val['pgsubtitle']) : '?'; ?>" data-toggle="modal" data-target="#exampleModal"/>
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
                </div>
            </div>
        </div>
    </div>
</div>
