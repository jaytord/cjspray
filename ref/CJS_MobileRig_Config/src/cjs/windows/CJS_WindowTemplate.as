package cjs.windows
{
	import cfm.core.events.CFM_NavigationEvent;
	import cfm.core.events.CFM_SimpleButtonEvent;
	import cfm.core.graphics.CFM_BoxGraphics;
	import cfm.core.templates.CFM_PageTemplate;
	import cfm.core.text.CFM_TextField;
	
	import cjs.buttons.CJS_CloseButton;
	import cjs.managers.FontManager;
	import cjs.model.AppModel;
	import cjs.navigation.CJS_MainNavigation;
	
	import flash.display.GradientType;
	import flash.filters.DropShadowFilter;
	
	import mx.utils.NameUtil;
	
	public class CJS_WindowTemplate extends CFM_PageTemplate
	{
		protected var __model:AppModel;
		protected var closeButton:CJS_CloseButton;
		
		protected var heading:CFM_TextField;
		protected var description:CFM_TextField;
		protected var background:CFM_BoxGraphics;
		
		protected var WINDOW_WIDTH:Number = 560;
		protected var MARGIN:Number = 24;
		protected var MIN_WINDOW_HEIGHT:Number = 200;
		protected var MAX_WINDOW_HEIGHT:Number = 500;
		
		protected var navigation:CJS_MainNavigation;
		private var bevel:CFM_BoxGraphics;
		private var highlight:CFM_BoxGraphics;
		
		public function CJS_WindowTemplate(_index:Number, _xml:XML, _params:Object)
		{
			__model = AppModel.inst;
			
			super(_index, _xml, _params);
		}
		
		override protected function buildNavigation():void{
			navigation = new CJS_MainNavigation(xml.navigation.button);
			navigation.renderTo(content);
			navigation.setProperties({x:WINDOW_WIDTH-navigation.width-MARGIN, y:content.height + MARGIN});
		}
		
		override protected function buildHeading():void{
			heading =  new CFM_TextField({leading:-6, lspacing:-1, width:WINDOW_WIDTH-(MARGIN*3), text:getSelectionHeading(), font:FontManager.RockwellBold, color:0, size:28});
			heading.renderTo(content);
			heading.setProperties({y:MARGIN*.5, x:MARGIN});
		}
		
		override protected function buildDescription():void{
			description =  new CFM_TextField({css:__model.ui.css, width:WINDOW_WIDTH-(MARGIN*2), text:getSelectionDescription(), font:FontManager.Rockwell, color:0, size:13});
			description.renderTo(content);
			description.setProperties({x:MARGIN, y:heading.y + heading.height + 20});
		}
		
		override protected function buildBackground():void{
			bevel = new CFM_BoxGraphics({width:10, height:10, grad:{type:GradientType.LINEAR, rotation:50}, colors:[0xFFFFFF, 0xDDDDDD], alphas:[.5,.8], ratios:[20,200], radius:24});
			bevel.renderTo(content);
			bevel.filters = [new DropShadowFilter(20,45,0,.4,35,35,1,3)];
			
			background = new CFM_BoxGraphics({width:10, height:10, colors:[0xFFFFFF, 0xEEEEEE], alphas:[1,1], ratios:[150,255], grad:{type:GradientType.LINEAR, rotation:20}, radius:18});
			background.renderTo(content);
		}
		
		override protected function buildComplete():void{
			super.buildComplete();
			
			highlight = new CFM_BoxGraphics({width:10, height:10, grad:{type:GradientType.LINEAR, rotation:30}, colors:[0xFFFFFF,0xFFFFFF, 0xFFFFFF], alphas:[.1,.2,0], ratios:[0,125,140], radius:24});
			highlight.renderTo(content);
			
			highlight.mouseEnabled = false;
			
			updateSize();
		}
		
		protected function updateSize():void{
			var cheight:Number = content.height < MIN_WINDOW_HEIGHT ? MIN_WINDOW_HEIGHT : content.height;
			
			background.resize(WINDOW_WIDTH,cheight + (MARGIN),0,0);
			highlight.resize(background.width,background.height,0,0);
			bevel.resize(background.width+16,background.height+16,-8,-8);
			
			content.setProperties({y:-(content.height/2)+8, x:-content.width/2});
		}
		
		override protected function buildCloseButton():void{
			closeButton = new CJS_CloseButton();
			closeButton.renderTo(content);
			closeButton.setProperties({y:10, x:WINDOW_WIDTH-closeButton.width-10});
		}
		
		override protected function addListeners():void{
			super.addListeners();
			closeButton.addEventListener(CFM_SimpleButtonEvent.BUTTON_CLICKED,closeClicked, false, 0, true);
			if(navigation) navigation.addEventListener(CFM_NavigationEvent.BUTTON_CLICKED, navigationClicked, false, 0, true);
		}
		
		override protected function removeListeners():void{
			closeButton.removeEventListener(CFM_SimpleButtonEvent.BUTTON_CLICKED,closeClicked);
			if(navigation) navigation.removeEventListener(CFM_NavigationEvent.BUTTON_CLICKED, navigationClicked);
			super.removeListeners();
		}
		
		protected function navigationClicked(e:CFM_NavigationEvent):void{}
		
		private function closeClicked(e:CFM_SimpleButtonEvent):void{
			__model.windows.removeCurrentPage(true);
		}
		
		protected function getSelectionHeading():String{
			return xml.heading;
		}
		
		protected function getSelectionDescription():String{
			return xml.description;
		}
	}
}