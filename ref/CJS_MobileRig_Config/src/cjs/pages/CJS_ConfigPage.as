package cjs.pages
{
	import cfm.core.events.CFM_ImageEvent;
	import cfm.core.text.CFM_TextField;
	
	import cjs.events.CJS_ConfigurationEvent;
	import cjs.events.CJS_ModeEvent;
	import cjs.managers.FontManager;
	import cjs.ui.CJS_AccessoriesPanel;
	import cjs.ui.CJS_ConfigNumber;
	import cjs.ui.CJS_ImagePanel;
	import cjs.ui.CJS_PrintFrame;
	import cjs.ui.CJS_SelectionsPanel;
	
	import com.adobe.images.JPGEncoder;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.BlendMode;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.filters.DropShadowFilter;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	import flash.net.FileReference;
	import flash.printing.PrintJob;
	import flash.printing.PrintJobOptions;
	import flash.printing.PrintJobOrientation;
	import flash.system.JPEGLoaderContext;
	import flash.utils.ByteArray;
		
	public class CJS_ConfigPage extends CJS_PageTemplate
	{
		private var configNumber					:CJS_ConfigNumber;
		private var selectionsPanel					:CJS_SelectionsPanel;
		private var accessoriesPanel				:CJS_AccessoriesPanel;
		private var imagePanel						:CJS_ImagePanel;
		private var price							:CFM_TextField;
		private var bitmapData						:BitmapData;
		private var jpegEncoder						:JPGEncoder = new JPGEncoder(80);
		private var jpegBytes						:ByteArray;
		private var drawMatrix						:Matrix;
		private var drawClip						:Rectangle;
		private var fileRef							:FileReference = new FileReference();
		private var printFrame						:CJS_PrintFrame;
		private var printJob						:PrintJob;
		private var printPageContainer				:Sprite;
		private var printPageBitmap					:Bitmap;
		
		public function CJS_ConfigPage(_pageId:String)
		{
			super(_pageId);
		}
		
		override protected function build():void{
			super.build();
			
			buildSelectionsPanel();
			buildAccessoriesPanel();
			buildPrice();
			buildConfigNumber();
			buildImagePanel();
			buildPrintFrame();
		}
		
		override protected function addListeners():void{
			super.addListeners();
			imagePanel.addEventListener(CFM_ImageEvent.IMAGE_LOADER_COMPLETE, imagePanelImageComplete, false, 0, true);
			
			__model.config.addEventListener(CJS_ConfigurationEvent.OPTION_CHANGED, onOptionChanged, false, 0, true);
			__model.config.addEventListener(CJS_ConfigurationEvent.RESET_ALL, onOptionsReset, false, 0, true);
			__model.config.addEventListener(CJS_ConfigurationEvent.ACCESSORYS_CHANGED, onAccessoryChanged, false, 0, true);
		}
		
		public function buildConfigNumber():void{
			configNumber = new CJS_ConfigNumber();
			configNumber.renderTo(this);
			configNumber.setProperties({x:550, y:370});
		}
		
		public function buildSelectionsPanel():void{
			heading.setProperties({y:20});
			selectionsPanel = new CJS_SelectionsPanel();
			selectionsPanel.renderTo(this);
			selectionsPanel.setProperties({y:heading.y + heading.height});
		}
		
		public function buildAccessoriesPanel():void{
			accessoriesPanel = new CJS_AccessoriesPanel();
			accessoriesPanel.renderTo(this);
			accessoriesPanel.setProperties({y:250});
		}
		
		public function buildImagePanel():void{
			imagePanel = new CJS_ImagePanel();
			imagePanel.renderTo(this);
			imagePanel.setProperties({x:570, y:10});
			imagePanel.blendMode = BlendMode.DARKEN;
		}
		
		public function buildPrice():void{
			price = new CFM_TextField({text:"$0", size:30, color:0x333333, font:FontManager.RockwellBold});
			price.renderTo(this);
			price.setProperties({y:400});
		}
		
		public function buildPrintFrame():void{
			printFrame = new CJS_PrintFrame(configNumber.x + configNumber.width, price.y + price.height+40);
			printFrame.renderTo(this);
			printFrame.setProperties({visible:false});
		}
		
		public function updatePrice(_price:String):void{
			price.text = _price;
			price.setProperties({x:configNumber.x + configNumber.width - price.width});
		}
		
		override protected function clearAll():void{
			super.clearAll();
			dispatchEvent(new CJS_ModeEvent(CJS_ModeEvent.MODE_CHANGED, CJS_ModeEvent.TRAILER_MODE));
		}
		
		protected function onOptionsReset(e:CJS_ConfigurationEvent):void{
			configNumber.reset();
			imagePanel.reset();
			updatePrice(e.totalPrice);
			selectionsPanel.updateSelections();
		}
		
		protected function onOptionChanged(e:CJS_ConfigurationEvent):void{			
			configNumber.updateSection(e.menuValue,e.itemValue);
			updateSelections();
			updatePrice(e.totalPrice);
			imagePanel.updateImage(e.menuValue,e.itemValue);
		}
		
		public function updateSelections():void{
			selectionsPanel.updateSelections();
		}
		
		protected function onAccessoryChanged(e:CJS_ConfigurationEvent):void{
			accessoriesPanel.updateSelections();
			updatePrice(e.totalPrice);
		}
		
		private function imagePanelImageComplete(e:CFM_ImageEvent):void{
			resize();
		}
		
		override protected function prevPage():void{
			dispatchEvent(new CJS_ModeEvent(CJS_ModeEvent.MODE_CHANGED, CJS_ModeEvent.ACCESSORY_MODE));
		}
		
		private function initPrint():void{
			printJob = new PrintJob();
			printPageBitmap = new Bitmap(bitmapData,"auto",true);
			
			printPageContainer = new Sprite();
			printPageContainer.addChild(printPageBitmap);
			printPageContainer.scaleX = printPageContainer.scaleY = .74;
			printPageContainer.x = 100;
			printPageContainer.y = 10;
			printPageContainer.filters = [new DropShadowFilter(14,45,0,.4,20,20)];
			printPageBitmap.smoothing = true;
			
			addChild(printPageContainer);
		}
		
		override protected function print():void{
			updateBitmapData();
			initPrint();
			
			if (printJob.start()) {
				try {
					printJob.addPage(printPageContainer,null,null);
				}
				catch(e:Error) {
					trace(e);
				}
				
				printJob.send();
			}
			
			killPrint();
		}
		
		private function killPrint():void{
			printPageContainer.removeChild(printPageBitmap);
			removeChild(printPageContainer);
			
			printPageBitmap = null;
			printPageContainer = null;
			printJob = null;
		}
		
		private function updateBitmapData():void{
			printFrame.setProperties({visible:true});
			navigation.setProperties({visible:false});
			
			drawMatrix = new Matrix(1,0,0,1,20,80);
			drawClip = new Rectangle(-20,20,this.width+40,this.height + 30);
			
			bitmapData = new BitmapData(this.width+40,this.height + 30,true,0xFFFFFFFF);
			bitmapData.draw(this,drawMatrix,null,null,drawClip,true);
						
			printFrame.setProperties({visible:false});
			navigation.setProperties({visible:true});
		}
		
		override protected function save():void{
			updateBitmapData();
			
			jpegBytes = jpegEncoder.encode(bitmapData);
			fileRef.save(jpegBytes,__model.config.configurationToString.replace(new RegExp(":","gs"),"").replace(new RegExp("-","gs"),"") + ".jpg");
		}
		
		override public function resize():void{
			super.resize();
			
			setProperties({x:(CJS_MobileRig_Config.PAGE_WIDTH*3)+((stage.stageWidth-width)/2)});
		}
	}
}