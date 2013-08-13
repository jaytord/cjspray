package cfm.core.away.containers
{
	import away3d.cameras.Camera3D;
	import away3d.cameras.HoverCamera3D;
	import away3d.cameras.TargetCamera3D;
	import away3d.cameras.lenses.PerspectiveLens;
	import away3d.containers.ObjectContainer3D;
	import away3d.containers.Scene3D;
	import away3d.containers.View3D;
	import away3d.core.base.Object3D;
	import away3d.core.clip.FrustumClipping;
	import away3d.core.geom.Plane3D;
	import away3d.core.math.Number3D;
	import away3d.materials.BitmapFileMaterial;
	import away3d.materials.ColorMaterial;
	import away3d.primitives.Cube;
	import away3d.primitives.Plane;
	
	import cfm.core.away.objects.CFM_Object3D;
	import cfm.core.interfaces.IResize;
	import cfm.core.managers.CFM_ResizeManager;
	import cfm.core.objects.CFM_Object;
	
	import com.greensock.OverwriteManager;
	import com.greensock.TweenMax;
	import com.greensock.easing.Back;
	import com.greensock.easing.Circ;
	import com.greensock.easing.Cubic;
	import com.greensock.easing.Sine;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class CFM_BaseScene extends CFM_Object implements IResize
	{
		public var camera:HoverCamera3D;
		private var cameraTarget:Cube; 
		private var initTilt:Number;
		public var panEnabled:Boolean = true;
		private var cameraRotationOffsetObjects:Array = [];
		public var view:View3D;
		private var floor:Plane;
		public var cameraStartDistance:Number = -700;
		private var cameraDisabledDistance:Number = -1600;
		private var renderEnabled:Boolean = true;
		private var defaultPanAngle:Number = 0;
		private var defaultPanChanging:Boolean = false;
		public var yAdjuster:Array = [];
		
		public function CFM_BaseScene(_initViewList:Array, _initTilt:Number)
		{
			initTilt = _initTilt;
			
			super("CFM_BaseScene");
		}
		
		override protected function build():void{
			cameraTarget = new Cube({width:10, depth:10, height:10, segmentsD:1, segmentsH:1, segmentsW:1, visible:false});
			
			camera = new HoverCamera3D({tiltAngle:initTilt, panAngle:0, distance:cameraStartDistance, target:cameraTarget});
			camera.hover(true);
			camera.steps = 10;
			
			view = new View3D({camera:camera, clipping:new FrustumClipping({minZ:10})});
			stage.addChild(view);
			
			view.scene.addChild(cameraTarget);
			
			moveTarget(0,0,0,0);
		}
		
		public function moveTarget(_x:Number, _y:Number, _z:Number, _speed:Number = 0, _delay:Number = 0):void{
			TweenMax.to(cameraTarget, _speed, {delay:_delay, ease:Sine.easeInOut, x:_x, y:_y, z:_z, overwrite:OverwriteManager.AUTO});
		}
		
		public function zoomCamera(_dist:Number, _speed:Number = 0, _delay:Number = 0):void{
			TweenMax.to(camera, _speed, {delay:_delay, ease:Sine.easeInOut, distance:_dist, overwrite:OverwriteManager.AUTO});
		}
		
		override protected function addListeners():void{
			addEventListener(Event.ENTER_FRAME, render);
		}
		
		public function enablePan():void{
			TweenMax.killTweensOf(cameraTarget);
			TweenMax.killTweensOf(camera);
			
			//panEnabled = true;
		}
		
		public function disablePan():void{
			TweenMax.killTweensOf(cameraTarget);
			TweenMax.killTweensOf(camera);
			
			panEnabled = false;
		}
		
		override protected function removeListeners():void{
			removeEventListener(Event.ENTER_FRAME, render);
		}
		
		private function mousePan():void{
			if(stage.mouseX < stage.stageWidth && stage.mouseY < stage.stageHeight && stage.mouseX > 0 && stage.mouseY > 0){
				var xOffset:Number = 0;
				var yOffset:Number = 0;
				
				if(panEnabled && !defaultPanChanging && stage.mouseY < stage.stageHeight-150){
					if(stage.mouseX > (stage.stageWidth/2)+200){
						xOffset = (stage.mouseX - ((stage.stageWidth/2)+200))/200;
					} else if(stage.mouseX < (stage.stageWidth/2)-200){
						xOffset = (stage.mouseX - ((stage.stageWidth/2)-200))/200;
					}
					
					yOffset = (stage.mouseY-(stage.stageHeight/2))/-400;
					
					if(xOffset > 0 && camera.panAngle <= 60){
						camera.panAngle += xOffset;
					} else if(xOffset < 0 && camera.panAngle >= -60){
						camera.panAngle += xOffset;
					}
					
					camera.tiltAngle = yOffset + initTilt;
				} /*else {
				if(!defaultPanChanging){
				xOffset = (stage.mouseX-(stage.stageWidth/2))/-200;
				yOffset = (stage.mouseY-(stage.stageHeight/2))/-400;
				camera.panAngle = defaultPanAngle + xOffset;
				}
				}*/
				
				for each(var o:CFM_ObjectContainer3D in cameraRotationOffsetObjects){
					TweenMax.to(o, .6, {rotationY:camera.rotationY});
					//o.rotationY = camera.rotationY;
				}
				
				for each(var c:ObjectContainer3D in yAdjuster){
					var adjust:Number =  ( Math.sin(90+camera.panAngle*(Math.PI/180)) + 1)/2;
					TweenMax.to(c,.5,{y:20-(adjust*170), ease:Sine.easeInOut});
				}
				
				camera.hover();
			}
		}
		
		public function setDefaultPan(_angle:Number, _speed:Number = 0, _delay:Number = 0, _onComplete:Function = null, _onCompleteParams:Array = null):void{
			var numRotations:Number = Math.round(camera.panAngle/360);
			TweenMax.killDelayedCallsTo(changeDefaultPanComplete);
			
			defaultPanChanging = true;
			defaultPanAngle = (360*numRotations) + _angle;
			
			_speed += 100/(Math.abs(camera.panAngle-defaultPanAngle)+.1);
			
			if(Math.abs(defaultPanAngle - camera.panAngle) > 180){
				defaultPanAngle -= 360;
			}
			
			TweenMax.to(camera, 1, {ease:Sine.easeInOut, panAngle:defaultPanAngle});
			TweenMax.delayedCall(3, changeDefaultPanComplete,[_onComplete,_onCompleteParams]);
		}
		
		private function changeDefaultPanComplete(_call:Function, _callParams:Array):void{
			if(_call){
				_call(_callParams[0], _callParams[1]);
			}
			
			defaultPanChanging = false;
		}
		
		private function render(e:Event):void{
			if(renderEnabled){
				mousePan();
				view.render();
			}
			
			dispatchEvent(new Event("rendering"));
		}
		
		public function enableRender():void{
			renderEnabled = true;
		}
		
		public function disableRender():void{
			renderEnabled = false;
		}
		
		public function newView(_name:String):View3D{
			var v:View3D = new View3D({camera:camera, clipping:new FrustumClipping({minZ:10})});
			stage.addChild(v);
			
			return v;
		}
		
		public function addObject(_o:CFM_ObjectContainer3D, _cameraRotationOffset:Boolean = false):void{
			_o.renderTo(view.scene);
			
			if(_cameraRotationOffset){
				cameraRotationOffsetObjects.push(_o);
			}
		}
		
		public function resize():void{
			view.x = (stage.stageWidth/2);
			view.y = (stage.stageHeight/2);
			if(stage.stageHeight > 900){
				view.y += (stage.stageHeight -900)/2;
			}
			
			
		}
	}
}