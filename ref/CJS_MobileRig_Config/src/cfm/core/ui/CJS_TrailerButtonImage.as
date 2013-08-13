package cfm.core.ui
{
	import cfm.core.graphics.CFM_BoxGraphics;
	import cfm.core.media.CFM_Image;
	import cfm.core.objects.CFM_Object;
	
	import cjs.config.AppConfig;
	
	import flash.display.GradientType;
	
	public class CJS_TrailerButtonImage extends CFM_Object
	{
		private var image:CFM_Image;
		private var imageMask:CFM_BoxGraphics;
		
		private const IMAGE_HEIGHT:Number = 200;
		private const IMAGE_WIDTH:Number = 200;
		private const PADDING_BOTTOM:Number = 2;
		
		private var url:String;
		
		public function CJS_TrailerButtonImage(_url:String)
		{
			url = _url;
			super("CJS_TrailerButtonImage", true, true);
		}
		
		override protected function build():void{
			image = new CFM_Image(AppConfig.IMAGES_DIRECTORY + url,IMAGE_WIDTH,IMAGE_HEIGHT);
			image.renderTo(this);
			image.setProperties({x:-1});
			
			imageMask = new CFM_BoxGraphics({width:IMAGE_WIDTH, height:IMAGE_HEIGHT-PADDING_BOTTOM, color:0, alpha:1, radius:[12,12,0,0]});
			imageMask.renderTo(this);
			
			image.mask = imageMask;
		}
		
		override public function get width():Number{
			return IMAGE_WIDTH;
		}
		
		override public function get height():Number{
			return IMAGE_HEIGHT;
		}
	}
}