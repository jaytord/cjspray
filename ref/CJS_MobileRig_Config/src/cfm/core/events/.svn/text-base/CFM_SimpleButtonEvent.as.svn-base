package cfm.core.events
{
	import flash.events.Event;

	public class CFM_SimpleButtonEvent extends Event
	{
		public static const BUTTON_CLICKED:String = "buttonClicked";
		public static const CLOSE_CLICKED:String = "closeClicked";
		public var index:Number;
		public var id:String;
		public var value:String;
		public var labelText:String;
		public var href:String;
		public var isSelected:Boolean;
		
		public function CFM_SimpleButtonEvent(type:String, _index:Number, _id:String, _value:String, _labelText:String = "", _href:String = "", bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			
			index = _index;
			id = _id;
			value = _value;
			labelText = _labelText;
			href = _href;
		}
		
	}
}