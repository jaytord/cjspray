package cfm.core.events {
	import flash.display.BitmapData;
	import flash.events.Event;
	
	public class SnapshotToolEvent extends Event {
		static public const SNAPSHOT_PROGRESS:String = "snapshotProgress";
		static public const SNAPSHOT_COMPLETE:String = "snapshotComplete";
		
		public var framesGenerated:int;
		public var framesTotal:int;
		public var bitmaps:Vector.<BitmapData>;
		public var hitBitmaps:Vector.<BitmapData>;
		
		public function SnapshotToolEvent(type:String, _framesGenerated:int, _framesTotal:int, _bitmaps:Vector.<BitmapData>, _hitBitmaps:Vector.<BitmapData>, bubbles:Boolean=false, cancelable:Boolean=false) {
			super(type, bubbles, cancelable);
			
			framesGenerated = _framesGenerated;
			framesTotal = _framesTotal;
			bitmaps = _bitmaps;
			hitBitmaps = _hitBitmaps;
		}
	}
}