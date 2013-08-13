package cfm.core.ui {
	import cfm.core.away.containers.CFM_ObjectContainer3D;
	import cfm.core.containers.CFM_ObjectContainer;
	import cfm.core.objects.CFM_Object;
	
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.ui.Mouse;
	
	public class CFM_Cursor extends CFM_Object {
		protected var graphicContainer:CFM_ObjectContainer;
		protected var target:IEventDispatcher;
		
		public function CFM_Cursor(_target:IEventDispatcher) {
			super("CFM_Cursor", true, true);
			
			target = _target;
			mouseEnabled = false;
			mouseChildren = false;;
		}
		
		override public function init(e:Event):void {
			super.init(e);
			show();
		}
		
		override protected function build():void {
			super.build();
			graphicContainer = new CFM_ObjectContainer();
			graphicContainer.renderTo(this);
			//graphicContainer.visible = false;
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
		
		public function show():void {
			Mouse.hide();
			graphicContainer.visible = true;
		}
		
		public function hide():void {
			graphicContainer.visible = false;
			Mouse.show();
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