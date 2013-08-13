package cjs.events
{
	import flash.events.Event;
	
	public class CJS_DealerEvent extends Event
	{
		public static var LOG_IN:String = "logIn";
		public static var LOG_OUT:String = "logOut";
		
		public var success:Boolean;
		public var username:String;
		
		public function CJS_DealerEvent(type:String, _username:String, _success:Boolean, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			
			username = _username;
			success = _success;
		}
	}
}