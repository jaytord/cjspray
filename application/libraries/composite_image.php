<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Composite_Image
{
	protected $CI;

	public function __construct()
	{
        $this->CI =& get_instance();
	}

	public function generate( $_imagelist, $_ts )
	{					
		$filefolder					= config_item('rig_image_directory');	
		$filename 					= 'myrig_' . $_ts .".jpg";
		$filepath					= $filefolder.$filename;
		
		$image1 = imagecreatefromjpeg( $_imagelist[0]['filename'] );
		$w  = imagesx($image1);
		$h  = imagesy($image1);

		foreach ($_imagelist as $key => $value) {
			if($key > 0 && $value['type'] == "png" ){
				$url = config_item('image_dir_path').substr($value['filename'], strpos($value['filename'],"img/")+4);
				if(file_exists( $url )){
					$_img = imagecreatefrompng( $value['filename'] );
					imagecopyresampled($image1,$_img,0,0,0,0,$w,$h,$w,$h);
					imagedestroy($_img);
				}
			}
		}

		//save image to folder
		imagejpeg($image1, $filepath);

		//cleanup
		imagedestroy($image1);

		return $filepath;
	}	

}
