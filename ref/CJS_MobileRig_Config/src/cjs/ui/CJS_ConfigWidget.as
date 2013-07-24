package cjs.ui
{
	import cfm.core.containers.CFM_ObjectContainer;
	import cfm.core.graphics.CFM_BoxGraphics;
	import cfm.core.objects.CFM_Object;
	import cfm.core.text.CFM_TextField;
	
	import cjs.config.AppConfig;
	import cjs.events.CJS_ConfigurationEvent;
	import cjs.managers.FontManager;
	import cjs.model.AppModel;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	
	public class CJS_ConfigWidget extends CFM_Object
	{
		private var __model:AppModel;
		
		private var priceField:CFM_TextField;
		private var imageOutline:CFM_BoxGraphics;
		private var imageContainer:CFM_ObjectContainer;
		private var image:Bitmap;
		
		private var IMAGE_MARGIN:Number = 20;
		private var showImage:Boolean;
		
		public function CJS_ConfigWidget(_showImage:Boolean = true)
		{
			__model = AppModel.inst;
			showImage = _showImage;
			
			super("CJS_ConfigWidget");
		}
		
		override protected function build():void{
			super.build();
			
			buildPrice();
			buildImage();
		}
		
		private function buildPrice():void{
			priceField = new CFM_TextField({text:"$0", size:24, color:0x333333, font:FontManager.RockwellBold});
			priceField.renderTo(this);
			priceField.setProperties({y:-priceField.height - 20});
		}
		
		override protected function addListeners():void{
			super.addListeners();
			__model.config.addEventListener(CJS_ConfigurationEvent.OPTION_CHANGED, onOptionChanged, false, 0, true);
			__model.config.addEventListener(CJS_ConfigurationEvent.RESET_ALL, onOptionChanged, false, 0, true);
			__model.config.addEventListener(CJS_ConfigurationEvent.ACCESSORYS_CHANGED, onAccessoryChanged, false, 0, true);
			__model.config.addEventListener(CJS_ConfigurationEvent.IMAGE_CHANGED, onImageChanged, false, 0, true);
		}
		
		protected function onImageChanged(e:CJS_ConfigurationEvent):void{
			updateImage(e.bitmapData);
		}
		
		private function onOptionChanged(e:CJS_ConfigurationEvent):void{
			updatePrice(e.totalPrice);
		}
		
		private function onAccessoryChanged(e:CJS_ConfigurationEvent):void{
			updatePrice(e.totalPrice);
		}
		
		public function updatePrice(_price:String):void{
			priceField.text = _price;
			setPricePosition();
		}
		
		public function setPricePosition():void{
			priceField.setProperties({x:-(showImage?imageOutline.width:0)-priceField.width-IMAGE_MARGIN});
		}
		
		public function updateImage(_bitmapData:BitmapData):void{
			image.bitmapData = _bitmapData;
			image.x = -image.width-IMAGE_MARGIN;
			image.y = -image.height-(IMAGE_MARGIN/2);
			image.smoothing = true;
			
			imageOutline.resize(image.width+(IMAGE_MARGIN*2),image.height+(IMAGE_MARGIN*2),-image.width-(IMAGE_MARGIN*2),-image.height-(IMAGE_MARGIN*2));
			setPricePosition();
		}
		
		public function buildImage():void{
			imageContainer = new CFM_ObjectContainer();
			imageContainer.renderTo(this);
			if(!showImage) imageContainer.visible = false;
			
			imageOutline = new CFM_BoxGraphics({radius:[14,14,0,0], lineStyle:{color:0xEEEEEE,thickness:1}, x:-IMAGE_MARGIN, y:-IMAGE_MARGIN, height:10, width:10, color:0xFFFFFF, alpha:1});
			imageOutline.renderTo(imageContainer);
			
			image = new Bitmap(null,"auto",true);
			imageContainer.addChild(image);
			image.scaleX = image.scaleY = .78;
			image.smoothing = true;
		}
	}
}