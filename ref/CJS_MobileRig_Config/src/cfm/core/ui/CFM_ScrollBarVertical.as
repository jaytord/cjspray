package cfm.core.ui
{
	import cfm.core.events.CFM_ScrollBarEvent;
	import cfm.core.graphics.CFM_BoxGraphics;
	import cfm.core.objects.CFM_Object;
	
	import com.greensock.TweenMax;
	import com.greensock.easing.Cubic;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.filters.DropShadowFilter;
	import flash.geom.Rectangle;

	public class CFM_ScrollBarVertical extends CFM_Object
	{
		public var thumb:CFM_BoxGraphics;
		public var thumbHint:Sprite;
		public var slideArea:CFM_BoxGraphics;
		public var currentRatio:Number = 0;
		public var dragAreaRec:Rectangle;
		
		public var lastMouseY:Number;
		public var lastThumbY:Number;
		
		public var container:Sprite;
		
		public function CFM_ScrollBarVertical(w:Number, h:Number,autoInit:Boolean = true,_autoDestroy:Boolean = true)
		{
			dragAreaRec = new Rectangle(0,0,w,h);
			
			super("scrollbar",autoInit,_autoDestroy);
		}
		
		override protected function build():void{			
			container = new Sprite();
			addChild(container);
			
			slideArea = new CFM_BoxGraphics({width:dragAreaRec.width, height:dragAreaRec.height, color:0, alpha:.1, radius:dragAreaRec.width});
			slideArea.filters = [new DropShadowFilter(3,45,0,1,5,5,1,1,true)];
			slideArea.renderTo(container);
			
			thumb = new CFM_BoxGraphics({width:dragAreaRec.width, height:dragAreaRec.height*.35, color:0, alpha:1, radius:dragAreaRec.width});
			thumb.buttonMode = true;
			thumb.renderTo(container);
		}
		
		override protected function addListeners():void{
			thumb.addEventListener(MouseEvent.MOUSE_DOWN,startDragThumb, false, 0, true);
			thumb.addEventListener(MouseEvent.MOUSE_OVER,thumbOver, false, 0, true);
			thumb.addEventListener(MouseEvent.MOUSE_OUT,thumbOut, false, 0, true);
		}
		
		override protected function removeListeners():void{
			thumb.removeEventListener(MouseEvent.MOUSE_DOWN,startDragThumb);
			thumb.removeEventListener(MouseEvent.MOUSE_OVER,thumbOver);
			thumb.removeEventListener(MouseEvent.MOUSE_OUT,thumbOut);
		}
		
		public function show():void{
			TweenMax.to(container, .3, {x:-dragAreaRec.width});
		}
		
		public function hide():void{
			TweenMax.to(container, .3, {x:0});
		}
		
		public function thumbOver(e:MouseEvent):void{
			
		}
		
		public function thumbOut(e:MouseEvent):void{
			
		}
		
		public function startDragThumb(e:MouseEvent):void{
			lastMouseY = stage.mouseY;
			lastThumbY = thumb.y;
			
			thumb.removeEventListener(MouseEvent.MOUSE_DOWN,startDragThumb);
			
			if(stage){
				stage.addEventListener(MouseEvent.MOUSE_UP, stopDragThumb);
				stage.addEventListener(MouseEvent.MOUSE_MOVE, thumbDragging);
			}
			
			thumbOver(null);
		}
		
		public function stopDragThumb(e:MouseEvent=null):void{
			TweenMax.killTweensOf(thumb);
			
			if(stage){
				stage.removeEventListener(MouseEvent.MOUSE_UP, stopDragThumb);
				stage.removeEventListener(MouseEvent.MOUSE_MOVE, thumbDragging);
			}
			
			thumb.addEventListener(MouseEvent.MOUSE_DOWN,startDragThumb);
			thumb.buttonMode = true;
			
			thumbOut(null);
		}
		
		public function adjustThumb(percent:Number, dispatch:Boolean = false):void{
			TweenMax.killTweensOf(thumb);
			
			if(stage){
				stage.removeEventListener(MouseEvent.MOUSE_UP, stopDragThumb);
				stage.removeEventListener(MouseEvent.MOUSE_MOVE, thumbDragging);
			}
			
			thumb.removeEventListener(MouseEvent.MOUSE_DOWN,startDragThumb);
			thumb.buttonMode = false;
			
			var newP:Number = (dragAreaRec.height-thumb.height)*percent;
			
			if(thumb.y != newP){
				TweenMax.to(thumb, .3, { onUpdate: dispatch ? dispatchNewRatio : null, delay:.1, y:newP, onComplete: stopDragThumb});
			} else {
				stopDragThumb();
			}
			
			thumbOut(null);
		}
		
		public function thumbDragging(e:MouseEvent=null):void{
			thumbOver(null);
			
			var newThumbY:Number = lastThumbY + (stage.mouseY - lastMouseY);
			
			if(newThumbY < 0){
				newThumbY = 0;
			}
			
			if(newThumbY > dragAreaRec.height-thumb.height){
				newThumbY = dragAreaRec.height-thumb.height;
			}
			
			thumb.y = newThumbY;
			dispatchNewRatio();
		}
		
		public function dispatchNewRatio():void{
			currentRatio = (thumb.y/(dragAreaRec.height-thumb.height));
			dispatchEvent(new CFM_ScrollBarEvent(CFM_ScrollBarEvent.SCROLLING, currentRatio));
		}
		
		public function reset():void{
			TweenMax.to(thumb, .5, {y:0, ease: Cubic.easeInOut});
			lastThumbY = 0;
			
			thumbOut(null);
		}
		
		public function resize(h:Number):void{
			if(dragAreaRec){
				dragAreaRec.height = h;
			}
			
			if(slideArea){
				slideArea.height = h;
			}
			
			if(thumb){
				if(thumb.y > slideArea.height - thumb.height){
					thumb.y = slideArea.height - thumb.height;
				}
			}
			
			if(thumb && dragAreaRec){
				currentRatio = (thumb.y/(dragAreaRec.height-thumb.height));
			}
		}
	}
}