package cjs.managers
{
	import cfm.core.away.utils.NullPlayer;
	import cfm.utils.getNumberString;
	
	import cjs.events.CJS_ConfigurationEvent;
	
	import flash.display.BitmapData;
	import flash.events.EventDispatcher;
	
	[Event(name="optionChanged", type="com.cjs.events.CJS_ConfigurationEvent")]
	[Event(name="resetAll", type="com.cjs.events.CJS_ConfigurationEvent")]
	
	public class ConfigurationManager extends EventDispatcher
	{
		private var __optionsList:XMLList;
		private var _currentConfiguration:Array = [];
		private var _accessories:Array = [];
		private var _cTrailer:String = "X";
		private var __mainXML:XML;
		private var _cTotalPrice:String = "$0";
		private var _dealerMode:Boolean = false;
		
		public function get ctrailer():String{return _cTrailer;}
		public function get dealerMode():Boolean{return _dealerMode;}
		public function set dealerMode(_isDealer:Boolean):void{
			clearSelections();
			_dealerMode = _isDealer;
		}
		
		public function ConfigurationManager(_optionsList:XMLList, _mainXML:XML)
		{
			__optionsList = _optionsList;
			__mainXML = _mainXML;
			
			for each(var o:XML in __optionsList)
				_currentConfiguration[o.childIndex()] = {id:o.@id, value:"X", price:0, dprice:0};
		}
		
		public function clearSelections():void{
			for each(var o:XML in __optionsList){
				if(String(o.@id) != "B") _currentConfiguration[o.childIndex()] = {id:o.@id, value:"X", price:0, dprice:0};
			}
			
			_cTotalPrice = "$" + getNumberString( getTotalPrice(_dealerMode) );
				
			dispatchEvent(new CJS_ConfigurationEvent(CJS_ConfigurationEvent.RESET_ALL, null, null, _cTotalPrice));
		}
		
		public function verifyConfigComplete():Array{
			var incomplete:Array = [];
			
			for each(var o:Object in _currentConfiguration)
				if(o.value == "X") incomplete.push(o);
				
			if(incomplete.length == 0)
				return null;
			else 
				return incomplete;
		}
		
		public function updateOption(_menuValue:String, _itemValue:String):void{
			var _price:Number = getPrice(_menuValue, _itemValue);
			var _dealerPrice:Number = getDealerPrice(_menuValue, _itemValue);
			
			if(_menuValue == "B") _cTrailer = _itemValue;
			
			for each(var o:Object in  _currentConfiguration){
				if(o.id == _menuValue){
					o.value = _itemValue;
					o.price = _price;
					o.dprice = _dealerPrice;
					break;
				}
			}
			
			updateTotalPrice();
			dispatchEvent(new CJS_ConfigurationEvent(CJS_ConfigurationEvent.OPTION_CHANGED, _menuValue, _itemValue, _cTotalPrice));
		}
		
		public function updateTotalPrice():void{
			_cTotalPrice = "$" + getNumberString( getTotalPrice(_dealerMode) );
		}
		
		public function addAccessory(_id:String):void{
			_accessories.push(_id);
			
			updateTotalPrice();
			dispatchEvent(new CJS_ConfigurationEvent(CJS_ConfigurationEvent.ACCESSORYS_CHANGED, null, _id, _cTotalPrice));
		}
		
		public function removeAccessory(_id:String):void{
			var i:Number = 0;
			for each (var id:String in _accessories){
				if(id == _id) _accessories.splice(i,1);
				i++;
			}
			
			updateTotalPrice();
			dispatchEvent(new CJS_ConfigurationEvent(CJS_ConfigurationEvent.ACCESSORYS_CHANGED, null, _id, _cTotalPrice));
		}
		
		public function clearAccessories():void{
			_accessories = [];
		}
		
		public function imageChangeComplete(_bitmapData:BitmapData):void{
			dispatchEvent(new CJS_ConfigurationEvent(CJS_ConfigurationEvent.IMAGE_CHANGED,null,null,_cTotalPrice,_bitmapData));
		}
		
		public function get cTotalPrice():String{return _cTotalPrice;}
		public function get configuration():Array{return _currentConfiguration;}
		public function get accessories():Array{return _accessories;}
		
		private function getPrice(_menuValue:String, _itemValue:String):Number{
			return parseInt(__mainXML..menu.(@value == _menuValue).selection.(@value == _itemValue).price);
		}
		
		private function getDealerPrice(_menuValue:String, _itemValue:String):Number{
			return parseInt(__mainXML..menu.(@value == _menuValue).selection.(@value == _itemValue).dealerprice);
		}
		
		public function getTotalPrice(_dealer:Boolean = false):Number{
			var price:Number = 0;
			
			for each(var o:Object in _currentConfiguration)
				price += (_dealer ? o.dprice : o.price);
				
			for each(var id:String in _accessories)
				price += getAccessoryPrice(id);
				
			return price
		}
		
		public function getAccessoryPrice(_id:String):Number{
			return __mainXML.accessories..selection.(@id == _id).price;
		}
		
		public function getOptionIndex(_id:String):Number{
			var index:Number;
			var i:Number = 0;
			for each(var o:Object in  _currentConfiguration){
				if(o.id == _id){ 
					index = i;
					break;
				}
				i++;
			}
			return index;
		}
		
		public function testOption(_id:String, _value:String):Boolean{
			var test:Boolean = false;
			for each(var o:Object in  _currentConfiguration){
				if(o.id == _id && o.value == _value){
					test = true;
					break;
				}
			}
			return test;
		}
		
		public function get configurationToString():String{
			var config:String = "" ;
			for each(var o:Object in  _currentConfiguration)
				if(o.value != "X") config += String(o.id + "-" + o.value + ":");
			
			return ":" + config;
		}
	}
}