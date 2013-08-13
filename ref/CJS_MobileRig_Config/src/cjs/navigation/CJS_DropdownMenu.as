package cjs.navigation
{
	import cfm.core.ui.CFM_DropdownMenu;
	import cfm.core.ui.CFM_SimpleButton;
	
	import cjs.buttons.CJS_MenuButton;
	import cjs.buttons.CJS_MenuItemButton;
	
	public class CJS_DropdownMenu extends CFM_DropdownMenu
	{
		public function CJS_DropdownMenu(_index:Number, _buttonXML:XML, _id:String, _value:String, _itemList:XMLList)
		{			
			super(_index, _buttonXML, _id, _value, _itemList);
		}
		
		override protected function getButton():CFM_SimpleButton{
			return new CJS_MenuButton(0,buttonXML.@id,buttonXML.label,buttonXML.@value) as CFM_SimpleButton;
		}
		
		override protected function getItem(_index:Number, _label:String, _id:String, _value:String):CFM_SimpleButton{
			return new CJS_MenuItemButton(_index,_id,_label,_value,String(itemList[_index].exclude).split(":"), itemList[_index].@dealerOnly=="true" ? true : false) as CFM_SimpleButton;
		}
		
		public function testExclude():void{
			for each(var i:CJS_MenuItemButton in itemArray)
				i.testExclude();
				
			positionButtons();
		}
		
		override public function buildItems():void{
			super.buildItems();
			itemHolder.setProperties({x:6});
		}
	}
}