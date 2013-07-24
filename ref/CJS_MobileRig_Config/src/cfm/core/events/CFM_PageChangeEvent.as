package cfm.core.events
{
	import flash.events.Event;
	
	public class CFM_PageChangeEvent extends Event
	{
		public static const CHANGE_PAGE:String = "changePage";
		public static const NEXT_PAGE:String = "nextPage";
		public static const PREVIOUS_PAGE:String = "previousPage";
		public static const CLOSE_WINDOW:String = "closeWindow";
		
		public var id:String;
		public var params:Object;
		
		public function CFM_PageChangeEvent(type:String, _id:String = "", _params:Object = null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			
			id = _id;
			params = _params;
		}
	}
}