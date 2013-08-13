<?php

class Info_Model extends CJS_Model
{
	public function Info_Model()
	{
		$this->table = "info";
		$this->pk = "index";
    	$this->fields = array(
    		'index' 						=> array("type"=>"attribute","shown"=>false,"label"=>"Index"),
			'dealer_only'					=> array("type"=>"attribute","shown"=>true, "label"=>"Dealer Only"),
			'description'					=> array("type"=>"child","shown"=>true, "label"=>"Description"),
			'image'							=> array("type"=>"attribute","shown"=>true, "label"=>"Image"),
		);
	}
}

?>