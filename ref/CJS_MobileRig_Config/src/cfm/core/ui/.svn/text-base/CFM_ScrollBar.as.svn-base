package cfm.core.ui
{
	import cfm.core.containers.CFM_ObjectContainer;
	import cfm.core.events.CFM_ScrollBarEvent;
	import cfm.core.graphics.CFM_BoxGraphics;
	import cfm.core.objects.CFM_Object;
	
	import com.greensock.TweenMax;
	import com.greensock.easing.Cubic;
	
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;

	public class CFM_ScrollBar extends CFM_Object
	{
		protected var container:CFM_ObjectContainer;
		protected var slideContainer:CFM_ObjectContainer;
		protected var thumbContainer:CFM_ObjectContainer;
		
		protected var slideBackground:CFM_BoxGraphics;
		protected var thumbHit:CFM_BoxGraphics;
		protected var currentRatio:Number = 0;
		protected var dragAreaRec:Rectangle;
		
		protected var lastMousePos:Point = new Point();
		protected var lastThumbX:Number;
		
		protected var vertical:Boolean;
		protected var thumbWidth:Number;
		
		public function CFM_ScrollBar(_slideWidth:Number, _thumbWidth:Number, _height:Number, _vertical:Boolean = false, autoInit:Boolean = true, _autoDestroy:Boolean = true)
		{
			dragAreaRec = new Rectangle(0,0,_slideWidth,_height);
			vertical = _vertical;
			thumbWidth = _thumbWidth;
			
			super("scrollbar",autoInit,_autoDestroy);
		}
		
		override protected function build():void{			
			container = new CFM_ObjectContainer();
			container.renderTo(this);
			container.setProperties({x:vertical?thumbWidth:0,rotation:vertical?90:0});
			
			slideContainer = new CFM_ObjectContainer();
			slideContainer.renderTo(container);
			
			thumbContainer = new CFM_ObjectContainer();
			thumbContainer.renderTo(container);
			
			buildSlideBackground();
			buildSlide();
			buildThumb();
			buildThumbHit();
		}
		
		protected function buildSlideBackground():void{
			slideBackground = new CFM_BoxGraphics({width:dragAreaRec.width, height:dragAreaRec.height, color:0x333333, alpha:1});
			slideBackground.renderTo(slideContainer);
		}
		
		protected function buildSlide():void{}
		
		protected function buildThumb():void{
			var thumb:CFM_BoxGraphics = new CFM_BoxGraphics({width:thumbWidth, height:dragAreaRec.height, color:0x666666, alpha:1});
			thumb.renderTo(thumbContainer);
		}
		
		private function buildThumbHit():void{
			thumbHit = new CFM_BoxGraphics({width:thumbWidth, height:dragAreaRec.height, color:0xFFFFFF, alpha:0});
			thumbHit.buttonMode = true;
			thumbHit.renderTo(thumbContainer);
		}
		
		override protected function addListeners():void{
			thumbHit.addEventListener(MouseEvent.MOUSE_DOWN,startDragThumb, false, 0, true);
		}
		
		override protected function removeListeners():void{
			thumbHit.removeEventListener(MouseEvent.MOUSE_DOWN,startDragThumb);
		}
		
		private function startDragThumb(e:MouseEvent):void{
			lastMousePos.y = stage.mouseY;
			lastMousePos.x = stage.mouseX;
			lastThumbX = thumbContainer.x;
			
			thumbHit.removeEventListener(MouseEvent.MOUSE_DOWN,startDragThumb);
			
			if(stage){
				stage.addEventListener(MouseEvent.MOUSE_UP, stopDragThumb);
				stage.addEventListener(MouseEvent.MOUSE_MOVE, thumbHitDragging);
			}
		}
		
		protected function stopDragThumb(e:MouseEvent=null):void{
			TweenMax.killTweensOf(thumbHit);
			
			if(stage){
				stage.removeEventListener(MouseEvent.MOUSE_UP, stopDragThumb);
				stage.removeEventListener(MouseEvent.MOUSE_MOVE, thumbHitDragging);
			}
			
			thumbHit.addEventListener(MouseEvent.MOUSE_DOWN,startDragThumb);
			thumbHit.buttonMode = true;
		}
		
		public function adjustThumb(percent:Number, dispatch:Boolean = false):void{
			TweenMax.killTweensOf(thumbHit);
			
			if(stage){
				stage.removeEventListener(MouseEvent.MOUSE_UP, stopDragThumb);
				stage.removeEventListener(MouseEvent.MOUSE_MOVE, thumbHitDragging);
			}
			
			thumbHit.removeEventListener(MouseEvent.MOUSE_DOWN,startDragThumb);
			thumbHit.buttonMode = false;
			
			var newP:Number = (dragAreaRec.width- thumbWidth)*percent;
			
			if(thumbContainer.x != newP){
				TweenMax.to(thumbContainer, .3, { onUpdate: dispatch ? dispatchNewRatio : null, delay:.1, x:newP, onComplete:stopDragThumb});
			} else {
				stopDragThumb();
			}
		}
		
		protected function thumbHitDragging(e:MouseEvent=null):void{
			if(stage){
				var newThumbX:Number = lastThumbX + (stage.mouseX - lastMousePos.x);
				
				if(vertical){
					newThumbX = lastThumbX + (stage.mouseY - lastMousePos.y);
				}
				
				if(newThumbX < 0){
					newThumbX = 0;
				}
				
				if(newThumbX > dragAreaRec.width-thumbWidth){
					newThumbX = dragAreaRec.width-thumbWidth;
				}
				
				thumbContainer.x = newThumbX;
				dispatchNewRatio();
			}
		}
		
		public function dispatchNewRatio():void{
			currentRatio = (thumbContainer.x/(dragAreaRec.width-thumbWidth));
			dispatchEvent(new CFM_ScrollBarEvent(CFM_ScrollBarEvent.SCROLLING, currentRatio));
		}
		
		private function reset():void{
			TweenMax.to(thumbContainer, .5, {x:0, ease: Cubic.easeInOut});
			lastThumbX = 0;
		}
		
		protected function resize(_width:Number):void{
			dragAreaRec.width = _width;
			
			if(slideBackground) slideBackground.resize(_width,dragAreaRec.height,0,0);
			
			if(thumbContainer.x > dragAreaRec.width - thumbWidth){
				thumbContainer.x = dragAreaRec.width - thumbWidth;
			}
			
			currentRatio = (thumbContainer.x/(dragAreaRec.width-thumbWidth));
		}
	}
}