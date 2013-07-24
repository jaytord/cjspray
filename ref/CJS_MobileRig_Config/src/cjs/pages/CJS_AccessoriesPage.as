package cjs.pages
{
	import cfm.core.events.CFM_NavigationEvent;
	import cfm.core.ui.CFM_Navigation;
	
	import cjs.events.CJS_ModeEvent;
	import cjs.events.CJS_infoButtonEvent;
	import cjs.navigation.CJS_AccessoryMenu;
	import cjs.navigation.CJS_MainNavigation;
	import cjs.ui.CJS_ConfigWidget;
	
	import flash.filters.DropShadowFilter;

	public class CJS_AccessoriesPage extends CJS_PageTemplate
	{
		private var menu						:CJS_AccessoryMenu;
		private var configWidget				:CJS_ConfigWidget;
		
		public function CJS_AccessoriesPage(_pageId:String)
		{
			super(_pageId);
		}
		
		override protected function build():void{
			super.build();
			buildMenu();
			buildConfigWidget();
		}
		
		protected function buildMenu():void{
			menu = new CJS_AccessoryMenu(__model.xml.ACCESSORY_XML..selection);
			menu.renderTo(this);
			menu.setProperties({y:heading.height + 10});
		}
		
		private function buildConfigWidget():void{
			configWidget = new CJS_ConfigWidget(false);
			configWidget.renderTo(this);
			configWidget.setProperties({y:478, x:menu.width});
			configWidget.filters = [new DropShadowFilter(5,45,0,.2,30,30,1,3)];
		}
		
		override protected function addListeners():void{
			super.addListeners();
			menu.addEventListener(CFM_NavigationEvent.BUTTON_CLICKED, menuClicked, false, 0, true);
			menu.addEventListener(CJS_infoButtonEvent.OPEN_INFO, openInfo, false, 0, true);
		}
	
		override protected function prevPage():void{
			dispatchEvent(new CJS_ModeEvent(CJS_ModeEvent.MODE_CHANGED, CJS_ModeEvent.OPTIONS_MODE));
		}
		
		override protected function nextPage():void{
			dispatchEvent(new CJS_ModeEvent(CJS_ModeEvent.MODE_CHANGED, CJS_ModeEvent.CONFIG_MODE));
		}
		
		protected function menuClicked(e:CFM_NavigationEvent):void{
			if(e.selected)
				__model.config.addAccessory(e.id);
			else
				__model.config.removeAccessory(e.id);
		}
		
		override public function resize():void{
			super.resize();
			
			setProperties({x:(CJS_MobileRig_Config.PAGE_WIDTH*2)+((stage.stageWidth-width)/2)});
		}
	}
}