package cfm.core.graphics
{
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	
	public class CFM_ArrowGraphics extends Sprite
	{
		public function CFM_ArrowGraphics(params:Object)
		{			
			graphics.beginFill(params.color, params.alpha);
			graphics.lineTo(params.width,params.height/2);
			graphics.lineTo(0,params.height);
			graphics.lineTo(0,0);
			graphics.endFill();
		}
		
		public function renderTo(_parent:DisplayObjectContainer):void{
			_parent.addChild(this);
		}
		
		public function remove():void{
			this.parent.removeChild(this);
		}
		
		public function setProperties(_prop:Object):void{
			for (var p:String in _prop) this[p] = _prop[p]; 
		}
	}
}