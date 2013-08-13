package cjs.events
{
	import flash.events.Event;
	
	public class CJS_infoButtonEvent extends Event
	{
		public static var OPEN_INFO:String = "openInfo";
		
		public var id:String;
		public var params:Object;
		
		public function CJS_infoButtonEvent(type:String, _id:String = "", _params:Object = null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			
			id = _id;
			params = _params;
		}
	}
}