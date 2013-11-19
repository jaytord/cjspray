<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Auth extends CI_Controller {

	function __construct()
	{
		parent::__construct();
		
		$this->load->helper('url');
		$this->load->database();
		$this->load->model("dealer_model");
		$this->load->library("encrypt");
		$this->load->library("session");
	}

	//redirect if needed, otherwise display the user list
	function index()
	{

	}

	function session(){
		$userdata = $this->session->all_userdata();
		echo json_encode( $userdata );
	}

	//log the user in
	function login()
	{
		$post = $this->input->post();

		if( empty($post) ){
			//login form

			$this->load->view("login_view");
		} else{
			//submit from post
			$pass = $post["password"];
			unset($post["password"]);

			$user = $this->dealer_model->get( $post );
			$user = $user[0];

			$success = $pass == $this->encrypt->decode( $user->password, config_item("encryption_key") ) ? true : false;
			if($success){
				unset($user->password);
				$this->session->set_userdata($user);
				echo json_encode($user);
			} else {
				echo "failed";
			}
		}
	}

	//log the user out
	function logout()
	{
		$this->session->unset_userdata();
		$this->session->sess_destroy();
		echo "success";
	}
}
