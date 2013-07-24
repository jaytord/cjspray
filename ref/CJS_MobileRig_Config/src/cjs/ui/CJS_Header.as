package cjs.ui
{
	import cfm.core.events.CFM_ImageEvent;
	import cfm.core.interfaces.IResize;
	import cfm.core.media.CFM_Image;
	import cfm.core.objects.CFM_Object;
	import cfm.core.text.CFM_TextField;
	
	import cjs.config.AppConfig;
	import cjs.managers.FontManager;
	import cjs.model.AppModel;
	import cjs.util.CJS_Color;
	
	public class CJS_Header extends CFM_Object implements IResize
	{
		private var __model:AppModel;
		
		private var logo:CFM_Image;
		private var title:CFM_TextField;
		private var subTitle:CFM_TextField;
		
		private var WIDTH:Number = -1;
		private var MARGIN:Number = 40;
		
		public function CJS_Header(_width:Number = -1, _margin:Number = 40)
		{
			WIDTH = _width;
			MARGIN = _margin;
			__model = AppModel.inst;
			
			super("CJS_Header", true, true);
		}
		
		override protected function build():void{
			buildLogo();
			buildTitle();
			buildSubTitle();
		}
		
		private function buildLogo():void{
			logo = new CFM_Image(AppConfig.IMAGES_DIRECTORY + "logo.png",0,0);
			logo.renderTo(this);
			logo.setProperties({y:(MARGIN/2)+10});
		}
		
		private function buildTitle():void{
			title = new CFM_TextField(titleParams);
			title.renderTo(this);
			title.setProperties({x:MARGIN, y:MARGIN/2});
		}
		
		private function buildSubTitle():void{
			subTitle = new CFM_TextField(subtitleParams);
			subTitle.renderTo(this);
			subTitle.setProperties({x:MARGIN, y:Math.round(title.y + title.height - 3)});
		}
		
		override protected function addListeners():void{
			super.addListeners();
			logo.addEventListener(CFM_ImageEvent.IMAGE_LOADER_COMPLETE, logoComplete, false, 0, true);
		}
		
		private function logoComplete(e:CFM_ImageEvent):void{
			if(logo.hasEventListener(CFM_ImageEvent.IMAGE_LOADER_COMPLETE))
				logo.removeEventListener(CFM_ImageEvent.IMAGE_LOADER_COMPLETE, logoComplete);
			
			logo.loadedBitmap.x = -logo.loadedBitmap.width;
			resize();
		}
		
		private function get titleParams():Object{
			return {text:__model.xml.HEADING_XML.title, font:FontManager.RockwellBold, size:48, color:CJS_Color.DARK_BLUE};
		}
		
		private function get subtitleParams():Object{
			return {text:__model.xml.HEADING_XML.subtitle, font:FontManager.Rockwell, size:12, color:CJS_Color.DARK_GRAY};
		}
		
		public function resize():void{
			logo.setProperties({x:(WIDTH == -1 ? stage.stageWidth : WIDTH) - MARGIN});
		}
	}
}