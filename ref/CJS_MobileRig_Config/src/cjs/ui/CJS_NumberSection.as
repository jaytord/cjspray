package cjs.ui
{
	import cfm.core.graphics.CFM_BoxGraphics;
	import cfm.core.objects.CFM_Object;
	import cfm.core.text.CFM_TextField;
	
	import cjs.managers.FontManager;
	
	import com.greensock.TweenMax;
	
	public class CJS_NumberSection extends CFM_Object
	{
		public var id:String;
		public var value:String;
		public var defaultValue:String;
		
		private var field:CFM_TextField;
		private var background:CFM_BoxGraphics;
		
		private const MARGIN_H:int = 3;
		private const MARGIN_V:int = 2;
		
		public function CJS_NumberSection(_id:String, _value:String)
		{
			id = _id;
			defaultValue = value = _value;
			
			super("ConfigNumberSection", true, true);
		}
		
		override protected function build():void{
			background = new CFM_BoxGraphics({width:10,height:10,color:0xEEEEEE,alpha:1});
			background.renderTo(this);
			
			field = new CFM_TextField(fieldParams);
			field.renderTo(this);
			field.setProperties({x:MARGIN_H-1, y:MARGIN_V});
			
			resizeBackground();
		}
		
		private function resizeBackground():void{
			background.resize(field.width+(MARGIN_H*2), field.height+(MARGIN_V*2), 0,0);
		}
		
		private function get fieldParams():Object{
			return {text:String(id + value).toUpperCase(), size:14, font:FontManager.Rockwell, color:0x999999, alpha:1};
		}
		
		public function update(_value:String):void{
			value = _value;
			field.text = String(id + value).toUpperCase();
			resizeBackground();
		}
		
		public function reset():void{
			value = defaultValue;
			field.text = String(id + value).toUpperCase();
			resizeBackground();
		}
	}
}