package cjs.ui
{
	import cfm.core.objects.CFM_Object;
	import cfm.core.text.CFM_TextField;
	import cfm.utils.getNumberString;
	
	import cjs.managers.FontManager;
	
	import flash.text.TextFieldAutoSize;
	
	public class CJS_SelectionItem extends CFM_Object
	{
		private var labelText:String;
		private var priceString:String;
		private var field:CFM_TextField;
		private var priceField:CFM_TextField;
		private var WIDTH:Number;
		
		public function CJS_SelectionItem(_labelText:String, _price:Number, _width:Number)
		{
			labelText = _labelText;
			priceString = "$" + getNumberString(_price);
			WIDTH = _width;
			
			super("Selection", true, true);
		}
		
		override protected function build():void{
			field = new CFM_TextField(fieldParams);
			field.renderTo(this);
			field.autoSize = TextFieldAutoSize.NONE;
			
			priceField = new CFM_TextField(priceParams);
			priceField.text = priceString;
			priceField.renderTo(this);
			priceField.setProperties({x:WIDTH-priceField.width});
		}
		
		private function get fieldParams():Object{
			return {letterSpacing:-4, width:WIDTH-50, text:labelText, size:13, font:FontManager.Rockwell, color:0x666666, alpha:1};
		}
		
		private function get priceParams():Object{
			return {letterSpacing:-4, text:labelText, size:13, font:FontManager.Rockwell, color:0x666666, alpha:1};
		}
	}
}