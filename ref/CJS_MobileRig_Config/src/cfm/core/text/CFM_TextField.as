package cfm.core.text
{
	import flash.display.DisplayObjectContainer;
	import flash.text.AntiAliasType;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;

	public class CFM_TextField extends TextField
	{
		private var tparams:Object;
		public var tformat:TextFormat;
		
		public function CFM_TextField(_tparams:Object)
		{
			super();
		
			tparams = _tparams;
			init();
		}
		 
		private function init():void{
			tformat = new TextFormat();
			tformat.font = new tparams.font().fontName;
			tformat.color = tparams.color;
			tformat.size = tparams.size;
			tformat.leading = tparams.leading;
			tformat.indent = tparams.indent;
			tformat.letterSpacing = tparams.lspacing;
			tformat.align = tparams.align ? tparams.align : TextFormatAlign.LEFT;
			tformat.underline = tparams.underline;
			tformat.leftMargin = tparams.leftMargin;
			
			this.width = this.height = 2;
			this.autoSize = TextFieldAutoSize.LEFT;
			this.defaultTextFormat = tformat;
			
			if(!tparams.bitmap || tparams.bitmap == false){
				this.antiAliasType = AntiAliasType.ADVANCED;
			}
			
			this.embedFonts = true;
			
			if(tparams.html == false || tparams.input == true){
				this.text = tparams.text.replace(new RegExp("’","gs"), "'").replace(new RegExp("‘","gs"), "'");
			} else {
				if(tparams.css){
					this.styleSheet = tparams.css;
				}
				this.htmlText = tparams.text.replace(new RegExp("’","gs"), "'").replace(new RegExp("‘","gs"), "'");
			}
			
			this.selectable = false;
			
			if(!tparams.width){
				this.wordWrap = false;
				this.autoSize = TextFieldAutoSize.LEFT;
			} else {
				this.wordWrap = true;
				this.width = tparams.width;
			}
			
			if(tparams.input && tparams.input == true){
				this.type = TextFieldType.INPUT;
				this.selectable = true;
			}
			
			if(tparams.width && tparams.width != 0){
				this.wordWrap = true;
			} else {
				this.wordWrap = false;
			}
			
			if(tparams.height){
				this.height = tparams.height;
				this.autoSize = TextFieldAutoSize.NONE;
			}
			
			if(tparams.multiline == false){
				this.multiline = false;
				this.wordWrap = false;
				this.autoSize = TextFieldAutoSize.NONE;
				this.width = tparams.width;
			}
			
			if(tparams.password == true){
				this.displayAsPassword = true;
			}
			
			if(tparams.maxChars){
				this.maxChars = tparams.maxChars;
			}
		}
		
		public function renderTo(_parent:DisplayObjectContainer):void{
			_parent.addChild(this);
		}
		
		public function remove():void{
			this.parent.removeChild(this);
		}
		
		public function setProperties(_prop:Object):void{
			for (var p:String in _prop) this[p] = _prop[p]; 
		}
	}
}