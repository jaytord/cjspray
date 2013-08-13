package cjs.ui
{
	import cfm.core.ui.CFM_EmailForm;
	import cfm.core.ui.CFM_FormField;
	
	import cjs.model.AppModel;
	
	public class CJS_LoginForm extends CFM_EmailForm
	{
		private var __model:AppModel;
		
		private var WIDTH:Number;
		
		public function CJS_LoginForm(_fields:XMLList, _phpUrl:String, _width:Number)
		{
			__model = AppModel.inst;
			
			WIDTH = _width;
			
			super(_fields, _phpUrl);
		}
		
		override protected function buildField(_index:Number, _email:Boolean,_required:Boolean,_password:Boolean, _defaultText:String):CFM_FormField{
			return new CJS_FormField(_index,_email,_required,_password,_defaultText,WIDTH);
		}
		
		override protected function send(_addParams:Object = null):void{
			trace("send");
			__model.dealers.validateDealerLogin(CFM_FormField(fieldsArray[0]).inputValue, CFM_FormField(fieldsArray[1]).inputValue);
		}
	}
}