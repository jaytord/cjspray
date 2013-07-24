package cjs.ui
{
	import cfm.core.interfaces.IResize;
	import cfm.core.objects.CFM_Object;
	import cfm.core.text.CFM_TextField;
	
	import cjs.managers.FontManager;
	import cjs.model.AppModel;
	import cjs.util.CJS_Color;
	
	public class CJS_Footer extends CFM_Object implements IResize
	{
		private var __model:AppModel;
		private var contact:CFM_TextField;
		
		private var MARGIN:Number;
		private var WIDTH:Number;
		private var HEIGHT:Number;
		
		public function CJS_Footer(_width:Number = -1, _height:Number = -1, _margin:Number = 40)
		{
			__model = AppModel.inst;
			
			WIDTH = _width;
			HEIGHT = _height;
			MARGIN = _margin;
			
			super("CJS_Footer", true,true);
		}
		
		override protected function build():void{
			contact = new CFM_TextField(contactParams);
			contact.renderTo(this);
			contact.setProperties({y:-contact.height});
		}
		
		private function get contactParams():Object{
			return {text:__model.xml.FOOTER_XML.contact, font:FontManager.Rockwell, size:14, color:0xAAAAAA};
		}
		
		public function resize():void{
			setProperties({y:(HEIGHT == -1 ? stage.stageHeight : HEIGHT)});
			contact.setProperties({x:/*(WIDTH == -1 ? stage.stageWidth : WIDTH) - */MARGIN/* - contact.width*/});
		}
	}
}