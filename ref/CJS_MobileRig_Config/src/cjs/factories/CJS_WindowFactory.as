package cjs.factories
{
	import cfm.core.containers.CFM_ObjectContainer;
	import cfm.core.events.CFM_PageEvent;
	import cfm.core.factories.CFM_WindowFactory;
	import cfm.core.graphics.CFM_BoxGraphics;
	import cfm.core.templates.CFM_PageTemplate;
	
	import cjs.windows.CJS_DealerLoginWindow;
	import cjs.windows.CJS_ErrorWindow;
	import cjs.windows.CJS_InfoWindow;
	
	import flash.utils.getDefinitionByName;
		
	public class CJS_WindowFactory extends CFM_WindowFactory
	{
		CJS_DealerLoginWindow,CJS_InfoWindow,CJS_ErrorWindow
		
		private var cButtonId:String;
		
		public function CJS_WindowFactory(_pageContainer:CFM_ObjectContainer, _pageList:XMLList)
		{
			super(_pageContainer, _pageList);
		}
		
		override protected function buildOverlay():void{
			overlay = new CFM_BoxGraphics({width:10,height:10,color:0x333333, alpha:.6});
			overlay.renderTo(pageContainer);
			hideOverlay(false);
		}
		
		override public function changePage(_id:String, _params:Object = null):void{
			if(pageChanging){
				pageWaiting = _id; 
				return;
			}
			
			if(_params)
				if(_params.buttonId == cButtonId)
					return;
				else
					cButtonId = _params.buttonId;
			
			pageChanging = true;
			newPageId = _id;
			
			if(currPage){
				prevPage = currPage;
				prevPage.addEventListener(CFM_PageEvent.TRANSITION_OUT_COMPLETE, pageOutComplete);
				prevPage.transitionOut(_params);
			} else {
				newPage(_params);
			}
		}
		
		
		override protected function getPage(_index:Number, _pxml:XML, _params:Object):CFM_PageTemplate{
			var WindowClass:Class = getDefinitionByName("cjs.windows." + _pxml.@classname) as Class;
			var window:CFM_PageTemplate = new WindowClass(_index, _pxml, _params);
			
			return window;
		}
	}
}