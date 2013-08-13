package cfm.core.away.utils {
	import flash.display.DisplayObjectContainer;
	import flash.errors.IllegalOperationError;
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.geom.Rectangle;
	
	public class NullPlayer implements ISnapshotPlayer, IEventDispatcher {
		public function NullPlayer() {}
		
		public function renderTo(_parent:DisplayObjectContainer, index:Number=Number.NaN):void {}
		
		public function play():void {}
		
		public function stop():void {}
		
		public function setFrame(index:int):void {}
		
		public function getBoundsByColor(color:int):Rectangle { return new Rectangle();}
		
		public function setFrameByPercent(percent:Number):void {}
		
		public function remove():void {}
		
		public function setProperties(_prop:Object):void {}
		
		public function get mode():String { return "NULL Player"; }
		
		public function get canvasWidth():int { return 0;}
		
		public function get canvasHeight():int { return 0;}
		
		public function get currentFrame():int { return 0;}
		
		public function get totalFrames():int { return 0;}
		
		public function toggleDirection():void {}
		
		public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void {}
		
		public function dispatchEvent(event:Event):Boolean { return false; }
		
		public function hasEventListener(type:String):Boolean { return false; }
		
		public function removeEventListener(type:String, listener:Function, useCapture:Boolean = false):void {}
		
		public function willTrigger(type:String):Boolean { return false; }
		
		public function applyRegion(rect:Rectangle, color:int):void {}
	}
}