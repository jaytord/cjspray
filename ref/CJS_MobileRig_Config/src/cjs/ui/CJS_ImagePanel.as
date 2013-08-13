package cjs.ui
{
	import cfm.core.containers.CFM_ObjectContainer;
	import cfm.core.events.CFM_ImageEvent;
	import cfm.core.media.CFM_Image;
	import cfm.core.objects.CFM_Object;
	
	import cjs.config.AppConfig;
	import cjs.model.AppModel;
	
	import flash.display.BitmapData;
	import flash.events.Event;
	
	public class CJS_ImagePanel extends CFM_Object
	{
		private var __model:AppModel;
		
		private var image:CFM_Image;
		private var imageContainer:CFM_ObjectContainer;
		private var containers:Array = [];
		
		public const IMAGE_WIDTH:Number = 400;
		
		public function CJS_ImagePanel()
		{
			__model = AppModel.inst;
			
			super("ImagePanel", true, true);
		}
		
		override protected function build():void{
			super.build();
			buildContainers();
		}
		
		private function buildContainers():void{
			var sortArray:Array = [];
			
			for each(var a:XML in __model.xml.CONFIGURATION_LIST)
				sortArray.push({index:parseInt(a.@imageLayerIndex), name:a.@id});
				
			sortArray.sortOn("index");
				
			for each(var b:Object in sortArray){
				imageContainer = new CFM_ObjectContainer();
				imageContainer.renderTo(this);
				containers[b.name] = {container:imageContainer, image:null};
			}
		}
		
		public function reset():void{
			for (var c:String in containers){
				if(!containers[c].image || c == "B"){
					continue;
				} else {
					CFM_Image(containers[c].image).remove();
					containers[c].image = null;
				}
			}
			
			__model.config.imageChangeComplete(currentBitmapData);
		}
		
		override protected function addListeners():void{
			super.addListeners();
		}
		
		override protected function removeListeners():void{
			super.removeListeners();
			if(image) image.removeEventListener(CFM_ImageEvent.IMAGE_LOADER_COMPLETE, imageComplete);
		}
		
		public function updateImage(_menuValue:String, _itemValue:String):void{
			var url:String = getImageUrl( _menuValue, _itemValue);
			
			if(url != ""){
				trace("Init load image :::: " + url);
				
				if(containers[_menuValue].image){
					trace("   :: Another image is in container.");
					
					if(CFM_Image(containers[_menuValue].image).url != AppConfig.IMAGES_DIRECTORY + url){
						trace("			:: Image is different - Loading...");
						
						killCurrentImage(_menuValue);
						loadImage(url, _menuValue);
					} else {
						trace("			:: Image is the same - Not loading.")
					}
				} else {
					trace("   :: No image in container - Loading new...");
					
					loadImage(url, _menuValue);
				}
			} else {
				killCurrentImage(_menuValue);
				__model.config.imageChangeComplete(currentBitmapData);
				
				trace("No image exists");
			}
		}
		
		public function get currentBitmapData():BitmapData{
			var bmpd:BitmapData = new BitmapData(this.width,this.height,false,0xFFFFFF);
			bmpd.draw(this,null,null,null,null,true);
			return bmpd;
		}
		
		private function killCurrentImage(_containerId:String):void{
			if(containers[_containerId].image){
				CFM_Image(containers[_containerId].image).remove();
				containers[_containerId].image = null;
			}
		}
		
		private function loadImage(_url:String, _containerId:String):void{				
			image = new CFM_Image(AppConfig.IMAGES_DIRECTORY + _url,IMAGE_WIDTH,0,false);
			image.addEventListener(CFM_ImageEvent.IMAGE_LOADER_COMPLETE, imageComplete, false, 0, true);
			image.renderTo(containers[_containerId].container);
			containers[_containerId].image = image;
		}
		
		private function imageComplete(e:CFM_ImageEvent):void{
			var image:CFM_Image = e.currentTarget as CFM_Image;
			image.removeEventListener(CFM_ImageEvent.IMAGE_LOADER_COMPLETE, imageComplete);
			
			__model.config.imageChangeComplete(currentBitmapData);
			
			dispatchEvent(new CFM_ImageEvent(e.type,e.url,e.bmp,e.percent));
		}
		
		private function getImageUrl(_menuValue:String, _itemValue:String):String{
			var url:String = __model.xml.mainXML..menu.(@id == _menuValue).selection.(@value==_itemValue).@image;
			
			if(_menuValue == "B")
				url = __model.xml.IMAGE_LIST.(@trailer == __model.config.ctrailer).(@items == "NA").@url;
			else
				url = __model.xml.IMAGE_LIST.(@trailer == __model.config.ctrailer).(@items.indexOf("|" + _menuValue + "-" + _itemValue + "|") != -1).@url;
			
			return url;
		}
	}
}