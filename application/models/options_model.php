<?php

class Options_Model extends CJS_Model
{
	public function Options_Model()
	{
		$this->table = "options";
		$this->pk = "index";
    	$this->fields = array(
    		'index' 						=> array("type"=>"attribute","shown"=>false,"label"=>"Index"),
			'id' 							=> array("type"=>"attribute","shown"=>true,"label"=>"Id"),
			'dealer_only'					=> array("type"=>"attribute","shown"=>true,"label"=>"Dealer Only"),
			'image'							=> array("type"=>"attribute","shown"=>true,"label"=>"Image"),
			'label'							=> array("type"=>"child","shown"=>true,"label"=>"Label"),
			'info_index'					=> array("type"=>"attribute","shown"=>true,"label"=>"Info Index")
		);
	}
}

?>