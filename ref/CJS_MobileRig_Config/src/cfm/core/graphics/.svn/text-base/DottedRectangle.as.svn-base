package cfm.core.graphics
{
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.geom.Rectangle;
	
	public class DottedRectangle extends Shape
	{
		private var rect:Rectangle;
		private var thickness:Number;
		private var color:uint;
		private var dotAlpha:Number;
		private var dotWidth:Number;
		private var dotSpacing:Number;
		
		public function DottedRectangle(_rect:Rectangle, _thickness:Number, _color:uint = 0x777777, _dotAlpha:Number = 1, _dotWidth:Number = 1, _dotSpacing:Number = 1)
		{
			super();
			
			rect = _rect;
			thickness = _thickness;
			color = _color;
			dotAlpha = _dotAlpha;
			dotWidth = _dotWidth;
			dotSpacing = _dotSpacing;
			
			draw();
		}
		
		private function draw():void{
			graphics.clear();
			drawLeftRight();
			drawTopBottom();
		}
		
		private function drawLeftRight():void{
			var tile:BitmapData = new BitmapData(thickness + 1, dotWidth + dotSpacing, true);
			var r1:Rectangle = new Rectangle(0, 0, thickness, dotWidth);
			tile.fillRect(r1, returnARGB(color, 255));
			
			var r2:Rectangle = new Rectangle(0, dotWidth, thickness, dotWidth + dotSpacing);
			tile.fillRect(r2, 0x00000000);
			
			graphics.beginBitmapFill(tile, null, true);
			graphics.drawRect(0,0, thickness, rect.height);
			graphics.moveTo(rect.width,0);
			graphics.drawRect(0,0, thickness, rect.height);
			graphics.endFill();
		}
		
		private function drawTopBottom():void{
			var tile:BitmapData = new BitmapData(dotWidth + dotSpacing, thickness + 1, true);
			var r1:Rectangle = new Rectangle(0, 0, dotWidth, thickness);
			tile.fillRect(r1, returnARGB(color, 255));
			
			var r2:Rectangle = new Rectangle(dotWidth, 0, dotWidth + dotSpacing, thickness);
			tile.fillRect(r2, 0x00000000);
			
			graphics.beginBitmapFill(tile, null, true);
			graphics.drawRect(0, 0, rect.width, thickness);
			graphics.drawRect(0, rect.height, rect.width, thickness);
			graphics.endFill();
		}
		
		private function returnARGB(rgb:uint, newAlpha:uint):uint
		{
			var argb:uint = 0;
			argb += (newAlpha<<24);
			argb += (rgb);
			return argb;
		}
	}
}
