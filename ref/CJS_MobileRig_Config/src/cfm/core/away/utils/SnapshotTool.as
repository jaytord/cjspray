package cfm.core.away.utils {
	import away3dlite.cameras.HoverCamera3D;
	import away3dlite.containers.Scene3D;
	import away3dlite.containers.View3D;
	import away3dlite.core.base.Object3D;
	import away3dlite.core.clip.RectangleClipping;
	import away3dlite.core.render.BasicRenderer;
	import away3dlite.core.render.FastRenderer;
	
	import cfm.core.away.FastHoverTemplate;
	import cfm.core.away.utils.SnapshotPlayer;
	import cfm.core.events.SnapshotToolEvent;
	
	import com.greensock.TweenMax;
	
	import flash.display.BitmapData;
	import flash.display.Stage;
	import flash.events.EventDispatcher;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	import flash.geom.Vector3D;
	
	import petsmart.managers.SnapshotManager;
	import petsmart.model.AppModel;
	
	[Event(name="snapshotProgress", type="cfm.core.events.SnapshotToolEvent")]
	[Event(name="snapshotComplete", type="cfm.core.events.SnapshotToolEvent")]
	
	public class SnapshotTool extends EventDispatcher {
		private var view:View3D;
		private var hoverCamera:HoverCamera3D;
		private var stage:Stage;
		
		private var minPanAngle:Number = -180;
		private var minTiltAngle:Number = 0//12.5;
		
		private var maxPanAngle:Number = 180;
		private var maxTiltAngle:Number = 0//12.5;
		
		private var panDelta:Number = 360;
		private var tiltDelta:Number = 0;
		
		private var width:Number;
		private var height:Number;
		private var useStageDimensions:Boolean;
		
		private var mat:Matrix;
		private var frames:Vector.<BitmapData>;
		private var hitFrames:Vector.<BitmapData>;
		
		private var camTarget:Object3D;
		private var camTargetPos:Vector3D;
		
		private var totalFrames:Number = 0;
		private var base:FastHoverTemplate;
		
		private var _model:AppModel;
		private var _snapshotManager:SnapshotManager;
		
		public function SnapshotTool(stage:Stage, _view:View3D, _useStageDimensions:Boolean = true, _width:Number=0, _height:Number=0) {			
			this.stage = stage;
			_model = AppModel.inst;
			_snapshotManager = _model.snapshots;
			
			useStageDimensions = _useStageDimensions;
			width = (useStageDimensions)?stage.stageWidth:_width;
			height = (useStageDimensions)?stage.stageHeight:_height;

			camTarget = new Object3D();
			camTarget.x = camTarget.y = camTarget.z = 0;
			//_scene.addChild(camTarget);
			view = _view;
			hoverCamera = new HoverCamera3D(10, 100, camTarget, 0, 0, 1000);
			//view = new View3D(_scene, null);
			view.camera = hoverCamera;
			view.visible = false;
			
			mat = new Matrix();
			mat.tx = width*.5;
			mat.ty = height*.5;
		}
		
		public function set scene(s:Scene3D):void{view.scene = s;}
		public function get scene():Scene3D{return view.scene;}
		
		public function setAngularBounds(_minPanAngle:Number, _maxPanAngle:Number, _minTiltAngle:Number, _maxTiltAngle:Number):void {
			minPanAngle = _minPanAngle;
			maxPanAngle = _maxPanAngle;
			
			minTiltAngle = (_minTiltAngle <= -90) ? -90:_minTiltAngle;
			maxTiltAngle = (_maxTiltAngle >= 90) ? 90:_maxTiltAngle;
			
			panDelta = maxPanAngle - minPanAngle;
			tiltDelta = maxTiltAngle - minTiltAngle;
		}
		
		public function setCamTargetPos(_pos:Vector3D):void{
			camTarget.x = _pos.x;
			camTarget.y = _pos.y;
			camTarget.z = _pos.z;
		}
		
		private function prepForShoot():void {
			view.x = width*.5;
			view.y = height*.5;
			stage.addChild(view);
			frames = new Vector.<BitmapData>();
			hitFrames = new Vector.<BitmapData>();
		}
		
		private function clearShoot():void{
			//view.clear();
			stage.removeChild(view);
			frames = new Vector.<BitmapData>();
			hitFrames = new Vector.<BitmapData>();
		}
		
		private function takeSnapShot():void {
			var multiplier:Number = (totalFrames == 1)?0:frames.length/(totalFrames - 1);
			var panAngle:Number = minPanAngle + (panDelta * multiplier);
			var tiltAngle:Number = minTiltAngle + (tiltDelta * multiplier);
			
			//trace("takeSnapShot ::::: " + frames.length/(totalFrames - 1));
				
			hoverCamera.tiltAngle = tiltAngle;
			hoverCamera.panAngle = panAngle;
			
			hoverCamera.hover(true);
			
			view.render();
			
			var frame:BitmapData = new BitmapData(width, height, true, 0x00000000);
			frame.draw(view,mat,null,null,null,true);
			frames.push(frame);
			
			_snapshotManager.applyCharacterColorTransforms();
			
			view.render();
			
			var hitFrame:BitmapData = new BitmapData(width, height, true, 0x00000000);
			hitFrame.draw(view,mat,null,null,null,true);
			hitFrames.push(hitFrame);
			
			_snapshotManager.revertCharacterColorTransforms();
			
			dispatchEvent(new SnapshotToolEvent(SnapshotToolEvent.SNAPSHOT_PROGRESS,frames.length, totalFrames,null,null));
			frames.length == totalFrames ? shootComplete() : TweenMax.delayedCall(0.0001,takeSnapShot);
		}
		
		public function generateFrames(numFrames:int = 30):void{			
			totalFrames = numFrames;
			prepForShoot();
			takeSnapShot();
		}
		
		public function shootComplete():void{
			//trace("shootComplete");
			dispatchEvent(new SnapshotToolEvent(SnapshotToolEvent.SNAPSHOT_COMPLETE, totalFrames, totalFrames,frames, hitFrames));
			clearShoot();
		}
	}
}