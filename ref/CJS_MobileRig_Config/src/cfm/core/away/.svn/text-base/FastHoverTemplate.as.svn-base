package cfm.core.away
{
	import away3dlite.cameras.HoverCamera3D;
	import away3dlite.primitives.Cube6;
	import away3dlite.templates.BasicTemplate;
	
	import com.greensock.TweenMax;
	
	import flash.display.StageQuality;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	public class FastHoverTemplate extends BasicTemplate
	{
		public var hoverCam:HoverCamera3D;
		private var cameraTarget:Cube6;
		
		private const defaultTilt:int = 10;
		private const defaultPan:int = -10;
		
		public function FastHoverTemplate()
		{
			super();
		}
		
		override protected function onInit():void{
			stage.quality = StageQuality.HIGH;
			
			cameraTarget = new Cube6(null,10,10,10,1,1,1);
			cameraTarget.visible = false;
			scene.addChild(cameraTarget);
			
			hoverCam = new HoverCamera3D();
			hoverCam.tiltAngle = defaultTilt;
			hoverCam.panAngle = defaultPan;
			hoverCam.target = cameraTarget;
			
			view.camera = hoverCam;
			
			view.x = 0;
			view.y = 0;
			
			stop();
			render();
		}
		
		public function moveTarget(_x:Number, _y:Number, _z:Number, _speed:Number = 1, _delay:Number = 0):void{
			TweenMax.killTweensOf(cameraTarget);
			TweenMax.to(cameraTarget, _speed, {delay:_delay, x:_x, y:_y, z:_z});
		}
		
		public function resetCam():void{
			hoverCam.tiltAngle = defaultTilt;
			hoverCam.panAngle = defaultPan;
		}
		
		public function render():void{
			hoverCam.hover(true);
			view.render();
		}
	}
}