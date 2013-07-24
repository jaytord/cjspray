package cjs.pages
{
	import cfm.core.containers.CFM_ObjectContainer;
	
	import cjs.events.CJS_ConfigurationEvent;
	import cjs.events.CJS_MenuPanelEvent;
	import cjs.events.CJS_ModeEvent;
	import cjs.events.CJS_infoButtonEvent;
	import cjs.ui.CJS_ConfigWidget;
	import cjs.ui.CJS_MenuPanel;
	
	import flash.filters.DropShadowFilter;

	public class CJS_OptionsPage extends CJS_PageTemplate
	{
		private var menuPanelList				:XMLList;
		private var menuPanel					:CJS_MenuPanel;
		private var menuContainer				:CFM_ObjectContainer;
		private var configWidget				:CJS_ConfigWidget;
		private var panelsArray					:Array = [];
		
		private const COL_SPACING:int = 10;
		
		public function CJS_OptionsPage(_pageId:String)
		{
			super(_pageId);
			
			menuPanelList 						= __model.xml.MENU_PANELS_LIST;
		}
		
		override protected function build():void{
			super.build();
			
			buildMenus();
			buildConfigWidget();
		}
		
		private function buildMenus():void{
			menuContainer = new CFM_ObjectContainer();
			menuContainer.renderTo(this);
			
			for each(var mp:XML in menuPanelList)
				buildMenuPanel(mp.childIndex(), mp.menu);
		}
		
		private function buildConfigWidget():void{
			configWidget = new CJS_ConfigWidget();
			configWidget.renderTo(this);
			configWidget.setProperties({y:478, x:menuContainer.width});
			configWidget.filters = [new DropShadowFilter(5,45,0,.2,30,30,1,3)];
		}
		
		private function buildMenuPanel(_index:Number,_menuList:XMLList):void{
			menuPanel = new CJS_MenuPanel(_index,_menuList);
			menuPanel.renderTo(menuContainer);
			menuPanel.setProperties({y:heading.height + 10, x:_index>0 ? COL_SPACING + panelsArray[_index-1].x + panelsArray[_index-1].width  :0});
			
			panelsArray.push(menuPanel);
		}
	
		override protected function addListeners():void{
			super.addListeners();
			
			for each(var p:CJS_MenuPanel in panelsArray){
				p.addEventListener(CJS_MenuPanelEvent.PANEL_ACTIVE, panelActivated, false, 0, true);
				p.addEventListener(CJS_MenuPanelEvent.ITEM_SELECTED, menuItemSelected, false, 0, true);
			}
			
			menuContainer.addEventListener(CJS_infoButtonEvent.OPEN_INFO, openInfo, false, 0, true);
			
			__model.config.addEventListener(CJS_ConfigurationEvent.OPTION_CHANGED, onOptionChanged, false, 0, true);
			__model.config.addEventListener(CJS_ConfigurationEvent.RESET_ALL, onOptionsReset, false, 0, true);
		}
		
		private function panelActivated(e:CJS_MenuPanelEvent):void{
			for each(var p:CJS_MenuPanel in panelsArray)
				if(p.index != e.panelIndex)
					p.deactivate();
		}
		
		private function menuItemSelected(e:CJS_MenuPanelEvent):void{
			__model.config.updateOption(e.menuValue, e.itemValue);
		}
		
		protected function onOptionsReset(e:CJS_ConfigurationEvent):void{
			for each(var p:CJS_MenuPanel in panelsArray)
				p.resetAll();
		}
		
		protected function onOptionChanged(e:CJS_ConfigurationEvent):void{
			for each(var p:CJS_MenuPanel in panelsArray)
				p.testExclude();	
		}
	
		override protected function clearAll():void{
			super.clearAll();
		}
		
		override protected function prevPage():void{
			super.clearAll();
			dispatchEvent(new CJS_ModeEvent(CJS_ModeEvent.MODE_CHANGED, CJS_ModeEvent.TRAILER_MODE));
		}
		
		override protected function nextPage():void{
			if(!__model.config.verifyConfigComplete())
				dispatchEvent(new CJS_ModeEvent(CJS_ModeEvent.MODE_CHANGED, CJS_ModeEvent.ACCESSORY_MODE));
			else
				__model.windows.changePage("incomplete_w");
		}
		
		override public function resize():void{
			super.resize();
			
			setProperties({x:CJS_MobileRig_Config.PAGE_WIDTH + ((stage.stageWidth-width+26)/2)});
		}
	}
}