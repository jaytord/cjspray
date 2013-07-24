package cjs.pages
{
	import cfm.core.events.CFM_NavigationEvent;
	import cfm.core.events.CFM_SimpleButtonEvent;
	import cfm.core.interfaces.IResize;
	import cfm.core.objects.CFM_Object;
	import cfm.core.text.CFM_TextField;
	
	import cjs.buttons.CJS_InfoButtonA;
	import cjs.events.CJS_infoButtonEvent;
	import cjs.managers.FontManager;
	import cjs.model.AppModel;
	import cjs.navigation.CJS_MainNavigation;
	
	[Event(name="modeChanged", type="com.cjs.events.CJS_ModeEvent")]
	
	public class CJS_PageTemplate extends CFM_Object implements IResize
	{
		protected var __model					:AppModel;
		private var pageId						:String;
		private var pageXML						:XML;
		private var navList						:XMLList;
		
		protected var heading					:CFM_TextField;
		protected var navigation				:CJS_MainNavigation;
		protected var infoButton				:CJS_InfoButtonA;
		
		public function CJS_PageTemplate(_pageId:String, _autoInit:Boolean=true, _autoDestroy:Boolean=true)
		{
			pageId 								= _pageId;
			__model 							= AppModel.inst;
			pageXML								= __model.xml.PAGE_LIST.(@id==pageId)[0];
			navList								= pageXML.navigation.button;
			
			super("CJS_PageTemplate", true, true);
		}
		
		override protected function build():void{
			if(pageXML.navigation.length()>0) buildNavigation();
			if(pageXML.heading.length()>0) buildHeading();
			if(pageXML.@info == "yes") buildInfoButton();
		}
		
		protected function buildInfoButton():void{
			infoButton = new CJS_InfoButtonA([0,0,0,0]);
			infoButton.renderTo(this);
			infoButton.setProperties({x:heading ? heading.width + 2 : 0, y:heading.y + 3});
		}
		
		protected function infoClicked(e:CFM_SimpleButtonEvent):void{
			openInfo(new CJS_infoButtonEvent(CJS_infoButtonEvent.OPEN_INFO,"info_w", {heading:pageXML.heading, buttonId:pageId},true));
		}
		
		private function buildNavigation():void{
			navigation = new CJS_MainNavigation(navList);
			navigation.renderTo(this);
			navigation.setProperties({x:0, y:425});
		}
		
		override protected function addListeners():void{
			navigation.addEventListener(CFM_NavigationEvent.BUTTON_CLICKED, navClicked, false, 0, true);
			
			if(infoButton) infoButton.addEventListener(CFM_SimpleButtonEvent.BUTTON_CLICKED, infoClicked, false, 0, true);
		}
		
		private function navClicked(e:CFM_NavigationEvent):void{
			this[e.value]();
		}
		
		protected function buildHeading():void{
			heading = new CFM_TextField(headingParams);
			heading.renderTo(this);
		}
		
		protected function clearAll():void{
			__model.config.clearSelections();
		}
		
		protected function openInfo(e:CJS_infoButtonEvent):void{
			__model.windows.changePage(e.id, e.params);
		}
		
		protected function get headingParams():Object{
			return {font:FontManager.Rockwell, size:20, color:0x999999, text:pageXML.heading};
		}
	
		protected function prevPage():void{}
		protected function nextPage():void{}
		protected function dealerLogin():void{}
		protected function save():void{}
		protected function print():void{}
		
		public function resize():void{
			
		}
	}
}