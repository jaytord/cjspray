package cjs.navigation
{
	import cfm.core.ui.CFM_Navigation;
	import cfm.core.ui.CFM_SimpleButton;
	
	import cjs.buttons.CJS_ButtonTemplate;
	
	public class CJS_MainNavigation extends CFM_Navigation
	{
		public function CJS_MainNavigation(_list:XMLList, _allowToggle:Boolean = false, _hasSelectedState:Boolean = false)
		{
			super(_list, _allowToggle, _hasSelectedState);
		}
		
		override protected function buildButton(_i:Number, _tag:XML):CFM_SimpleButton{
			return new CJS_ButtonTemplate(_i,_tag.@id,_tag.label,20,6,_tag.@value, _tag.@href,allowToggle,hasSelectedState,[10,10,0,0]) as CFM_SimpleButton;
		}
	}
}