package cfm.core.graphics
{
	import flash.display.DisplayObjectContainer;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.geom.Matrix;
	
	public class CFM_BoxGraphics extends Sprite
	{
		private var mat:Matrix;
		private var params:Object;
		private var circle:Boolean;
		
		public function CFM_BoxGraphics(_params:Object, _circle:Boolean = false)
		{
			params = _params;
			circle = _circle;
			
			mat = new Matrix();
			resize(circle ? params.radius*2 : params.width , circle ? params.radius*2 : params.height, params.x, params.y);
		}
		
		public function resize(_w:Number, _h:Number, _x:Number, _y:Number):void{
			params.height = _h;
			params.width = _w;
			params.x = _x;
			params.y = _y;
			
			graphics.clear();
			
			if(params.lineStyle && params.lineStyle.thickness > 0){
				graphics.lineStyle(params.lineStyle.thickness, params.lineStyle.color);
			}
			
			if(params.grad){
				mat.createGradientBox(params.width,params.height,params.grad.rotation*(Math.PI/180), 0, 0);
				graphics.beginGradientFill(params.grad.type,params.colors, params.alphas, params.ratios, mat);
			} else {
				graphics.beginFill(params.color, params.alpha);
			}
			
			if(params.radius && !circle){
				if(params.radius is Array)
					graphics.drawRoundRectComplex(params.x,params.y,params.width,params.height,params.radius[0],params.radius[1],params.radius[2],params.radius[3]);
				else 
					graphics.drawRoundRect(params.x,params.y,params.width,params.height,params.radius);
			} else if(circle){
				graphics.drawCircle(params.x + (params.width/2),params.y + (params.width/2),params.width/2);
			} else {
				graphics.drawRect(params.x,params.y,params.width ? params.width : 0,params.height ? params.height : 0);
			}
			
			graphics.endFill();
		}
		
		public function renderTo(_parent:DisplayObjectContainer, index:Number = Number.NaN):void{
			(isNaN(index))?_parent.addChild(this):_parent.addChildAt(this, int(index));
		}
		
		public function remove():void{
			this.parent.removeChild(this);
		}
		
		public function setProperties(_prop:Object):void{
			for (var p:String in _prop) this[p] = _prop[p]; 
		}
	}
}