package cfm.core.away.primitives
{
	import away3d.containers.ObjectContainer3D;
	import away3d.events.Object3DEvent;
	import away3d.materials.ColorMaterial;
	import away3d.primitives.Cube;
	import away3d.primitives.Cylinder;
	import away3d.primitives.Plane;
	
	import com.greensock.TweenMax;
	
	import flash.display.Sprite;
	import flash.filters.BlurFilter;
	
	public class CFM_ShadowCube extends ObjectContainer3D
	{
		private var shadow:Plane;
		public var cube:Cube;
		public var blur:BlurFilter;
		public const castDistance:Number = 400;
		public const shadowDensity:Number = 1;
		
		public function CFM_ShadowCube(init:Object)
		{			
			blur = new BlurFilter(12,12,1);
			
			shadow = new Plane({width:init.width, height:init.depth, material:new ColorMaterial(0)});
			shadow.segmentsH = shadow.segmentsW = 1;
			shadow.ownCanvas = true;
			shadow.alpha = 1;
			shadow.y = -50;
			shadow.filters = [blur];
			addChild(shadow);
			
			cube = new Cube({width:init.width, height:init.height, depth:init.depth});
			cube.segmentsD = cube.segmentsH = cube.segmentsW = 4;
			addChild(cube);
			
			cube.material = new ColorMaterial(0x333344);
			cube.ownCanvas =true;
			cube.alpha = .5;
			
			cube.addEventListener(Object3DEvent.SESSION_UPDATED,updateShadow);
		}
		
		private function updateShadow(e:Object3DEvent):void{
			var newAlpha:Number = shadowDensity-(cube.y/castDistance);
			shadow.alpha = newAlpha>0?newAlpha<shadowDensity?newAlpha:shadowDensity:0;
			
			blur.blurX = blur.blurY = (1-newAlpha)*20;
		}
	}
}