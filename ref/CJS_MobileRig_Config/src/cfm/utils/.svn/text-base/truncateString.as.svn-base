package cfm.utils
{	
	/**
	 * Truncates a <code>String</code> to given length concantenating an ellipsis ("...") to the end of the string.
	 * @param	charLength	An <code>int</code> representing the character length to which the string will be truncated.
	 * @param	str			A <code>String</code> value to be truncated.
	 */ 
	public function truncateString(charLength:int, str:String): String
	{
		if(str.length < charLength) return str;
		return str.substr(0, charLength - 1) + "...";
	}
}