<?php

class Promocode_Model extends CJS_Model
{
	public function Promocode_Model()
	{
		$this->table = "promocodes";
		$this->pk = "index";
    	$this->fields = array(
    		'index' 						=> array("type"=>"text", "shown"=>false,"label"=>"Index"),
    		'title' 						=> array("type"=>"text", "shown"=>true,"label"=>"Title"),
			'discount'						=> array("type"=>"text", "shown"=>true, "label"=>"Discount"),
			'code'							=> array("type"=>"text", "shown"=>true, "label"=>"Code"),
		);
	}
}

?>