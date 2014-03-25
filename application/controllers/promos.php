<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Promos extends CI_Controller {

	function __construct()
	{
		parent::__construct();
	}

	//redirect if needed, otherwise display the user list
	function index()
	{
	}

	//log the user in
	function create()
	{
		
	}

	function validate()
	{
		$response = (object) 'promo';

		$post = $this->input->post();
		$code = $post["code"];


		$this->load->model("promocode_model");
		$result = $this->promocode_model->get( $post );

		if($result){
			$response = $result[0];
			$response->success = true;
		} else {
			$response->success = false;
			$response->error = "invalid code";
		}

		echo json_encode($response);
	}
}
