package cfm.core.away.utils
{
	import cfm.core.away.utils.ISnapshotPlayer;
	import cfm.core.events.SnapshotPlayerEvent;
	import cfm.core.objects.CFM_Object;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	[Event(name="hitTest", type="cfm.core.events.SnapshotPlayerEvent")]
	
	public class SnapshotPlayer extends CFM_Object implements ISnapshotPlayer {
		static public const NORMAL_MODE:String = "normalMode";
		static public const HIT_TEST_MODE:String = "hitTestMode";
		
		private var frames:Vector.<BitmapData>;
		private var currentFrameIndex:int;
		private var dir:int = -1;
	
		private var loop:Boolean = true;
		private var _playing:Boolean = false;
		private var _mode:String;
		
		private var canvas:Bitmap;
		private var _canvasWidth:int;
		private var _canvasHeight:int;
		
		public function SnapshotPlayer(frames:Vector.<BitmapData>, _width:int, _height:int, mode:String = "normalMode") {			
			super("", true, true);
			
			this.frames = frames;
			
			_canvasWidth = _width;
			_canvasHeight = _height;
			
			_mode = mode;
			
		}
		
		override protected function build():void {
			canvas = new Bitmap();
			canvas.bitmapData = new BitmapData(_canvasWidth, _canvasHeight, true, 0x00000000);		
			
			addChild(canvas);
						
			currentFrameIndex = 0;
			setFrame(0);
			
		}
		
		override protected function addListeners():void {
			if (mode == "hitTestMode") addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
		}
		
		override protected function removeListeners():void {
			if (mode == "hitTestMode") removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
		}
		
		private function onMouseMove(e:MouseEvent):void {
			var color:int = canvas.bitmapData.getPixel(e.localX, e.localY);
			dispatchEvent(new SnapshotPlayerEvent(SnapshotPlayerEvent.HIT_TEST, color));
		}
		
		public function get mode():String {
			return _mode;
		}
	
		public function get canvasWidth():int {
			return _canvasWidth;
		}
		
		public function get canvasHeight():int {
			return _canvasHeight;
		}
		
		public function get currentFrame():int {
			return currentFrameIndex;
		}
		
		public function get totalFrames():int {
			return frames.length;
		}
		
		public function toggleDirection():void {
			dir = -dir;
		}

		public function play():void {
			if (_playing) return;
			_playing = true;
			addEventListener(Event.ENTER_FRAME, updateFrame);
		}
		
		public function stop():void {
			if (!_playing) return;
			_playing = false;
			removeEventListener(Event.ENTER_FRAME, updateFrame);
		}
		
		private function updateFrame(e:Event = null):void {
			setFrame(updateFrameIndex());
		}
		
		private function updateFrameIndex():int {
			currentFrameIndex += dir;
			
			if (loop) {
				currentFrameIndex += frames.length; 
				currentFrameIndex %= frames.length;
			} else if (currentFrameIndex == frames.length || currentFrameIndex == -1) {
				currentFrameIndex -= dir;
				stop();
			}
			
			return currentFrameIndex;
		}
		
		public function setFrame(index:int):void {
			canvas.bitmapData.copyPixels(frames[index], new Rectangle(0, 0, frames[index].width, frames[index].height), new Point());
		}
		
		public function getBoundsByColor(color:int):Rectangle {
			return canvas.bitmapData.getColorBoundsRect(0xFFFFFFFF, color | 0xFF000000, true);
		}
		
		public function setFrameByPercent(percent:Number):void {
			setFrame(int(Math.round(percent * frames.length)));
		}
		
		public function applyRegion(rect:Rectangle, color:int):void {
			for each(var frame:BitmapData in frames) {
				frame.fillRect(rect, color);
			}
		}
	}
}
