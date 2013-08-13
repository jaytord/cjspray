package cfm.core.away.objects
{
	import away3dlite.containers.ObjectContainer3D;
	
	import cfm.core.away.containers.CFM_ObjectContainer3D;
	import cfm.core.containers.CFM_ObjectContainer;
	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class CFM_Object3D extends CFM_ObjectContainer3D
	{
		private var objectId:String;
		private var initParams:Object;
		
		public function CFM_Object3D(_objectId:String)
		{
			super();
			
			objectId = _objectId;
		}
		
		public override function renderTo(_parent:ObjectContainer3D):void{
			super.renderTo(_parent);
			init();
		}
		
		public function init():void{
			trace("--Init--CFM_Object3D--" + objectId);

			build();
			addListeners();
		}
		
		protected function startBuild():void{}
		
		protected function build():void{}
		
		protected function buildComplete():void{}
		
		protected function addListeners():void{}
		
		protected function removeListeners():void{}
		
		protected function startDestroy():void{}

		protected function destroyComplete():void{}
		
		public override function destroy():void{
			startDestroy();
			removeListeners();
			super.destroy();
			destroyComplete();
			
			trace("--Destroy--CFM_Object3D--" + objectId);
		}
	}
}