package cfm.core.events
{
	import flash.events.Event;
	import flash.display.Bitmap;

	public class CFM_ImageEvent extends Event
	{
		public static const IMAGE_LOADER_COMPLETE:String = "ImageLoaderComplete";
		public static const IMAGE_LOADER_PROGRESS:String = "imageLoaderProgress";
		
		public var url:String;
		public var bmp:Bitmap;
		public var percent:Number;
		
		public function CFM_ImageEvent(type:String, $url:String, $bmp:Bitmap, $percent:Number, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			url = $url;
			bmp = $bmp;
			percent = $percent;
			super(type, bubbles, cancelable);
		}
	}
}