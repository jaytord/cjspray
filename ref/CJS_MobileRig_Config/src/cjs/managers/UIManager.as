package cjs.managers
{
	import flash.text.StyleSheet;

	public class UIManager
	{	
		private var _cssString:String = "ul{margin-left:-17px} li{color:#666666;}";
		
		private var _css:StyleSheet;
		
		public function UIManager()
		{
			_css = new StyleSheet();
			_css.parseCSS(_cssString);
		}
		
		public function get css():StyleSheet{return _css;}
	}
}