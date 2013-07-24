package cfm.core.ui {
	import cfm.core.containers.CFM_ObjectContainer;
	import cfm.core.objects.CFM_Object;
	import cfm.core.text.CFM_TextField;
	
	import com.greensock.TweenLite;
	
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.utils.setTimeout;
	
	public class CFM_Tooltip extends CFM_Object {
		protected var labelParams:Object;
		protected var label:CFM_TextField;
		protected var backgroundContainer:CFM_ObjectContainer;
		protected var target:IEventDispatcher;
		
		public function CFM_Tooltip(_target:IEventDispatcher, _labelParams:Object) {
			super("CFM_ToolTip", true, true);
			labelParams = _labelParams;
			target = _target;
			mouseEnabled = false;
			mouseChildren = false;
			alpha = 0;
		}
		
		override public function init(e:Event):void {
			super.init(e);
			show();
		}
		
		override protected function build():void {
			buildContainers();
			buildLabel();
			buildBackground();
		}
		
		override protected function addListeners():void {
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		override protected function removeListeners():void {
			removeEventListener(Event.ENTER_FRAME, update);
		}
		
		protected function update(e:Event):void {
			updatePosition();
		}
		
		protected function buildContainers():void {
			backgroundContainer = new CFM_ObjectContainer();
			backgroundContainer.renderTo(this);
		}
		
		protected function buildBackground():void {
		}
		
		protected function buildLabel():void {
			label = new CFM_TextField(labelParams);
			label.renderTo(this);
		}
		
		public function show():void {
			TweenLite.to(this, 0.35, {alpha:1});
		}
		
		public function hide():void {
			TweenLite.to(this, 0.35, {alpha:0, onComplete:destroy, onCompleteParams:[null]});
		}
		
		protected function updatePosition():void {
			x = stage.mouseX;
			y = stage.mouseY;
		}
		
		override protected function destroy(e:Event):void {
			super.destroy(e);
		}
	}
}