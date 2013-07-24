package cfm.core.managers {
    import cfm.core.ui.CFM_Tooltip;
    
    import flash.display.Sprite;
    import flash.events.IEventDispatcher;
    import flash.events.MouseEvent;
    import flash.utils.Dictionary;
	
	/**
	 * This is essentially an abstract class ie. extend but do not instantiate.
	 */
	public class CFM_TooltipManager {
		protected var _hash:Dictionary;
		protected var tooltip:CFM_Tooltip;
		protected var container:Sprite;
		
		public function CFM_TooltipManager(_container:Sprite):void {
			container = _container;
			_hash = new Dictionary();
		}
        
		public function addTarget(_target:IEventDispatcher, _lParams:Object, _createTrigger:String = MouseEvent.MOUSE_OVER, _destroyTrigger:String = MouseEvent.MOUSE_OUT):void {
			if (_hash[_target] == null) {
        		_hash[_target] = {target:_target, labelParams:_lParams, createTrigger:_createTrigger, destroyTrigger:_destroyTrigger};
				_target.addEventListener(_createTrigger, enableToolTip/*, false, 0, true*/);
				//_target.addEventListener(_out, destroyTip/*, false, 0, true*/);
			}
        }
        
		protected function enableToolTip(e:*):void {
			//trace("CFM_TooltipManager::createTip()");
			var target:IEventDispatcher = e.currentTarget as IEventDispatcher;
			var params:Object = _hash[e.currentTarget];
			
			target.removeEventListener(params.createTrigger, enableToolTip);
			target.addEventListener(params.destroyTrigger, disableTooltip);
			
			params.tooltip = container.addChild(createTooltip(target, params.labelParams)) as CFM_Tooltip;
			//tooltip.show();
		}
		
 		protected function disableTooltip(e:*):void {
			//trace("CFM_TooltipManager::destroyTip()");
			var target:IEventDispatcher = e.currentTarget as IEventDispatcher;
			var params:Object = _hash[e.currentTarget];
			
			target.removeEventListener(params.destroyTrigger, disableTooltip);
			target.addEventListener(params.createTrigger, enableToolTip);
			
			(params.tooltip as CFM_Tooltip).hide();
		}
		
		public function removeAllTargets():void {
			for each ( var params:Object in _hash) {
				removeTarget(params.target as IEventDispatcher);
			}
		}
		
		public function removeTarget(target:IEventDispatcher):void {
			var params:Object = _hash[target];
			
			if(target.hasEventListener(params.createTrigger)) {
				
				target.removeEventListener(params.createTrigger, enableToolTip);
				
			} else if(target.hasEventListener(params.destroyTrigger)) {
				
				target.removeEventListener(params.destroyTrigger, disableTooltip);
			}
			
			if(params.tooltip) (params.tooltip as CFM_Tooltip).hide();
			
			delete _hash[target];
		}
		
		protected function createTooltip(_target:IEventDispatcher, _labelParams:Object):CFM_Tooltip {
			return new CFM_Tooltip(_target, _labelParams);
		}
		
		//protected function setPosition():void {
		//	tooltip.x = container.stage.mouseX;
		//	tooltip.y = container.stage.mouseY;
		//} 
	}
}