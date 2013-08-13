package cfm.core.managers
{
	import cfm.core.interfaces.IResize;

	public class CFM_ResizeManager
	{
		private static var resizeQue:Array;
		
		{
			trace("Init - ResizeManager");
			
			resizeQue = [];
		}
		
		public static function addToResizeQue(_object:Object):void{
			if(resizeQue.indexOf(_object) == -1){
				if(_object is IResize){
					resizeQue.push(_object);
					_object.resize();
				}
			}
		}
		
		public static function removeFromResizeQue(_object:Object):void{
			if(resizeQue.indexOf(_object) != -1){
				resizeQue.splice(resizeQue.indexOf(_object),1);
			}
		}
		
		public static function resize():void{
			for each(var o:Object in resizeQue){
				o.resize();
			}
		}
	}
}