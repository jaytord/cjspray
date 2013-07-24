package cfm.core.away.utils {
	import flash.display.DisplayObjectContainer;
	import flash.events.IEventDispatcher;
	import flash.geom.Rectangle;
	
	public interface ISnapshotPlayer extends IEventDispatcher{
		function renderTo(_parent:DisplayObjectContainer, index:Number=Number.NaN):void;
		function play():void;
		function stop():void;
		function getBoundsByColor(color:int):Rectangle;
		function setFrame(index:int):void;
		function setFrameByPercent(percent:Number):void;
		function remove():void;
		function setProperties(_prop:Object):void;		
		function get mode():String;
		function get canvasWidth():int;
		function get canvasHeight():int;
		function get currentFrame():int;
		function get totalFrames():int;
		function toggleDirection():void;
		function applyRegion(rect:Rectangle, color:int):void;
	}
}