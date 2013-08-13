package cfm.utils
{
	import flash.geom.Point;
	/**
	 * Generate a collection of point positions laid out as a grid.
	 * 
	 * @param	columns	Number of columns in the grid
	 * @param	n		Number of elements in the grid
	 * @param	width	Width of an element
	 * @param	height	Height of an element
	 * @param	spacing	Spacing between elements in the grid
	 * 
	 * @returns	A Vector of Points
	 */
	public function generateGridPoints(columns:int, n:int, width:Number, height:Number, hSpacing:Number = 0, vSpacing:Number = 0, alignX:Number = 0, alignY:Number = 0):Vector.<Point> {
		trace("Columns = " + columns + ", n = " + n);
		var points:Vector.<Point> = new Vector.<Point>();
		var rows:int = int(n/columns) + ((n%columns)/(n%columns));
		
		var offsetX:Number = width + hSpacing;
		var offsetY:Number = height + vSpacing;
		
		var startX:Number = alignX * ((offsetX * columns) - hSpacing);//alignX * offsetX * ( 1 - columns);
		var startY:Number = alignY * ((offsetY * rows) - vSpacing);//alignY * offsetY * ( 1 - rows);
		
		for ( var i:int = 0; i < n; ++i) {
			var x:Number = (offsetX * (i % columns)) - startX;
			var y:Number = (offsetY * int(i / columns)) - startY;
			
			points.push(new Point(x,y));
		} 
		
		return points;
	}
}