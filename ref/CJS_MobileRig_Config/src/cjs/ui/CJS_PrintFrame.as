package cjs.ui
{
	import cfm.core.graphics.CFM_BoxGraphics;
	import cfm.core.media.CFM_Image;
	import cfm.core.objects.CFM_Object;
	
	import cjs.util.CJS_Color;
	
	import com.greensock.TweenMax;
	
	public class CJS_PrintFrame extends CFM_Object
	{
		public var header:CJS_Header;
		public var footer:CJS_Footer;
		public var stripe:CFM_BoxGraphics;
		
		public var WIDTH:Number;
		public var HEIGHT:Number;
		
		public function CJS_PrintFrame(_width:Number, _height:Number)
		{
			WIDTH = _width;
			HEIGHT = _height;
			
			super("CJS_PrintFrame", true, true);
		}
		
		override protected function build():void{
			stripe = new CFM_BoxGraphics({y:-20, width:WIDTH, height:20, color:CJS_Color.DARK_GRAY, alpha:1});
			stripe.renderTo(this);
			stripe.setProperties({y:HEIGHT});
			
			header = new CJS_Header(WIDTH,0);
			header.renderTo(this);
			header.setProperties({y:-70});
			
			footer = new CJS_Footer(WIDTH,HEIGHT,0);
			footer.renderTo(this);
			footer.setProperties({x:20});
			//TweenMax.to(footer, 0, {tint:CJS_Color.DARK_BLUE});
		}
	}
}