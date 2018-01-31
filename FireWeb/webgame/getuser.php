<?php
include('conn_1812.php');
include('conn_actor.php');
$account=trim($_GET['username']);
$spid=trim($_GET['spid']);
$server_num=trim($_GET['server_num']);
$sign=trim($_GET['sign']);


$key='702042941817d99ec8625d4deea81043';
$j_sign=md5($account.$server_num.$key);


if($sign !=$j_sign){
	$ret_arr=array(
		'status'=>-1,
	);
}else{

	//查询该玩家的信息
	$sql="select * from globaluser where account='".$account."'";
	$res=mysql_query($sql,$conn);
	$account=mysql_fetch_assoc($res);  
	
	if($account){
		//查询该玩家的角色,等级等信息
		$sql2="SELECT * from actors where accountid='".$account['userid']."'";
		$res2=mysql_query($sql2,$conn2);
		//$role_arr=mysql_fetch_assoc($res2);	
		$role_arr=array();
		$ret_arr=array();
		while ($row=mysql_fetch_assoc($res2)) {
				$role_arr['actorname']=$row['actorname'];
				$role_arr['level']=$row['level'];
				$role_arr['job']=$row['job'];
				$role_arr['sex']=$row['sex'];
				$role_arr['gmlevel']=$account['gmlevel'];
				$role_arr['status']=1;
				$ret_arr[]=$role_arr;
		}
	}else{
		$ret_arr=array(
			'status'=>0,
		);
	}
}
echo json_encode($ret_arr);exit;




?>