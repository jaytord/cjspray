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

		// echo "dealer".((empty( $post["dealer"] ) == TRUE)? "true" : "false");
		// print_r( $post["promo"] );
		// print_r( $post["dealer"] );

		$image_url = base_url().$this->composite_image->generate( $post["selections"]["images"], $ts );

		$filename = 'myrig-'. $ts;
		$filepath = FCPATH."/downloads/pdfs/$filename.pdf";

		$post['image_url'] = $image_url;

		if(file_exists($filepath) == FALSE){ini_set('memory_limit','32M');
			$html = $this->load->view('pdf_view', $post, true);

			$this->load->library('pdf');$pdf = $this->pdf->load();

			$pdf->SetFooter($_SERVER['HTTP_HOST'].'|{PAGENO}|'.date(DATE_RFC822));
			$pdf->WriteHTML($html);$pdf->Output($filepath, 'F');
		}

		redirect( base_url()."downloads/pdfs/$filename.pdf" );
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */