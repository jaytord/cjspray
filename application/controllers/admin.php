<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Admin extends CI_Controller {

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
		$this->load->view("admin_view");
	}

	public function publish()
	{
		$post_data = $this->input->post();

		if($post_data){
			if($post_data["confirm"] == 1){
				$this->printXML();

				echo "...Published";
			} else if($post_data["confirm"] == 0){
				echo "...Publish Cancelled";
			}
			
			$this->load->view("admin_view");
		} else {
			$this->load->view("confirm_view",array("action"=>"publish"));
		}
	}

	private function printXML(){
		$this->load->model("options_model");
		$this->load->model("option_choices_model");
		$this->load->model("info_model");

		$root_node 		= new SimpleXMLElement("<configurator></configurator>");
		$options_node 	= $root_node->addChild("options");
		$info_node 		= $root_node->addChild("info");

		$options 		= $this->options_model->get();
		$info 			= $this->info_model->get();

		$option_fields 	= $this->options_model->fields();
		$choice_fields 	= $this->option_choices_model->fields();
		$info_fields	= $this->info_model->fields();

		//building the options nodes
		foreach ($options as $o_key => $o_value) {
			$option_node = $options_node->addChild("option");
			
			//add the attributes and children for this option
			foreach ($option_fields as $of_key => $of_value) {
				if($of_value["type"] == "child")
					$option_node->addChild($of_key, $o_value->{$of_key});
				else
					$option_node->addAttribute($of_key, $o_value->{$of_key});
			}

			$selections = $this->option_choices_model->get(array("option_index"=>$o_value->index));

			//add the choice nodes for this option
			foreach ($selections as $c_key => $c_value) {
				$choice_node = $option_node->addChild("choice");
				
				//add the attributes and children for this choice
				foreach ($choice_fields as $cf_key => $cf_value) {
					if($cf_value["type"] == "child")
						$choice_node->addChild($cf_key, $c_value->{$cf_key});
					else
						$choice_node->addAttribute($cf_key, $c_value->{$cf_key});
				}
			}
		}

		//building the info nodes
		foreach ($info as $i_key => $i_value) {
			$info_item_node = $info_node->addChild("item");

			//add the attributes and children for this info node
			foreach ($info_fields as $if_key => $if_value) {
				if($if_value["type"] == "child")
					$info_item_node->addChild($if_key, $i_value->{$if_key});
				else
					$info_item_node->addAttribute($if_key, $i_value->{$if_key});
			}
		}

		//save the xml file
		$root_node->asXML(config_item("data_xml_path"));

		echo "Printing xml complete.";
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */