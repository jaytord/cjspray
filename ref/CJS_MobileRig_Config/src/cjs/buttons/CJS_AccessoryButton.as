package cjs.buttons
{
	import cfm.core.text.CFM_TextField;
	
	import cjs.managers.FontManager;
	import cjs.util.CJS_Color;
	
	import com.greensock.TweenMax;
	import com.greensock.easing.Linear;
	
	import flash.text.TextFieldAutoSize;

	public class CJS_AccessoryButton extends CJS_MenuButton
	{
		public function CJS_AccessoryButton(_index:Number, _id:String, _labelText:String, _value:String)
		{
			super(_index, _id, _labelText, _value);
		}
		
		override protected function buildLabel():void{	
			label = new CFM_TextField({leftMargin:10, width:400, text:labelText, font:FontManager.Rockwell, size:12, color:0x666666});
			label.renderTo(labelContainer);
			label.autoSize = TextFieldAutoSize.NONE;
			label.setProperties({y:1});
			
			info = new CJS_InfoButtonA([0,4,0,0]);
			info.renderTo(labelContainer);
			info.setProperties({x:label.x + label.width});
		}
	}
}