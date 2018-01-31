<?php
date_default_timezone_set ( 'PRC' );
define ( 'XMLENCODING', 'utf-8' );
define ( 'BUILDFILEEXT', '.xml' );
define ( 'RANGKING', 'Rangking' );
define ( 'NEXTUPDATEDATE', 'nextupdatedate' );
define ( 'NEXTUPDATETIME', 'nextupdatetime' );
define ( 'TYPE', 'type' );
define ( 'DATA', 'data' );
define ( 'ORDER', 'order' );

// 自动更新XML时间
define ( 'UPDATEXMLTIME', '06:30:00' );

$rktype = $_GET ['rktype'];
$serverindex = $_GET ['serverindex'];
$indexdir = './rangking/server' . $serverindex . '/';

if (! $rktype || ! $serverindex || $serverindex <= 0) {
	die ( '参数错误' );
}
$buildxml = false;
if (file_exists ( $indexdir . $rktype . BUILDFILEEXT )) {
	$fileupdate = getxmlupdatetime ( $indexdir . $rktype . BUILDFILEEXT );
	// if ((time()>strtotime(UPDATEXMLTIME)) &&
	// (date("Y-m-d",$fileupdate)<>date("Y-m-d"))){
	if (date ( "H", $fileupdate ) != date ( "H" )) { // 更改为每小时更新
		$buildxml = true;
	} else {
		echo getxmldata ( $indexdir . $rktype . BUILDFILEEXT );
	}
} else {
	$buildxml = true;
}

if ($buildxml) {
	$doc = new DOMDocument ( '1.0', XMLENCODING );
	$doc->formatOutput = true;
	$MainNode = $doc->appendChild ( $doc->createElement ( RANGKING ) );
	$nextupdatedate = $MainNode->appendChild ( $doc->createAttribute ( NEXTUPDATEDATE ) );
	$nextupdatedate->nodeValue = date ( "Y-m-d" );
	$nextupdatetime = $MainNode->appendChild ( $doc->createAttribute ( NEXTUPDATETIME ) );
	$nextupdatetime->nodeValue = date ( "H:i:s" );
	$type = $MainNode->appendChild ( $doc->createAttribute ( TYPE ) );
	$type->nodeValue = $rktype;
	$MainNode = $MainNode->appendChild ( $doc->createElement ( DATA ) );
	
	//常规排行榜
	$sSQL = "select toprank.actorid, actors.actorname, actors.sex, actors.job, actors.circle, actors.level, toprank.val, toprank.val2, toprank.desc1, toprank.desc2 from toprank inner join actors on toprank.actorid = actors.actorid where toprank.serverindex={$serverindex} and toprank.rankid={$rktype} order by toprank.rank";
	if ($rktype == 100)		//100代表魁首排行榜
	{
		$sSQL = "select toprank.rankid, toprank.actorid, actors.actorname, actors.sex, actors.job, actors.circle, actors.level, toprank.val, toprank.val2, toprank.desc1, toprank.desc2 from toprank inner join actors on toprank.actorid = actors.actorid where toprank.serverindex={$serverindex} and toprank.rank=1";
	}
	echo BuildDBToXML ( $serverindex, $doc, $MainNode, $sSQL, $rktype );
	
	if (create_folders ( $indexdir )) {
		$doc->save ( $indexdir . $rktype . BUILDFILEEXT );
	}
}
function BuildDBToXML($sIdx, $xmlDoc, $xmlNode, $sSQL, $rktype) {
	$serverindex = $sIdx;
	include ("conn_1812.php");
	$result = mysql_query ( $sSQL );
	while ( $row = mysql_fetch_row ( $result ) ) {
		$OrderNode = $xmlNode->appendChild ( $xmlDoc->createElement ( ORDER ) );
		for($i = 0; $i < mysql_num_fields ( $result ); $i ++) {
			
			$name = mysql_field_name ( $result, $i );
			$AttrNode = $OrderNode->appendChild ( $xmlDoc->createAttribute ( $name ) );
			$AttrNode->nodeValue = $row [$i];
		}
	}
	mysql_close ( $conn );
	return $xmlDoc->saveXML ();
}
function create_folders($dir) {
	return is_dir ( $dir ) or (create_folders ( dirname ( $dir ) ) and mkdir ( $dir, 0777 ));
}
function getxmlupdatetime($filename) {
	$tmpdoc = new DOMDocument ( '1.0', XMLENCODING );
	if ($tmpdoc->load ( $filename )) {
		$rank = $tmpdoc->documentElement;
		$update = $rank->getAttribute ( NEXTUPDATEDATE );
		$uptime = $rank->getAttribute ( NEXTUPDATETIME );
		return strtotime ( $update . ' ' . $uptime );
	}
}
function getxmldata($filename) {
	$tmpdoc = new DOMDocument ( '1.0', XMLENCODING );
	$tmpdoc->formatOutput = true;
	if ($tmpdoc->load ( $filename )) {
		return $tmpdoc->saveXML ();
	}
}

?>
