<?php

class Dealer_Model extends CJS_Model
{
	public function Dealer_Model()
	{
		$this->table = "dealers";
		$this->pk = "index";
    	$this->fields = array(
    		'index' 						=> array("type"=>"text", "shown"=>false,"label"=>"Index"),
    		'username' 						=> array("type"=>"text", "shown"=>true,"label"=>"Username"),
			'password'						=> array("type"=>"password", "shown"=>true, "label"=>"Password"),
			'email'							=> array("type"=>"text", "shown"=>true, "label"=>"Email"),
			'phone'							=> array("type"=>"text", "shown"=>true, "label"=>"Phone"),
			'created_on'					=> array("type"=>"text", "shown"=>false, "label"=>"Created On"),
			'last_login'					=> array("type"=>"text", "shown"=>false, "label"=>"Last Login"),
			'active'						=> array("type"=>"text", "shown"=>false, "label"=>"Active"),
			'company_name'					=> array("type"=>"text", "shown"=>true, "label"=>"Company Name")
		);
	}
}

?>