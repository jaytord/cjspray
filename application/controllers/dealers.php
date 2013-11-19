<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Dealers extends CI_Controller {

	function __construct()
	{
		parent::__construct();
		
		$this->load->model("dealer_model");
		$this->load->library("encrypt");
		$this->fields = $this->dealer_model->fields();
	}

	//redirect if needed, otherwise display the user list
	function index()
	{
		$users = $this->dealer_model->get();
		$this->load->view( "dealer_view", array("fields"=>$this->fields, "users"=>$users) );
	}

	//log the user in
	function create()
	{
		$post = $this->input->post();

		// $str = '12345';
		// $key = 'my-secret-key';
		// $encrypted = $this->encrypt->encode($str, config_item("encryption_key"));
		// echo $this->encrypt->decode($encrypted, config_item("encryption_key"));

		if(empty($post)){
			//login form
			
			$this->load->view( "create_dealer", array("fields"=>$this->fields) );
		} else{
			//submit from post

			$existing_user = $this->dealer_model->get( array( "username"=>$post["username"] ) );
			if( $existing_user ){
				die("username already exists");
			} 

			$post["password"] = $this->encrypt->encode($post["password"], config_item("encryption_key"));
			$result = $this->dealer_model->add($post);

			if(!empty($result)){
				echo "Success : User index : " . $result;
			} else {
				"Failed";
			}
		}
	}
}
