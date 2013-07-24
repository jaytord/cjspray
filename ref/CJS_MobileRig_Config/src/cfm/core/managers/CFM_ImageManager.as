package cfm.core.managers
{
	import flash.display.Bitmap;
	
	public class CFM_ImageManager
	{
		public static var LOADED_IMAGES_ARRAY:Array = [];
		public static var POLICY_DOMAINS:Array = [];
		
		{
			trace("Init - ImageManager");
		}
		
		public static function getBitmapImage(url:String, wdth:Number=0, hght:Number=0):Bitmap{
			var bt:Bitmap;
			
			for each(var bm:Object in LOADED_IMAGES_ARRAY){
				if(bm.url == url){
					bt = new Bitmap(Bitmap(bm.bmp).bitmapData);
					
					if(wdth > 0){
						bt.width = wdth;
						bt.height = wdth/bm.ar;
					}
					
					if(hght>0){
						if(bt.height<hght || wdth == 0){
							bt.height = hght;
							bt.width = hght*bm.ar;
						}
					}
				}
			}
			
			return bt;
		}
		
		public static function isAlreadyLoaded(_url:String):Boolean{
			var alreadyLoaded:Boolean = false;
			
			for each(var al:Object in CFM_ImageManager.LOADED_IMAGES_ARRAY){
				if(al.url == _url) {
					alreadyLoaded = true;
				}
			}
			
			return alreadyLoaded;
		}
	}
}