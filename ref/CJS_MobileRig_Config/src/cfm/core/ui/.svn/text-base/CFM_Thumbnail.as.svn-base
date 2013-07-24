package cfm.core.ui
{
	import cfm.core.events.CFM_ThumbnailEvent;
	import cfm.core.graphics.CFM_BoxGraphics;
	import cfm.core.media.CFM_Image;
	import cfm.core.objects.CFM_Object;
	
	import com.greensock.TweenMax;
	
	import flash.display.GradientType;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Matrix;
	
	import mx.utils.NameUtil;
	

	public class CFM_Thumbnail extends CFM_Object
	{
		public var container:Sprite;
		
		public var thumbnailImage:CFM_Image;
		public var thumbnailImageMask:CFM_BoxGraphics;
		public var thumbnailImageBg:CFM_BoxGraphics;
		public var thumbnailHit:CFM_BoxGraphics;
		public var thumbnailBorder:CFM_BoxGraphics;
		
		public var THUNBNAIL_WIDTH:Number;
		public var THUMBNAIL_HEIGHT:Number;
		public var THUMBNAIL_IMAGE_URL:String;
		public var THUMBNAIL_DOMAIN:String;
		
		public var thumbIndex:Number;
		public var thumbValue:String;
		public var thumbId:String;
		public var isSelected:Boolean = false;
		
		public function CFM_Thumbnail(_index:Number, _id:String, _value:String, _image:String, _twidth:Number, _theight:Number, _autoInit:Boolean = true, _autoDestroy:Boolean = true)
		{
			thumbIndex = _index;
			thumbId = _id;
			thumbValue = _value;
			
			THUMBNAIL_IMAGE_URL = _image;
			THUNBNAIL_WIDTH = _twidth;
			THUMBNAIL_HEIGHT = _theight;
			THUMBNAIL_DOMAIN = THUMBNAIL_IMAGE_URL.substring( 0 , THUMBNAIL_IMAGE_URL.indexOf("/", 10 )+1 );
			
			super("cfm_thumbnail",_autoInit,_autoDestroy);
		}
		
		override protected function build():void{
			container = new Sprite();
			addChild(container);
			
			buildBackground();
			buildImage();
			
			thumbnailImageMask = new CFM_BoxGraphics({width:THUNBNAIL_WIDTH, height:THUMBNAIL_HEIGHT, color:0,alpha:1});
			thumbnailImageMask.renderTo(container);
			thumbnailImage.mask = thumbnailImageMask;
			
			buildBorder();
			
			thumbnailHit = new CFM_BoxGraphics({width:THUNBNAIL_WIDTH, height:THUMBNAIL_HEIGHT, color:0xFFFFFF,alpha:1});
			thumbnailHit.setProperties({alpha:0});
			thumbnailHit.buttonMode = true;
			thumbnailHit.renderTo(container);
		}
		
		protected function buildBackground():void{
			thumbnailImageBg = new CFM_BoxGraphics({width:THUNBNAIL_WIDTH, height:THUMBNAIL_HEIGHT, color:0x000000, alpha:0});
			thumbnailImageBg.renderTo(container);
		}
		
		protected function buildImage():void{
			thumbnailImage = new CFM_Image(THUMBNAIL_IMAGE_URL, THUNBNAIL_WIDTH, THUMBNAIL_HEIGHT);
			thumbnailImage.renderTo(container);
		}
		
		protected function buildBorder():void{
			thumbnailBorder = new CFM_BoxGraphics({width:THUNBNAIL_WIDTH, height:THUMBNAIL_HEIGHT, lineStyle:{color:0x000000,thickness:0},color:0,alpha:0});
			thumbnailBorder.renderTo(container);
		}
		
		override protected function addListeners():void{
			thumbnailHit.addEventListener(MouseEvent.CLICK, thumbnailClicked, false, 0, true);
			thumbnailHit.addEventListener(MouseEvent.MOUSE_OVER, thumbnailOver, false, 0, true);
			thumbnailHit.addEventListener(MouseEvent.MOUSE_OUT, thumbnailOut, false, 0, true);
		}
		
		protected function thumbnailOver(e:MouseEvent):void{
			TweenMax.killTweensOf(thumbnailHit);
			TweenMax.to(thumbnailHit, .2, {alpha:.2});
		}
		
		protected function thumbnailOut(e:MouseEvent):void{
			TweenMax.killTweensOf(thumbnailHit);
			TweenMax.to(thumbnailHit, .2, {alpha:0});
		}
		
		public function thumbnailClicked(e:MouseEvent):void{
			dispatchEvent(new CFM_ThumbnailEvent(CFM_ThumbnailEvent.THUMBNAIL_SELECTED,thumbIndex,thumbId, thumbValue,thumbnailImage.loadedBitmap));
		}
		
		override protected function removeListeners():void{
			thumbnailHit.removeEventListener(MouseEvent.CLICK, thumbnailClicked);
			thumbnailHit.removeEventListener(MouseEvent.MOUSE_OVER, thumbnailOver);
			thumbnailHit.removeEventListener(MouseEvent.MOUSE_OUT, thumbnailOut);
		}
	}
}