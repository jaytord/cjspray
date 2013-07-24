package cfm.utils
{
	public function getNumberString(_num:Number):String
	{
		var numString:String = _num.toString();
		var dollar_array:Array = new Array();
		var start:Number;
		var end:Number = numString.length;
		
		while(end > 0){
			start = Math.max(end-3, 0);
			dollar_array.unshift(numString.slice(start, end));
			end = start;
		}
		
		return dollar_array.toString();
	}
}