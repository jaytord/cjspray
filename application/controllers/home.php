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
		$this->load->model("options_model");
		$this->load->model("selections_model");

		$options 		= $this->options_model->get();

		foreach ($options as $key => $value) {
			$value->selections = $this->selections_model->get(array("option_index"=>$value->index));
		}

		$this->load->view('home_view',array("options"=>$options));
	}

	public function info($index,$title)
	{
		$this->load->model("info_model");
		$info_data = $this->info_model->get(array("index"=>$index));

		if(!empty($title))
		$info_data->title  = $title;

		$this->load->view("info_view", array('data'=>$info_data));
	}

	public function createpdf(){
		$this->load->library("composite_image");
		$post = $this->input->post();
		$ts = time();

		$post["selections"] 	= json_decode($post["selections"], true);
		$post["price"] 			= json_decode($post["price"], true );
		$post["promo"] 			= json_decode($post["promo"], true );
		$post["dealer"]			= json_decode($post["dealer"], true );

		$dealer = empty( $post["dealer"] ) ? "false" : "true";

		$image_url = base_url().$this->composite_image->generate( $post["selections"]["images"], $ts );

		$filename = 'myrig-'. $ts;
		$filepath = FCPATH."/downloads/pdfs/$filename.pdf";

		$post['image_url'] = $image_url;

		if(file_exists($filepath) == FALSE){
			ini_set('memory_limit','32M');

			$this->load->library('pdf');
			$pdf = $this->pdf->load();

			//page 1: end user pdf has cjprice plus promo discounted price (you_price);
			$post["price_label"] = "CJ Price"; 
			$post["price_value"] = "cj"; 
			$post["option_price_value"] = "cj_price"; 
			$post["show_list_price"] = true;
			$post["show_footer"] = $dealer ? false : true;
			$enduser_page = $this->load->view('pdf_page_view', $post, true);
			$pdf->WriteHTML( $enduser_page );

			if($dealer){
				$pdf->WriteHTML( "<pagebreak />");

				//page 2 (dealer): dealer pdf has dealer price;
				$post["dealer"]["logo"] = '';
				$post["price_label"] = "Dealer Price"; 
				$post["price_value"] = "dealer"; 
				$post["option_price_value"] = "dealer_price"; 
				$post["show_list_price"] = false;
				$post["show_footer"] = true;
				unset( $post["you_price"] );

				$dealer_page = $this->load->view('pdf_page_view', $post, true);
				$pdf->WriteHTML( $dealer_page );

				if($post['dealer']['type_id'] == 2){
					$pdf->WriteHTML( "<pagebreak />");

					//page 3 (graco): graco dealer pdf has dealer price column, and graco price column;
					$post["dealer"]["logo"] = 'graco.png';
					$post["price_label"] = "Graco Price"; 
					$post["option_price_value"] = "graco_price"; 
					$post["price_value"] = "graco"; 
					$post["show_footer"] = false;
					$graco_page = $this->load->view('pdf_page_view', $post, true);
					$pdf->WriteHTML( $graco_page );
				}
			}

			$pdf->Output( $filepath, 'F' );
		}

		redirect( base_url()."downloads/pdfs/$filename.pdf" );
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */