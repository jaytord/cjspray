package cfm.core.managers {
	import cfm.core.ui.CFM_Cursor;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.IEventDispatcher;
	import flash.events.MouseEvent;
	import flash.utils.Dictionary;

	public class CFM_CursorManager {
		private var _hash:Dictionary;
		protected var container:Sprite;
		
		public function CFM_CursorManager(_container:Sprite) {
			_hash = new Dictionary();
			container = _container;
		}
		
		public function addTarget(_target:IEventDispatcher, _createTrigger:String = MouseEvent.MOUSE_OVER, _destroyTrigger:String = MouseEvent.MOUSE_OUT):void {
			if(_hash[_target] == null) {
				_hash[_target] = {target:_target, createTrigger:_createTrigger, destroyTrigger:_destroyTrigger};
				_target.addEventListener(_createTrigger, enableCursor/*, false, 0, true*/);
			}
		}
		
		protected function enableCursor(e:*):void {
			var target:IEventDispatcher = e.currentTarget as IEventDispatcher;
			var params:Object = _hash[e.currentTarget];
			
			target.removeEventListener(params.createTrigger, enableCursor);
			target.addEventListener(params.destroyTrigger, disableCursor);
			
			params.cursor = container.addChild(createCursor(target)) as CFM_Cursor;
		}
		
		protected function disableCursor(e:*):void {
			var target:IEventDispatcher = e.currentTarget as IEventDispatcher;
			var params:Object = _hash[e.currentTarget];
			
			target.removeEventListener(params.destroyTrigger, disableCursor);
			target.addEventListener(params.createTrigger, enableCursor);
			
			(params.cursor as CFM_Cursor).hide();
		}
		
		public function removeAllTargets():void {
			for each ( var params:Object in _hash) {
				removeTarget(params.target as IEventDispatcher);
			}
		}
		
		public function removeTarget(target:IEventDispatcher):void {
			var params:Object = _hash[target];
			if(params == null) return;
			
			if(target.hasEventListener(params.createTrigger)) {
				
				target.removeEventListener(params.createTrigger, enableCursor);
				
			} else if(target.hasEventListener(params.destroyTrigger)) {
				
				target.removeEventListener(params.destroyTrigger, disableCursor);
			}
			
			if(params.cursor) {
				(params.cursor as CFM_Cursor).hide();
			}
			
			delete _hash[target];
		}
		
		protected function createCursor(_target:IEventDispatcher):CFM_Cursor {
			return new CFM_Cursor(_target);
		}
	}
}