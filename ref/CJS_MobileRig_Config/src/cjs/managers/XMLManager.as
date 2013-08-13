package cjs.managers
{
	public class XMLManager
	{
		public var mainXML:XML;
		
		public var HEADING_XML				:XML;
		public var FOOTER_XML				:XML;
		public var TRAILER_XML				:XML;
		public var MENU_PANELS_LIST			:XMLList;
		public var CONFIGURATION_LIST		:XMLList;
		public var IMAGE_LIST				:XMLList;
		public var WINDOW_LIST				:XMLList;
		public var PAGE_LIST				:XMLList;
		public var ACCESSORY_XML			:XML;
		
		public function XMLManager(_xml:XML)
		{			
			mainXML 						= _xml;
			init();
		}
		
		public function init():void{
			HEADING_XML						= mainXML.heading[0];
			FOOTER_XML						= mainXML.footer[0];
			TRAILER_XML 					= mainXML.trailers[0];
			MENU_PANELS_LIST 				= mainXML.options.panel;
			CONFIGURATION_LIST 				= mainXML.configuration.option;
			IMAGE_LIST 						= mainXML.images.image;
			WINDOW_LIST 					= mainXML.windows.window;
			PAGE_LIST 						= mainXML.pages.page;
			ACCESSORY_XML					= mainXML.accessories[0];
		}
	}
}