package cfm.core.events{
	
	import flash.display.Bitmap;
	import flash.events.Event;
	
	public class CFM_ThumbnailEvent extends Event {
		
		public static const THUMBNAIL_SELECTED:String = "thumbnailSelected";
		public var index:Number;
		public var id:String;
		public var bm:Bitmap;
		public var value:String;
		
		public function CFM_ThumbnailEvent( $type:String , _index:Number, _id:String, _value:String, _bm:Bitmap, $bubbles:Boolean = true, $cancelable:Boolean = false ) {
			super($type, $bubbles, $cancelable);
			
			index = _index;
			id = _id;
			bm = _bm;
			value = _value;
		}
	}
}