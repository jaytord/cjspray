<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Parser extends CI_Controller {

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
	public function __construct()
    {
        parent::__construct();

		$this->load->model("options_model");
		$this->load->model("option_choices_model");
		$this->load->model("info_model");

		$this->main = simplexml_load_file( base_url().config_item('source_xml_path') );
	}

	public function index()
	{
		echo "This is the parser. Maybe you shouldn't be here.";
	}

	public function options(){
		foreach ($this->main->options->menu as $option) {
			$option_id = strtolower($option->button->attributes()->id);
			$option_index = $this->options_model->add( array(
				'id' 							=> $option_id,
				'dealer_only'					=> 0,
				'image'							=> "fpo-option-image.jpg",
				'label'							=> rawurlencode($option->button->label),
			));

			foreach ($option->selection as $selection) {
				$this->option_choices_model->add( array(
					'id' 							=> strtolower($selection->attributes()->value),
					'dealer_only'					=> $selection->attributes()->dealerOnly,
					'dealer_price'					=> $selection->dealerprice,
					'price'							=> $selection->price,
					'image'							=> rawurlencode($selection->attributes()->image ),
					'label'							=> rawurlencode( $selection->label ),
					'option_index'					=> $option_index,
					'option_id'						=> $option_id
				));
			}
		}
	}

	public function info(){
		foreach ($this->main->windows->window[0]->info as $info) {
			$id = $info->attributes()->id;

			$info_index = $this->info_model->add( array(
				'dealer_only'					=> 0,
				'description'					=> rawurlencode($info->description),
				'image'							=> rawurlencode($info->attributes()->image )
			));

			if(strpos($id, "_")){
				//choice
				echo $id."<br />";

				$option_id = substr($id, 0, strpos($id, "_"));
				$option_choice_id = substr($id, strpos($id, "_")+1);

				$choice_result = $this->option_choices_model->get(array("option_id"=>$option_id,"id"=>$option_choice_id));
				$choice = $choice_result[0];
				$choice_index = $choice->index;

				$update_result = $this->option_choices_model->update( array( "index"=>$choice_index, "info_index"=>$info_index ) );
			} else {
				//option
				$option_result = $this->options_model->get( array( "id"=>rawurlencode($id) ) );
				$option = $option_result[0];
				$option_index = $option->index;

				$update_result = $this->options_model->update( array( "index"=>$option_index, "info_index"=>$info_index ) );
			}
		}
	}

	public function accessories(){

	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */