package cjs.events
{
	import flash.events.Event;
	
	public class CJS_ModeEvent extends Event
	{
		public static const MODE_CHANGED:String = "modeChanged";
		
		public static const TRAILER_MODE:String = "TrailerMode";
		public static const OPTIONS_MODE:String = "OptionsMode";
		public static const CONFIG_MODE:String = "ConfigMode";
		public static const ACCESSORY_MODE:String = "AccessoryMode";
		
		public var mode:String;
		
		public function CJS_ModeEvent(type:String, _mode:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			mode = _mode;
			
			super(type, bubbles, cancelable);
		}
	}
}