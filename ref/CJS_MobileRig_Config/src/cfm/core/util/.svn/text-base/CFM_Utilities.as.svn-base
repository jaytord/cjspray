package cfm.core.util
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	public dynamic class CFM_Utilities
	{
		{
			trace("--Init--JT_Utilities--");
		}
		
		public static function reverseChildren(clip:Sprite):void{
			var cha:Array = [];
			
			for (var i:Number = 0; i < clip.numChildren; i++){
				cha.push(clip.getChildAt(i));
			}
			
			var cid:Number = cha.length-1;
			for each(var c:* in cha){
				try{ clip.setChildIndex(c,cid); } catch(e:Error){ trace(e) };
				cid--;
			}
		}
		
		public static function cloneObject(_source:Object, _add:Object = null):Object{
			var o:Object = new Object();
			for (var p:String in _source) o[p] = _source[p];
			
			if(_add){
				for (var a:String in _add) o[a] = _add[a];
			}
			
			return o;
		}

	}
}