package cjs.ui
{
	import cfm.core.ui.CFM_FormField;
	
	import cjs.managers.FontManager;
	
	public class CJS_FormField extends CFM_FormField
	{	
		private var WIDTH:Number;
		
		public function CJS_FormField(_index:Number, _isEmail:Boolean, _required:Boolean, _password:Boolean, _defaultText:String, _width:Number)
		{
			super(_index, _isEmail, _required, _password, _defaultText);
			
			WIDTH = _width-(MARGIN*2);
		}
		
		override protected function get inputParams():Object{
			return {width:WIDTH, text:defaultText, font:FontManager.Rockwell, color:0xFFFFFF, size:14, input:true, password:isPassword};
		}
	}
}