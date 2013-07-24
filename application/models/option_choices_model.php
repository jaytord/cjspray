<?php

class Option_Choices_Model extends CJS_Model
{
	public function Option_Choices_Model()
	{
		$this->table = "option_choices";
		$this->pk = "index";
    	$this->fields = array(
    		'index' 						=> array("type"=>"attribute","shown"=>false,"label"=>"Index"),
			'id' 							=> array("type"=>"attribute","shown"=>true,"label"=>"Id"),
			'dealer_only'					=> array("type"=>"attribute","shown"=>true,"label"=>"Dealer Only"),
			'dealer_price'					=> array("type"=>"attribute","shown"=>true,"label"=>"Dealer Price"),
			'price'							=> array("type"=>"attribute","shown"=>true,"label"=>"Price"),
			'image'							=> array("type"=>"attribute","shown"=>true,"label"=>"Image"),
			'label'							=> array("type"=>"child","shown"=>true,"label"=>"Label"),
			'option_index'					=> array("type"=>"attribute","shown"=>true,"label"=>"Option Index"),
			'option_id'						=> array("type"=>"attribute","shown"=>true,"label"=>"Option Id"),
			'info_index'					=> array("type"=>"attribute","shown"=>true,"label"=>"Info Index")
		);
	}
}

?>