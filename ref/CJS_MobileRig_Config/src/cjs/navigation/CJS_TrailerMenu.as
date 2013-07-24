package cjs.navigation
{
	import cfm.core.events.CFM_SimpleButtonEvent;
	import cfm.core.ui.CFM_Navigation;
	import cfm.core.ui.CFM_SimpleButton;
	
	import cjs.buttons.CJS_InfoButtonA;
	import cjs.buttons.CJS_TrailerButton;
	import cjs.events.CJS_infoButtonEvent;
	
	public class CJS_TrailerMenu extends CFM_Navigation
	{
		public var info:CJS_InfoButtonA;
		
		public function CJS_TrailerMenu(_list:XMLList)
		{
			super(_list,false,false);
			
			buttonSpacing = 18;
		}
		
		override protected function build():void{
			super.build();
		}
		
		override protected function buildButton(_i:Number, _tag:XML):CFM_SimpleButton{
			return new CJS_TrailerButton(_i,_tag.@id,_tag.label,14,8,_tag.@value,_tag.@image);
		}
	}
}