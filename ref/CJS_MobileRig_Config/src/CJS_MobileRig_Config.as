package
{
	import cfm.core.containers.CFM_ObjectContainer;
	import cfm.core.loaders.CFM_XMLLoader;
	import cfm.core.managers.CFM_ResizeManager;
	
	import cjs.config.AppConfig;
	import cjs.events.CJS_ModeEvent;
	import cjs.factories.CJS_WindowFactory;
	import cjs.model.AppModel;
	import cjs.pages.CJS_AccessoriesPage;
	import cjs.pages.CJS_ConfigPage;
	import cjs.pages.CJS_OptionsPage;
	import cjs.pages.CJS_PageTemplate;
	import cjs.pages.CJS_TrailerPage;
	import cjs.ui.CJS_Background;
	import cjs.ui.CJS_Footer;
	import cjs.ui.CJS_Header;
	
	import com.greensock.TweenMax;
	import com.greensock.easing.Cubic;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.filters.DropShadowFilter;
	import flash.utils.getDefinitionByName;
	
	[SWF(backgroundColor="#FFFFFF", frameRate="30", height="600", quality="HIGH")]
	
	public class CJS_MobileRig_Config extends Sprite
	{	
		CJS_OptionsPage, CJS_TrailerPage, CJS_ConfigPage,CJS_AccessoriesPage
		
		private var __model						:AppModel;
		
		private var xmlLoader					:CFM_XMLLoader;
		private var header						:CJS_Header;
		private var footer						:CJS_Footer;
		
		private var background					:CJS_Background;
		private var pageContainer				:CFM_ObjectContainer;
		private var windowContainer				:CFM_ObjectContainer;
		
		private var mode:String					= CJS_ModeEvent.TRAILER_MODE;
		public static var PAGE_WIDTH			:Number = 950;
		
		public function CJS_MobileRig_Config()
		{
			__model 							= AppModel.inst;
			stage.align 						= StageAlign.TOP_LEFT;
			stage.scaleMode 					= StageScaleMode.NO_SCALE;
			
			stage.addEventListener(Event.RESIZE, resize, false, 0, true);
			loadXML();
		}
		
		private function loadXML():void{
			xmlLoader = new CFM_XMLLoader(AppConfig.MAIN_XML_URL,xmlComplete);
		}
		
		private function xmlComplete(_xml:XML):void{
			__model.initialize(_xml);
			
			init();
		}
		
		private function init():void{
			buildBackground();
			buildHeader();
			buildFooter();
			buildPages();
			buildWindows();
			
			resize(null);
		}
		
		private function buildBackground():void{
			background = new CJS_Background();
			background.renderTo(this);
		}
		
		private function buildHeader():void{
			header = new CJS_Header();
			header.renderTo(this);
			header.filters = [new DropShadowFilter(5,45,0,.2,30,30,1,3)];
		}
		
		private function buildFooter():void{
			footer = new CJS_Footer();
			footer.renderTo(this);
		}
		
		private function buildPages():void{
			pageContainer = new CFM_ObjectContainer();
			pageContainer.renderTo(this);
			pageContainer.setProperties({y:120});
			
			for each(var p:XML in __model.xml.PAGE_LIST)
				buildPage(p.@id, p.@className);
		}
		
		private function buildPage(_id:String, _className:String):void{
			var PageClass:Class = getDefinitionByName("cjs.pages." + _className) as Class;
			var page:CJS_PageTemplate = new PageClass(_id);
			
			page.renderTo(pageContainer);
			page.addEventListener(CJS_ModeEvent.MODE_CHANGED, modeChanged, false, 0, true);
		}
		
		private function buildWindows():void{
			windowContainer = new CFM_ObjectContainer();
			windowContainer.renderTo(this);
			
			__model.windows = new CJS_WindowFactory(windowContainer, __model.xml.WINDOW_LIST);
		}
		
		private function modeChanged(e:CJS_ModeEvent, _mode:String = null):void{
			mode = e ? e.mode : _mode ? _mode : CJS_ModeEvent.TRAILER_MODE;
			this["to" + mode]();
		}
		
		private function motionBlur():void{
			TweenMax.killTweensOf(pageContainer);
			
			TweenMax.to(pageContainer,.3, {blurFilter:{blurX:10}, ease:Cubic.easeInOut});
			TweenMax.to(pageContainer,.3, {delay:.3, blurFilter:{blurX:0, remove:true}, ease:Cubic.easeInOut});
		}
		
		private function toTrailerMode():void{
			//motionBlur();
			TweenMax.to(pageContainer, .6, {x:0, ease:Cubic.easeInOut});
		}
		
		private function toOptionsMode():void{
			//motionBlur();
			TweenMax.to(pageContainer, .6, {x:-PAGE_WIDTH, ease:Cubic.easeInOut});
		}
		
		private function toAccessoryMode():void{
			//motionBlur();
			TweenMax.to(pageContainer, .6, {x:-(PAGE_WIDTH*2), ease:Cubic.easeInOut});
		}
		
		private function toConfigMode():void{
			//motionBlur();
			TweenMax.to(pageContainer, .6, {x:-(PAGE_WIDTH*3), ease:Cubic.easeInOut});
		}
		
		public function resize(e:Event):void{
			PAGE_WIDTH = stage.stageWidth;
			
			CFM_ResizeManager.resize();
			
			__model.windows.resize(stage.stageWidth, stage.stageHeight);
			
			modeChanged(null,mode);
		}
	}
}