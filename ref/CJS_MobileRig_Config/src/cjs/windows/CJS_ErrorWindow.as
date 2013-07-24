package cjs.windows
{
	import cfm.core.media.CFM_Image;
	
	import cjs.config.AppConfig;

	public class CJS_ErrorWindow extends CJS_WindowTemplate
	{
		private var infoTag:XML;
		protected var image:CFM_Image;
		
		public function CJS_ErrorWindow(_index:Number, _xml:XML, _params:Object)
		{
			super(_index, _xml, _params);
			
			WINDOW_WIDTH = 300;
		}
	}
}