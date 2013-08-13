package cfm.core.away
{
	import away3d.cameras.HoverCamera3D;
	import away3d.containers.View3D;
	import away3d.core.base.Object3D;
	
	import cfm.core.objects.CFM_Object;
	
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.geom.Vector3D;
	
	public class CFM_BaseTemplate extends CFM_Object
	{
		public var view:View3D;
		private var target:Vector3D;
		private var camera:HoverCamera3D;
		
		private var defaultTilt:Number = 10;
		private var defaultPan:Number = 0;
		
		public function CFM_BaseTemplate(_autoInit:Boolean=true, _autoDestroy:Boolean=true)
		{
			super("CFM_BaseTemplate", _autoInit, _autoDestroy);
		}
		
		override protected function build():void{
			view = new View3D({stats:false});
			addChild(view);
			
			camera = new HoverCamera3D({tiltAngle:defaultTilt, panAngle:defaultPan, lookAt:"center"});
			view.camera = camera;
			
			camera.hover(true);
			
			start();
		}
		
		public function start():void{
			if(!hasEventListener(Event.ENTER_FRAME)){
				addEventListener(Event.ENTER_FRAME, render);
			}
		}
		
		public function stop():void{
			if(hasEventListener(Event.ENTER_FRAME)){
				removeEventListener(Event.ENTER_FRAME, render);
			}
		}
		
		public function addObject(child:Object3D):void{
			view.scene.addChild(child);
		}
		
		public function removeObject(child:Object3D):void{
			view.scene.removeChild(child);
		}
		
		private function render(e:Event):void {
			hoverCamera();
			view.render();
		}
		
		override protected function destroy(e:Event):void{
			stop();
			super.destroy(e);
		}
		
		private function hoverCamera(_jump:Boolean = false):void{
			var newAngle:Number = camera.panAngle + (stage.mouseX-(stage.stageWidth/2))/40;
			
			if(newAngle < -90){
				newAngle = -90;
			} else if(newAngle > 90){
				newAngle = 90;
			}
			
			camera.panAngle = newAngle;
			camera.hover(_jump);
		}
	}
}