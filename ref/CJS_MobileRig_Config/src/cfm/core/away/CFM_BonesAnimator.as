package cfm.core.away
{
	import away3dlite.animators.BonesAnimator;
	import away3dlite.animators.bones.Channel;
	import away3dlite.animators.bones.SkinVertex;
	import away3dlite.containers.ObjectContainer3D;
	
	import flash.utils.Dictionary;

	
	public class CFM_BonesAnimator extends BonesAnimator
	{		
		public function CFM_BonesAnimator()
		{
			super();
		}
		
		public function get skinVerticies():Vector.<SkinVertex>{
			return _skinVertices;
		}
		
		override public function update(_time:Number, _interpolate:Boolean=true):void{
			// ensure vertex list is populated
			if (!_skinVertices.fixed)
				populateVertices();
			
			//update channels
			for each (var channel:Channel in _channels){
				channel.update(_time, _interpolate);
			}
			
			//update skincontrollers
			for each(_skinController in _skinControllers)
			_skinController.update();
			
			//update skinvertices
			for each(_skinVertex in _skinVertices)
			_skinVertex.update();
		}	
		
		public function updateChannel(_name:String, _time:Number, _exactName:Boolean = false, _interpolate:Boolean=true):void{
				if (!_skinVertices.fixed){
					populateVertices();
				}
			
				for each (var channel:Channel in _channels){
					
					if(_exactName){
						if(channel.name == _name){
							channel.update(_time, _interpolate);
						}
					} else {
						if(channel.name.indexOf(_name) != -1){
							channel.update(_time, _interpolate);
						}
					}
				}
			
				//update skincontrollers
				for each(_skinController in _skinControllers){
					if(_exactName){
						if(_skinController.name == _name){
							_skinController.update();
						}
					} else {
						if(_skinController.name.indexOf(_name) != -1){
							_skinController.update();
						}
					}
				}
				
				//update skinvertices
				for each(_skinVertex in _skinVertices)
				_skinVertex.update();
				
				
		}
	}
}