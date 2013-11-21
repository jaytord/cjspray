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
		$post = $this->input->post();

		$result = (object) 'promo';
		$result->success = true;
		$result->code = $post["code"];
		$result->discount = ".4";

		echo json_encode($result);
	}
}
