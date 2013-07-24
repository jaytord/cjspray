<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Home extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -  
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in 
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see http://codeigniter.com/user_guide/general/urls.html
	 */
	public function index()
	{
		$feed = base_url().config_item('data_xml_path');

		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, $feed);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);

		// get the result of http query
		$output = curl_exec($ch);
		curl_close($ch);

		$xml = simplexml_load_string($output);

		$this->load->view('home_view',array("data_xml"=>$xml));
	}
	public function info($index)
	{
		echo "Info : ".$index;
	}
	public function phpinfo()
	{
		echo phpinfo();
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */