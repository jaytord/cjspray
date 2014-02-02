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
		$this->load->model("selections_model");
		$this->load->model("info_model");
		$this->load->model("dealer_model");
		$this->load->library("encrypt");
		$this->load->model("promocode_model");
	}

	public function fixexludes(){
		$_selections = $this->selections_model->get();

		foreach ($_selections as $_selection) {
			$_selection_value = $_selection->option_id."-".$_selection->id;
			echo "CHECKING SELECTION : " . $_selection_value ."<br />";

			if( !empty($_selection->exclude) ){
				$exclude = explode(":", $_selection->exclude);

				foreach ($exclude as $exclusion) {
					$option_id = substr($exclusion, 0, strpos($exclusion, "-"));
					$selection_id = substr( $exclusion, strpos($exclusion, "-") + 1 );

					echo "&nbsp&nbsp&nbspexception: ". $option_id.$selection_id."<br />";

					$_excluded_row = $this->selections_model->get( array("option_id"=>$option_id,"id"=>$selection_id) );
					$_excluded_row_exceptions = $_excluded_row[0]->exclude;
					$_has_exception = strpos( $_excluded_row_exceptions, $_selection_value) > -1;

					echo "&nbsp&nbsp&nbsp".$option_id.$selection_id." exceptions: ". $_excluded_row_exceptions."<br />";
					echo "&nbsp&nbsp&nbsphas the exception? ". ( $_has_exception ? "yes" : "no");
					echo "<br/>---<br/>";

					if(!$_has_exception){
						$_excluded_row_exceptions .= (":".$_selection_value);

						$this->selections_model->update( array(
								"index"=>$_excluded_row[0]->index, 
								"exclude"=>$_excluded_row_exceptions
							)
						);
					}
				}
			}
			echo "<br />";
		}
	}

	public function promocodes(){
		$row 				= 0;
		$_promo_codes 		= array();

		if( ($promo_file = fopen(base_url().config_item('csv_folder')."promo_codes.csv", "r")) !== FALSE ){
			while( $promo_csv = fgetcsv($promo_file, 2000, "," ) ){
				if( $row > 0 ) 
				{
					$value 				= array();
					$value['code'] 		= $promo_csv[0];
					$value['discount'] 	= rawurlencode( $promo_csv[1] );
					$value['title']		= rawurlencode( $promo_csv[2] );

					array_push($_promo_codes, $value);
				}
				$row++;
			}

			fclose($promo_file);
		}

		print_r($_promo_codes);

		//clear db records
		$this->promocode_model->clear();

		//create new records
		foreach ($_promo_codes as $key => $value) {		
			$result = $this->promocode_model->add($value);
		}
	}

	public function dealers(){
		$row 				= 0;
		$_dealers 			= array();

		if( ($dealer_file = fopen(base_url().config_item('csv_folder')."dealers.csv", "r")) !== FALSE ){
			while( $dealer_csv = fgetcsv($dealer_file, 2000, "," ) ){
				if( $row > 0 ) 
				{
					$value 					= array();
					$value['username'] 		= $dealer_csv[0];
					$value['company_name'] 	= rawurlencode( $dealer_csv[1] );
					$value['email'] 		= rawurlencode( $dealer_csv[2] );
					$value['phone']		 	= rawurlencode( $dealer_csv[3] );
					$value['password']		= $dealer_csv[4];


					array_push($_dealers, $value);
				}
				$row++;
			}

			fclose($dealer_file);
		}

		

		//clear db records
		$this->dealer_model->clear();

		//create new records
		foreach ($_dealers as $username => $value) {	
			$value["no-encrypt-password"] = $value["password"];	
			$password = $this->encrypt->encode($value["password"]);
			$value["password"] = $password;
			print_r($value);
			unset($value["no-encrypt-password"]);

			$result = $this->dealer_model->add($value);
		}

		
	}

	public function options(){
		//parse options
		$row 				= 0;
		$_options 			= array();

		if( ($options_file = fopen(base_url().config_item('csv_folder')."options.csv", "r")) !== FALSE ){
			while( $options_csv = fgetcsv($options_file, 2000, "," ) ){
				if( $row > 0 ) 
				{
					$value 					= (object) "value";
					$value->description 	= rawurlencode( $options_csv[1] );
					$value->selections 		= array();

					$_options[ $options_csv[0] ] = $value;
				}
				$row++;
			}

			fclose($options_file);
		}

		//parse selections
		$row 				= 0;

		if( ($selections_file = fopen(base_url().config_item('csv_folder')."selections.csv", "r")) !== FALSE ){
			while( $selections_csv = fgetcsv($selections_file, 2000, "," ) ){
				if( $row > 0 ) 
				{
					$selection 					= (object) 'selection';
					$selection->part_number	 	= $selections_csv[2];
					$selection->description 	= rawurlencode( $selections_csv[3] );
					$selection->exclude 		= $selections_csv[4];
					$selection->list_price		= str_replace(",", "", $selections_csv[5]);
					$selection->dealer_price	= str_replace(",", "", $selections_csv[6]);
					$selection->cj_price		= str_replace(",", "", $selections_csv[7]);
					$selection->cost_price		= str_replace(",", "", $selections_csv[8]);
					$selection->image			= $selections_csv[9];
					$selection->dealer_only		= $selections_csv[10] == "yes" ? 1 : 0;

					$_options[ $selections_csv[0] ]->selections[ $selections_csv[1] ] = $selection;
				}
				$row++;
			}

			fclose($selections_file);
		}

		print_r($_options);

		//parse info
		$row 				= 0;
		$_info_list 		= array();

		if( ($info_file = fopen(base_url().config_item('csv_folder')."info.csv", "r")) !== FALSE ){
			while( $info_csv = fgetcsv($info_file, 2000, "," ) ){
				if( $row > 0 ) 
				{
					$info 					= (object) 'info';
					$info->id 				= $info_csv[0];
					$info->description 		= rawurlencode( $info_csv[1] );
					$info->image 			= $info_csv[2];
					$info->dealer_only		= 0;

					array_push($_info_list, $info);
				}
				$row++;
			}

			fclose($info_file);
		}

		$this->clearall();

		//push to db
		foreach ($_options as $_option_id => $_option) {
			$option_index = $this->options_model->add( array(
				'id' 							=> $_option_id,
				'dealer_only'					=> 0,
				'image'							=> "fpo-option-image.jpg",
				'label'							=> $_option->description
			));

			//create selections records
			foreach ($_option->selections as $_selection_id => $_selection) {
				$this->selections_model->add(  array(
					'id' 							=> $_selection_id,
					'part_number'					=> $_selection->part_number,
					'description'					=> $_selection->description,
					'exclude'						=> $_selection->exclude,
					'dealer_only'					=> $_selection->dealer_only,
					'list_price'					=> $_selection->list_price,
					'dealer_price'					=> $_selection->dealer_price,
					'cj_price'						=> $_selection->cj_price,
					'cost_price'					=> $_selection->cost_price,
					'option_index'					=> $option_index,
					'option_id'						=> $_option_id,
					'image'							=> $_selection->image
				));
			}
		}

		foreach ($_info_list as $key=>$info) {
			$id = strtoupper( $info->id );

			$info_index = $this->info_model->add( array(
				'id'							=> $id,
				'dealer_only'					=> 0,
				'description'					=> $info->description,
				'image'							=> $info->image
			));

			if(strpos($id, "-")){
				//choice
				$option_id = substr($id, 0, strpos($id, "-"));
				$selection_id = substr( $id, strpos($id, "-") + 1 );

				$selection_result = $this->selections_model->get(array("option_id"=>$option_id,"id"=>$selection_id));
				$selection = $selection_result[0];
				$selection_index = $selection->index;

				$update_result = $this->selections_model->update( array( "index"=>$selection_index, "info_index"=>$info_index ) );
			} else {
				//option
				$option_result = $this->options_model->get( array( "id"=>$id ) );
				$option = $option_result[0];
				$option_index = $option->index;

				$update_result = $this->options_model->update( array( "index"=>$option_index, "info_index"=>$info_index ) );
			}
		}

		$this->fixexludes();
	}

	public function index()
	{
		echo "This is the parser. Maybe you shouldn't be here.";
	}

	private function clearall(){
		$this->options_model->clear();
		$this->selections_model->clear();
		$this->options_model->clear();
		$this->info_model->clear();
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */