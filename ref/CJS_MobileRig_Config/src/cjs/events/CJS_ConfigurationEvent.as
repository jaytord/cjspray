package cjs.events
{
	import flash.display.BitmapData;
	import flash.events.Event;
	
	public class CJS_ConfigurationEvent extends Event
	{
		public static const OPTION_CHANGED		:String = "optionChanged";
		public static const RESET_ALL			:String = "resetAll";
		public static const IMAGE_CHANGED		:String = "imageChanged";
		public static const ACCESSORYS_CHANGED	:String = "accessoryChanged";
		
		public var menuValue					:String;
		public var itemValue					:String;
		public var totalPrice					:String;
		public var bitmapData					:BitmapData;
		
		public function CJS_ConfigurationEvent(type:String, _menuValue:String, _itemValue:String, _totalPrice:String, _bitampData:BitmapData = null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			
			menuValue 			= _menuValue;
			itemValue 			= _itemValue;
			totalPrice 			= _totalPrice;
			bitmapData			= _bitampData;
		}
	}
}