package cfm.core.ui
{
	import cfm.core.objects.CFM_Object;
	import cfm.utils.generateGridPoints;
	
	import flash.geom.Point;
	
	public class CFM_ThumbnailPanel extends CFM_Object
	{
		protected var thumbList:XMLList;
		protected var thumbnail:CFM_Thumbnail;
		protected var imageDirectory:String;
		
		protected var thumbColumns:Number;
		protected var thumbWidth:Number;
		protected var thumbHeight:Number;
		protected var thumbSpacing:Number;
		protected var thumbnailArray:Array = [];
		
		public function CFM_ThumbnailPanel(		_imageDirectory:String,
												_thumbList:XMLList, 
												_thumbColumns:Number, 
												_thumbWidth:Number, 
												_thumbHeight:Number, 
												_thumbSpacing:Number	)
		{
			imageDirectory = _imageDirectory;
			thumbList = _thumbList;
			thumbColumns = _thumbColumns;
			thumbWidth = _thumbWidth;
			thumbHeight = _thumbHeight;
			thumbSpacing = _thumbSpacing;
			
			super("CFM_ThumbnailPanel", true, true);
		}
		
		override protected function build():void{
			buildThumbnails();
		}
		
		public function buildThumbnails():void{
			var gridpoints:Vector.<Point> = generateGridPoints(thumbColumns,thumbList.length(),thumbWidth,thumbHeight,thumbSpacing,thumbSpacing,0,0);
			
			var i:Number = 0;
			for each(var s:XML in thumbList){
				//trace("building scene thumbnail  :: " + s.toXMLString());
				
				thumbnail = buildThumbnail(i);
				thumbnail.x = gridpoints[i].x;
				thumbnail.y = gridpoints[i].y;
				thumbnailArray.push(thumbnail);
				addThumb(thumbnail,i);
				i++;
			}
		}
		
		protected function addThumb(_thumb:CFM_Thumbnail, _index:Number):void{
			_thumb.renderTo(this);
		}
		
		protected function buildThumbnail(_index:Number):CFM_Thumbnail{
			//trace("thumbnail url :: " + thumbList[_index].toString());
			return new CFM_Thumbnail(_index, thumbList[_index].@id, thumbList[_index].@value, imageDirectory + thumbList[_index].@image,thumbWidth,thumbHeight);
		}
	}
}