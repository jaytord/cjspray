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
		$data_xml = simplexml_load_file( base_url().config_item('data_xml_path') );
		echo base_url().config_item('data_xml_path')."<br />";
		print_r($data_xml);

		//$this->load->view('home_view',array("data_xml"=>$data_xml));
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