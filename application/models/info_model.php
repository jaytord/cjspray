<?php

class Info_Model extends CJS_Model
{
	public function Info_Model()
	{
		$this->table = "info";
		$this->pk = "index";
    	$this->fields = array(
    		'index' 						=> array("shown"=>false,"label"=>"Index"),
    		'id' 							=> array("shown"=>false,"label"=>"Id"),
			'dealer_only'					=> array("shown"=>true, "label"=>"Dealer Only"),
			'description'					=> array("shown"=>true, "label"=>"Description"),
			'image'							=> array("shown"=>true, "label"=>"Image"),
		);
	}
}

?>