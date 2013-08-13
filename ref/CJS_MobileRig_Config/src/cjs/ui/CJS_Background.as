package cjs.ui
{
	import cfm.core.graphics.CFM_BoxGraphics;
	import cfm.core.interfaces.IResize;
	import cfm.core.objects.CFM_Object;
	
	import cjs.util.CJS_Color;
	
	import flash.display.GradientType;
	
	public class CJS_Background extends CFM_Object implements IResize
	{
		private var darkBlueStripe:CFM_BoxGraphics;
		private var lightBlueStripe:CFM_BoxGraphics;
		private var grayStripe:CFM_BoxGraphics;
		private var gradient:CFM_BoxGraphics;
		
		private const stripeSize:Number = 20;
		
		public function CJS_Background()
		{
			super("CJS_HeaderStripes", true, true);
		}
		
		override protected function build():void{
			gradient = new CFM_BoxGraphics({width:10, height:10, grad:{type:GradientType.LINEAR, rotation:40}, colors:[0xEEEEEE, 0xFFFFFF, 0xFFFFFF, 0xDDDDDD], alphas:[1,1,1,1], ratios:[0,50,180,250], radius:8});
			gradient.renderTo(this);
			
			darkBlueStripe = new CFM_BoxGraphics({width:stage.stageWidth, height:stripeSize*.5, color:CJS_Color.DARK_BLUE, alpha:1});
			darkBlueStripe.renderTo(this);
			
			lightBlueStripe = new CFM_BoxGraphics({y:stripeSize*.5, width:stage.stageWidth, height:stripeSize*.5, color:CJS_Color.LIGHT_BLUE, alpha:1});
			lightBlueStripe.renderTo(this);
			
			grayStripe = new CFM_BoxGraphics({y:-stripeSize, width:stage.stageWidth, height:stripeSize, color:CJS_Color.DARK_GRAY, alpha:1});
			grayStripe.renderTo(this);
		}
		
		public function resize():void{
			gradient.resize(stage.stageWidth,stage.stageHeight,0,0);
			darkBlueStripe.resize(stage.stageWidth, stripeSize*.5,0,0);
			lightBlueStripe.resize(stage.stageWidth, stripeSize*.5,0,stripeSize*.5);
			grayStripe.resize(stage.stageWidth, stripeSize, 0,-stripeSize);
			grayStripe.setProperties({y:stage.stageHeight});
		}
	}
}