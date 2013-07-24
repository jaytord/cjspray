package cjs.events
{
	import flash.events.Event;
	
	public class CJS_MenuPanelEvent extends Event
	{
		public static const PANEL_ACTIVE		:String = "panelActive";
		public static const ITEM_SELECTED		:String = "itemSelected";
		
		public var panelIndex					:Number;
		public var menuIndex					:Number;
		public var menuValue					:String;
		public var itemIndex					:Number;
		public var itemValue					:String;

		public function CJS_MenuPanelEvent(type:String, _panelIndex:Number, _menuIndex:Number, _menuValue:String, _itemIndex:Number, _itemValue:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			
			panelIndex 		= _panelIndex;
			menuIndex 		= _menuIndex;
			menuValue 		= _menuValue;
			itemIndex 		= _itemIndex;
			itemValue 		= _itemValue;
		}
	}
}