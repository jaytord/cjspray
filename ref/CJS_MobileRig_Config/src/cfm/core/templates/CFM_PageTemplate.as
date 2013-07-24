package cfm.core.templates
{
	import cfm.core.containers.CFM_ObjectContainer;
	import cfm.core.events.CFM_PageEvent;
	import cfm.core.interfaces.IResize;
	import cfm.core.objects.CFM_Object;
	
	import com.greensock.TweenMax;
	import com.greensock.easing.Linear;
	
	import flash.events.Event;

	public class CFM_PageTemplate extends CFM_Object implements IResize
	{
		public var index:Number;
		public var id:String;
		protected var xml:XML;
		protected var content:CFM_ObjectContainer;
		protected var params:Object;
		
		public function CFM_PageTemplate(_index:Number, _xml:XML, _params:Object)
		{
			index = _index;
			id = _xml.@id;
			xml = _xml;
			params = _params;
			
			super("PageTemplate_" + _xml.@classname,true,true);
		}
		
		override protected function build():void{
			content = new CFM_ObjectContainer(true);
			content.setProperties({alpha:0, visible:false});
			content.renderTo(this);
			
			buildBackground();
			
			if(xml.heading.length() > 0){buildHeading();}
			if(xml.description.length() > 0) buildDescription();
			
			buildContent();
			
			if(xml.@close == "true") buildCloseButton();
			
			if(xml.navigation.length() > 0) buildNavigation();
			
			resize();
			
			buildComplete();
			transitionIn();
		}
		
		protected function buildBackground():void{}
		
		protected function buildComplete():void{
			dispatchEvent(new CFM_PageEvent(CFM_PageEvent.BUILD_COMPLETE));
		}
		
		protected function buildHeading():void{}
		
		protected function buildDescription():void{}
		
		protected function buildContent():void{}
		
		protected function buildNavigation():void{}
		
		protected function buildCloseButton():void{}
		
		public function initContent():void{}
		
		public function transitionIn():void{
			TweenMax.to(content, .2,{delay:.2, autoAlpha:1, onComplete:transitionInComplete, ease:Linear.easeNone});
		}
		
		public function transitionInComplete():void{
			dispatchEvent(new CFM_PageEvent(CFM_PageEvent.TRANSITION_IN_COMPLETE));
		}
		
		public function transitionOut(_newParams:Object):void{
			TweenMax.to(content, .2,{autoAlpha:0, onComplete:transitionOutComplete, onCompleteParams:[_newParams], ease:Linear.easeNone});
		}
		
		public function transitionOutComplete(_newParams:Object):void{
			dispatchEvent(new CFM_PageEvent(CFM_PageEvent.TRANSITION_OUT_COMPLETE,id,_newParams));
		}
		
		override protected function destroy(e:Event):void{
			super.destroy(e);
			dispatchEvent(new CFM_PageEvent(CFM_PageEvent.DESTROY_COMPLETE));
		}
		
		public function resize():void{
			
		}
	}
}