<?php

class Selections_Model extends CJS_Model
{
	public function Selections_Model()
	{
		$this->table = "selections";
		$this->pk = "index";
    	$this->fields = array(
    		'index' 						=> array("shown"=>false,"label"=>"Index"),
    		'id' 							=> array("shown"=>true,"label"=>"Id"),
			'part_number' 					=> array("shown"=>true,"label"=>"Part Number"),
			'description'					=> array("shown"=>true,"label"=>"Description"),
			'exclude'						=> array("shown"=>true,"label"=>"Exclude"),
			'dealer_only'					=> array("shown"=>true,"label"=>"Dealer Only"),
			'list_price'					=> array("shown"=>true,"label"=>"List Price"),
			'dealer_price'					=> array("shown"=>true,"label"=>"Dealer Price"),
			'cj_price'						=> array("shown"=>true,"label"=>"CJ Price"),
			'graco_price'					=> array("shown"=>true,"label"=>"Graco Price"),
			'option_index'					=> array("shown"=>true,"label"=>"Option Index"),
			'option_id'						=> array("shown"=>true,"label"=>"Option Id"),
			'info_index'					=> array("shown"=>true,"label"=>"Info Index"),
			'image'							=> array("shown"=>true,"label"=>"Image"),
			'product_type'					=> array("shown"=>true,"label"=>"Product Type")
		);
	}
}

?>