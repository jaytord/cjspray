package cfm.core.factories
{
	import cfm.core.containers.CFM_ObjectContainer;
	import cfm.core.graphics.CFM_BoxGraphics;
	
	import com.greensock.TweenMax;
	import com.greensock.easing.Linear;
	
	public class CFM_WindowFactory extends CFM_PageFactory
	{
		protected var overlay:CFM_BoxGraphics;
		
		public function CFM_WindowFactory(_pageContainer:CFM_ObjectContainer, _pageList:XMLList)
		{
			super(_pageContainer,_pageList);
			
			buildOverlay();
		}
		
		protected function buildOverlay():void{
			overlay = new CFM_BoxGraphics({width:10,height:10,color:0xFFFFFF, alpha:.8});
			overlay.renderTo(pageContainer);
			hideOverlay(false);
		}
		
		public function showOverlay(_tween:Boolean = true):void{
			TweenMax.killTweensOf(overlay);
			TweenMax.to(overlay, _tween ? .3 : 0, {autoAlpha:1, ease:Linear.easeNone});
		}
		
		public function hideOverlay(_tween:Boolean = true):void{
			TweenMax.killTweensOf(overlay);
			TweenMax.to(overlay, _tween ? .3 : 0, {autoAlpha:0, ease:Linear.easeNone});
		}
		
		override public function removeCurrentPage(_tween:Boolean = true):void{
			super.removeCurrentPage(_tween);
			hideOverlay();
		}
		
		override protected function newPage(_params:Object = null):void{
			showOverlay();
			super.newPage(_params);
		}
		
		public function resize(_w:Number, _h:Number):void{
			overlay.resize(_w,_h,-_w/2,-_h/2);
			pageContainer.setProperties({x:_w/2, y:_h/2});
		}
	}
}