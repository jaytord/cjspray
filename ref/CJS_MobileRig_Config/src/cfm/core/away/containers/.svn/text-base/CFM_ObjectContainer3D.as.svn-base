package cfm.core.away.containers
{
	import away3dlite.containers.ObjectContainer3D;
	
	import cfm.core.containers.CFM_ObjectContainer;
	import cfm.core.managers.CFM_ResizeManager;
	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class CFM_ObjectContainer3D extends ObjectContainer3D
	{
		public function CFM_ObjectContainer3D()
		{
			super();
		}
		
		public function renderTo(_parent:ObjectContainer3D):void{
			_parent.addChild(this);
			CFM_ResizeManager.addToResizeQue(this);
		}
		
		public function remove():void{
			destroy();
			this.parent.removeChild(this);
		}
		
		public function setProperties(_prop:Object):void{
			for (var p:String in _prop) this[p] = _prop[p]; 
		}
		
		protected function removeChildren():void{
			while(children.length>0){
				var c:* = children[0];
				if(c is CFM_ObjectContainer3D){
					CFM_ObjectContainer3D(c).remove();
				} else {
					removeChild(c);
				}
				c = null;
			}
		}
		
		public function destroy():void{			
			CFM_ResizeManager.removeFromResizeQue(this);
			removeChildren();
		}
	}
}