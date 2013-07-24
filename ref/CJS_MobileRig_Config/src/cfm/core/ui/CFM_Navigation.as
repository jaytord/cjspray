package cfm.core.ui 
{
	import cfm.core.events.CFM_NavigationEvent;
	import cfm.core.events.CFM_SimpleButtonEvent;
	import cfm.core.objects.CFM_Object;
	
	import flash.display.Sprite;
	
	public class CFM_Navigation extends CFM_Object
	{
		protected var list:XMLList;
		protected var buttonParams:Object;
		
		public var buttonsArray:Array = [];
		public var lastSelected:CFM_SimpleButton;
		protected var allowToggle:Boolean;
		protected var hasSelectedState:Boolean;
		protected var maxWidth:Number;
		protected var buttonSpacing:Number;
		
		public function CFM_Navigation(_list:XMLList, _allowToggle:Boolean = false, _hasSelectedState:Boolean = true, _autoInit:Boolean = true, _autoDestroy:Boolean = true)
		{
			super("CFM_Navigation", _autoInit, _autoDestroy);
			
			list = _list;
			allowToggle = _allowToggle;
			hasSelectedState = _hasSelectedState;
			maxWidth = 0;
			buttonSpacing = 4;
		}
		
		protected override function build():void{
			var i:Number = 0;
			for each(var bs:XML in list){
				var btn:CFM_SimpleButton = buildButton(i,bs);
				btn.renderTo(this);
				
				if(i>0){
					btn.setProperties({x: buttonsArray[i-1].x + buttonsArray[i-1].width + buttonSpacing, y: buttonsArray[i-1].y});
					
					if(btn.x + btn.width >= maxWidth && maxWidth > 0){
						btn.setProperties({x:0, y:buttonsArray[i-1].y + buttonsArray[i-1].height + buttonSpacing});
					}
				}
				
				buttonsArray.push(btn);
				i++;
			}
		}
		
		protected function buildButton(_i:Number, _tag:XML):CFM_SimpleButton{
			return new CFM_SimpleButton(_i,_tag.@id,_tag.@label,10,4,_tag.@value, _tag.@href,allowToggle,hasSelectedState) as CFM_SimpleButton;
		}
		
		protected override function addListeners():void{
			for each(var b:CFM_SimpleButton in buttonsArray){
				b.addEventListener(CFM_SimpleButtonEvent.BUTTON_CLICKED, buttonClicked, false, 0, true);
			}
		}
		
		protected function buttonClicked(e:CFM_SimpleButtonEvent):void{
			if(lastSelected && hasSelectedState){
				if(!allowToggle) lastSelected.deselect();
			}
			
			lastSelected = CFM_SimpleButton(e.currentTarget);
			
			dispatchEvent(new CFM_NavigationEvent(CFM_NavigationEvent.BUTTON_CLICKED,e.index, e.id, e.value, e.href, lastSelected.selected));
		}
		
		protected function deselectAll(except:Number):void{
			var i:Number = 0;
			for each(var b:CFM_SimpleButton in buttonsArray){
				if(i!=except)
				b.deselect();
				i++;
			}
		}
		
		public function disableButtonByIndex(_index:Number):void{
			if(buttonsArray[_index]) buttonsArray[_index].deActivate();
		}
		
		public function enableButtonByIndex(_index:Number):void{
			if(buttonsArray[_index]) buttonsArray[_index].activate();
		}
		
		public function disableButtonById(_id:String):void{
			var index:Number = getIndexById(_id);
			if(index>=0) buttonsArray[index].deActivate();			
		}
		
		public function enableButtonById(_id:String):void{
			var index:Number = getIndexById(_id);
			if(index>=0) buttonsArray[index].activate();			
		}
		
		public function getButtonValue(_id:String):String{
			return list[getIndexById(_id)].@value;
		}
		
		public function getButtonLabelText(_id:String):void{
			CFM_SimpleButton(buttonsArray[getIndexById(_id)]).labelText;
		}
		
		public function getIndexById(_id:String):Number{
			var id:Number;
			var i:Number = 0;
			
			for each(var x:XML in list){
				if(x.@id == _id){
					id = i;
				}
				i++;
			}
			
			return id;
		}
		
		public function selectButtonById(_id:String, _dispatch:Boolean = false):void{
			var index:Number = getIndexById(_id);
			
			if(buttonsArray[index] != lastSelected){
				selectButton(index,_dispatch);
			}
		}
		
		public function changeButtonLabelById(_id:String, _label:String, updateSize:Boolean = true):void{
			var index:Number = getIndexById(_id);
			CFM_SimpleButton(buttonsArray[index]).updateLabel(_label, updateSize);
		}
		
		public function resetButtonLabelById(_id:String):void{
			var index:Number = getIndexById(_id);
			CFM_SimpleButton(buttonsArray[index]).resetLabel();
		}
		
		protected override function removeListeners():void{
			for each(var b:CFM_SimpleButton in buttonsArray){
				b.removeEventListener(CFM_SimpleButtonEvent.BUTTON_CLICKED, buttonClicked);
			}
		}
		
		public function selectButton(_childIndex:Number, _dispatch:Boolean = false):void{
			deselectAll(_childIndex);
			
			var btn:CFM_SimpleButton = buttonsArray[_childIndex];
			if(btn){
				btn.select(_dispatch);
				lastSelected = btn;
			}
		}
		
		public function makeVert(_align:String):void{
			for each(var b:CFM_SimpleButton in buttonsArray){
				b.y = Math.round(this.getChildIndex(b)*(b.height + buttonSpacing));
				
				switch(_align){
					case "left":
						b.x = 0;
						break;
					case "center":
						b.x = -b.width/2;
						break;
					case "right":
						b.x = -b.width;
						break
				}
				
			}
		}
	}
}