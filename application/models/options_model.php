<?php

class Options_Model extends CJS_Model
{
	public function Options_Model()
	{
		$this->table = "options";
		$this->pk = "index";
    	$this->fields = array(
    		'index' 						=> array("shown"=>false,"label"=>"Index"),
			'id' 							=> array("shown"=>true,"label"=>"Id"),
			'dealer_only'					=> array("shown"=>true,"label"=>"Dealer Only"),
			'image'							=> array("shown"=>true,"label"=>"Image"),
			'label'							=> array("shown"=>true,"label"=>"Label"),
			'info_index'					=> array("shown"=>true,"label"=>"Info Index")
		);
	}
}

?>