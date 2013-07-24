package cfm.core.events {
	import flash.events.Event;
	
	public class SnapshotPlayerEvent extends Event {
		static public const HIT_TEST:String = "hitTest";
		
		public var color:int;
		public function SnapshotPlayerEvent(type:String, _color:int, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			color = _color;
		}
	}
}