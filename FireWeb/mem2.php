<?php
$name=$_GET['name'];
$id=$_GET['id'];
$client = new SoapClient("NciicServices.wsdl",array('encoding'=>'UTF-8'));

class aa{
	public $inLicense='?v?zCL&I/A1k<U(P4EGB(DF84#?c?o?g2i8.?oaD\?-AF4;(*{XX8&1&?c$mX[LgRt.d?z?xE}%t@dOm[rb6TyBk^u?x.lZhaCEzA;Ed``ZiZq?x?vZkHzFhL.?xa$?m?g6z+r4.?jYlTi`8a4?x?vTfRyRua48m4d?m.[-q/y?v?jF[b9DfQq)e?v^bW[RuEx%uC0DKS<7Q9+V`1*&*c*?f9h6n8h?v?jYvPrFha4?x:mLia]L[CjAwVtSxSe;nSo(t?g?g2v(t?v2oFwLfDe`VNtUybZM/.j?vOm_hbP-;?v8eEjUmc5Dwa7DaCnUy?x?vUmXoSx^.RuOdFvBsQ[[oP[?x?v\yOrWp]t6.?d?h?a?s6a?jBbZf`8_u/k?v1pJtAb^dFj@/Ac_yc9Nz@mP[<c&y?jChb0@vPqG/JtRe(w';
	public $inConditions ='';


	public function put_data($name,$id){
		$this->inConditions='<?xml version="1.0" encoding="UTF-8" ?>
	<ROWS>
	<INFO>
	<SBM>工商银行北京分行东城区支行</SBM>
	</INFO>
	<ROW>
	<GMSFHM>公民身份号码</GMSFHM>
	<XM>姓名</XM>
	</ROW>
	<ROW FSD="100600" YWLX="个人贷款">
	<GMSFHM>'.$id.'</GMSFHM>
	<XM>'.$name.'</XM>
	</ROW>
	</ROWS>';
	}
}

$c=new aa();
$c->put_data($name,$id);

$arrPara = array($c);

$arrResult = $client->__soapCall('nciicCheck',$arrPara);
//print_r($arrResult);
$re_xml=$arrResult->out;

$ob= simplexml_load_string($re_xml);

//print_r($ob);

$row=$ob->ROW->OUTPUT;

$item=$row->ITEM;
$a=$item[0];
$b=$item[1];

$result_gmsfhm=$a->result_gmsfhm;
$result_xm=$b->result_xm;

if($result_gmsfhm=='一致' && $result_xm=='一致'){
	echo json_encode(1);
}else{
	echo json_encode(-2);
}

// print_r($result_gmsfhm);         
// print_r($result_xm);    
