package cfm.core.ui
{
	import cfm.core.containers.CFM_ObjectContainer;
	import cfm.core.events.CFM_DropdownMenuEvent;
	import cfm.core.events.CFM_SimpleButtonEvent;
	import cfm.core.graphics.CFM_BoxGraphics;
	import cfm.core.objects.CFM_Object;
	
	import cjs.buttons.CJS_MenuItemButton;
	
	import com.greensock.TweenMax;
	import com.greensock.easing.Cubic;
	
	import flash.events.Event;
	
	import mx.utils.NameUtil;
	
	public class CFM_DropdownMenu extends CFM_Object
	{
		public var ITEM_SPACING:Number = 23;
		public var ITEM_HOLDER_MARGIN:Number = 2;
		
		public var itemList:XMLList;
		public var buttonXML:XML;
		
		public var itemHolder:CFM_ObjectContainer;
		public var itemHolderMask:CFM_BoxGraphics;
		public var itemArray:Array = [];
		
		public var button:CFM_SimpleButton;
		public var item:CFM_SimpleButton;
		public var menuOpen:Boolean = false;
		public var currentSelection:String;
		
		public var index:Number;
		public var value:String;
		public var id:String;
		public var _offsetHeight:Number = 0;
		
		public function CFM_DropdownMenu(_index:Number, _buttonXML:XML, _id:String, _value:String, _itemList:XMLList, _autoInit:Boolean=true, _autoDestroy:Boolean=true)
		{			
			index = _index;
			itemList = _itemList;
			buttonXML = _buttonXML;
			currentSelection = buttonXML.label;
			id = _id;
			value = _value;
			
			super("CFM_DropdownMenu",_autoInit,_autoDestroy);
		}
		
		override protected function build():void{				
			button = getButton();
			button.renderTo(this);
			
			itemHolder = new CFM_ObjectContainer();
			itemHolder.renderTo(this);
			
			itemHolderMask = new CFM_BoxGraphics({width:10,height:10, color:0, alpha:0},false);
			itemHolderMask.renderTo(this);
			
			itemHolder.mask = itemHolderMask;
			
			buildItems();
			
			itemHolder.setProperties({alpha:0, visible:false, y:button.hitHeight + ITEM_HOLDER_MARGIN});
			
			itemHolderMask.setProperties({scaleY:0, y:itemHolder.y});
		}
		
		public function get offsetHeight():Number{
			return _offsetHeight;
		}
		
		public function buildItems():void{
			var iid:Number = 0;
			for	each(var i:XML in itemList){
				item = getItem(iid,i.label,i.@id,i.@value) as CFM_SimpleButton;
				itemArray.push(item);
				item.renderTo(itemHolder);
				iid++;
			}
			
			positionButtons();
		}
		
		protected function positionButtons():void{
			var i:Number = 0;
			for each (var b:CFM_SimpleButton in itemArray){
				if(b.disabled){
					b.y = 0;
					b.visible = false;
				} else {
					b.visible = true;
					b.y = i*ITEM_SPACING;
					i++;
				}
			}
			
			itemHolderMask.resize(itemHolder.x + itemHolder.width, itemHolder.height + ITEM_HOLDER_MARGIN,0,0);
			_offsetHeight = itemHolder.height + ITEM_HOLDER_MARGIN;
		}
		
		protected function getButton():CFM_SimpleButton{
			return new CFM_SimpleButton(0,buttonXML.@id,buttonXML.label,4,4,buttonXML.@value,"",true,true) as CFM_SimpleButton;
		}
		
		protected function getItem(_index:Number, _label:String, _id:String, _value:String):CFM_SimpleButton{
			return new CFM_SimpleButton(_index,_id,_label,4,4,_value,"") as CFM_SimpleButton;
		}
		
		override protected function addListeners():void{
			super.addListeners();
			
			for each(var itm:CFM_SimpleButton in itemArray){
				itm.addEventListener(CFM_SimpleButtonEvent.BUTTON_CLICKED, itemSelected, false, 0, true);
			}
			
			button.addEventListener(CFM_SimpleButtonEvent.BUTTON_CLICKED, buttonSelected, false, 0, true);
		}
		
		public function openMenu():void{
			menuOpen = true;
			
			TweenMax.to(itemHolder, 0, {autoAlpha:1});
			TweenMax.to(itemHolderMask, .4, {scaleY:1, ease:Cubic.easeInOut});
			
			dispatchEvent(new CFM_DropdownMenuEvent(CFM_DropdownMenuEvent.OPEN_MENU, index, value, NaN, currentSelection));
		}
		
		public function validateOptions(_options:Array):void{
			var optionsS:String = _options.toString();
			
			for each(var i:CFM_SimpleButton in itemArray){
				var valid:Boolean = true;
				
				for each(var v:String in _options){
					if(i.labelText == v){
						valid = false;
					}
				}
				
				if(valid){
					i.enable();
				} else {
					i.disable();
				}
			}
			
			positionButtons();
		}
		
		public function closeMenu(_dispatch:Boolean = true):void{
			menuOpen = false;
			
			button.deselect();
			
			TweenMax.to(itemHolder, 0, {delay:.4, autoAlpha:0});
			TweenMax.to(itemHolderMask, .4, {scaleY:0,  ease:Cubic.easeInOut});
			
			if(_dispatch) dispatchEvent(new CFM_DropdownMenuEvent(CFM_DropdownMenuEvent.CLOSE_MENU, index, value, NaN, currentSelection ));
		}
		
		public function buttonSelected(e:CFM_SimpleButtonEvent):void{
			killTweens();

			menuOpen ? closeMenu() : openMenu();
		}
		
		public function reset():void{
			killTweens();
			currentSelection = null;
			button.updateLabel("",false);
			
			closeMenu(true);
		}
		
		public function itemSelected(e:CFM_SimpleButtonEvent):void{
			killTweens();
			
			updateSelection(e.labelText);
			dispatchEvent( new CFM_DropdownMenuEvent(CFM_DropdownMenuEvent.ITEM_SELECTED, index, value, e.index, e.value));
			
			closeMenu();
		}
		
		public function updateSelection(_value:String):void{
			currentSelection = _value;
			button.updateLabel(_value,false);
		}

		public function killTweens():void{
			TweenMax.killTweensOf(itemHolder);
			TweenMax.killTweensOf(itemHolderMask);
		}
		
		override protected function removeListeners():void{
			super.removeListeners();
			
			for each(var itm:CFM_SimpleButton in itemArray){
				itm.removeEventListener(CFM_SimpleButtonEvent.BUTTON_CLICKED, itemSelected);
			}
			
			button.removeEventListener(CFM_SimpleButtonEvent.BUTTON_CLICKED, buttonSelected);
		}
		
		private function get itemLabelParams():Object{
			return {};
		}
		
		private function get buttonLabelParams():Object{
			return {};
		}
		
		override protected function destroy(e:Event):void{
			killTweens();
			
			while(itemHolder.numChildren>0){
				itemHolder.removeChildAt(0);
			}
			
			super.destroy(e);
		}
	}
}