package cfm.core.events
{
	import flash.events.Event;

	public class CFM_NavigationEvent extends Event
	{
		public static const BUTTON_CLICKED:String = "buttonClicked";
		
		public var index:Number;
		public var id:String;
		public var value:String;
		public var href:String;
		public var selected:Boolean;
		
		public function CFM_NavigationEvent(type:String, _index:Number, _id:String, _value:String, _href:String, _selected:Boolean, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			
			index = _index;
			id = _id;
			value = _value;
			href = _href;
			selected = _selected;
		}
		
	}
}