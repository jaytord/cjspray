package cjs.windows
{
	import cfm.core.events.CFM_ImageEvent;
	import cfm.core.graphics.CFM_BoxGraphics;
	import cfm.core.media.CFM_Image;
	
	import cjs.config.AppConfig;

	public class CJS_InfoWindow extends CJS_WindowTemplate
	{
		private var infoTag:XML;
		protected var image:CFM_Image;
		
		public function CJS_InfoWindow(_index:Number, _xml:XML, _params:Object)
		{
			super(_index, _xml, _params);
			
			infoTag = xml.info.(@id == params.buttonId)[0];
		}
		
		override protected function getSelectionHeading():String{
			var menuLabel:String = "";
			var selectionLabel:String = __model.xml.mainXML..selection.(@id == params.buttonId).label;
			
			try{
				if(selectionLabel){
					menuLabel = XML(__model.xml.mainXML..selection.(@id == params.buttonId)).parent().button[0].label;
				} else {
					menuLabel = XML(__model.xml.mainXML..button.(@id == params.buttonId)).label;
				}
			}catch(e:Error){
				trace(e)
			}	
			
			if(menuLabel == "" && params.heading) menuLabel = params.heading;
			
			return menuLabel + ( selectionLabel ? ": " + selectionLabel : "");
		}
		
		override protected function buildDescription():void{
			super.buildDescription();
			
			if(String(infoTag.@image).length > 0){
				buildImage();
				description.x += 160;
				description.width -= 160;
			}
		}
		
		protected function buildImage():void{
			image = new CFM_Image(AppConfig.IMAGES_DIRECTORY + infoTag.@image, 140, 0, false);
			image.renderTo(content);
			image.setProperties({x:MARGIN+2, y:description.y+4});
			image.addEventListener(CFM_ImageEvent.IMAGE_LOADER_COMPLETE, imageComplete, false, 0, true);
		}
		
		private function imageComplete(e:CFM_ImageEvent):void{
			image.removeEventListener(CFM_ImageEvent.IMAGE_LOADER_COMPLETE, imageComplete);
			
			if((image.y + image.height) < MAX_WINDOW_HEIGHT && (image.y + image.height) > (description.y + description.height)){
				updateSize();
			}
		}
		
		override protected function getSelectionDescription():String{
			return infoTag.child(0);
		}
	}
}