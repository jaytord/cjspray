package cjs.model
{
	import cfm.core.factories.CFM_WindowFactory;
	import cfm.core.managers.CFM_SoundManager;
	
	import cjs.managers.ConfigurationManager;
	import cjs.managers.DealerManager;
	import cjs.managers.UIManager;
	import cjs.managers.XMLManager;
	
	import flash.events.EventDispatcher;
	
	public class AppModel extends EventDispatcher
	{
		private static var __instance:AppModel;
		public static function get inst():AppModel{ return __instance || (__instance = new AppModel()); };
		
		//private var _php				:PHPServicesManager;
		//private var _tracker			:GATracker;
		
		private var _sounds				:CFM_SoundManager;
		private var _config				:ConfigurationManager;
		private var _windows			:CFM_WindowFactory;
		private var _xml				:XMLManager;
		private var _dealers			:DealerManager;
		private var _ui					:UIManager ;
		
		public function AppModel() {
			trace("Init - AppModel");
		}
		
		public function initialize(_mainXML:XML):void{
			_xml = new XMLManager(_mainXML);
			_config = new ConfigurationManager(_xml.CONFIGURATION_LIST, _mainXML);
			_dealers = new DealerManager();
			_sounds = new CFM_SoundManager();
			_ui = new UIManager();
		}
		
		public function get xml():XMLManager{return _xml;}
		public function get config():ConfigurationManager{return _config;}
		
		public function get windows():CFM_WindowFactory{return _windows;}
		public function set windows(_factory:CFM_WindowFactory):void{_windows = _factory}
		
		public function get dealers():DealerManager{return _dealers;}
		public function get sounds():CFM_SoundManager{return _sounds;}
		
		public function get ui():UIManager{return _ui;}
		
		//public function get tracker():GATracker{return _tracker;}
		//public function set tracker(_inst:GATracker):void{_tracker = _inst}
		
		//public function get php():PHPServicesManager{return _php;}
	}
}