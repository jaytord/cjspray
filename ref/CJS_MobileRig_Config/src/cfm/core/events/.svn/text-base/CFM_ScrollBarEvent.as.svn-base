package cfm.core.events{
	
	import flash.events.Event;
	
	public class CFM_ScrollBarEvent extends Event {
		
		public static const SCROLLING:String = "scrolling";
		public var percent:Number;
		
		public function CFM_ScrollBarEvent( $type:String , $percent:Number, $bubbles:Boolean = true, $cancelable:Boolean = false ) {
			super($type, $bubbles, $cancelable);
			
			percent = $percent;
		}
	}
}