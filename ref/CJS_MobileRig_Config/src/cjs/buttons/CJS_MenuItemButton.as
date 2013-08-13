package cjs.buttons
{
	import cfm.core.events.CFM_SimpleButtonEvent;
	import cfm.core.graphics.CFM_BoxGraphics;
	import cfm.core.text.CFM_TextField;
	
	import cjs.events.CJS_infoButtonEvent;
	import cjs.managers.FontManager;
	import cjs.model.AppModel;
	
	import com.greensock.TweenMax;
	import com.greensock.easing.Linear;
	
	public class CJS_MenuItemButton extends CJS_ButtonTemplate
	{
		private var __model:AppModel;
		private var excludeArray:Array;
		private var info:CJS_InfoButtonA;
		private var dealerOnly:Boolean;
		
		public function CJS_MenuItemButton(_index:Number, _id:String, _labelText:String, _value:String, _excludeArray:Array, _dealerOnly:Boolean )
		{
			excludeArray = _excludeArray;
			dealerOnly = _dealerOnly;
			
			__model = AppModel.inst;
			
			super(_index, _id, _labelText,1, 1, _value, "", false, false, [0,0,0,0]);
		}
		
		override protected function buildLabel():void{			
			label = new CFM_TextField({leftMargin:10, width:265, text:labelText, font:FontManager.Rockwell, size:11, color:0x666666});
			label.renderTo(labelContainer);
			label.setProperties({y:3});
			
			info = new CJS_InfoButtonA([0,0,0,0]);
			info.renderTo(labelContainer);
			info.setProperties({x:label.x + label.width});
		}
		
		override protected function buildHit():void{
			super.buildHit();
			hit.resize(hitWidth-info.width-paddingH,hitHeight,0,0);
		}
		
		override protected function addListeners():void{
			super.addListeners();
			info.addEventListener(CFM_SimpleButtonEvent.BUTTON_CLICKED, infoClicked, false, 0, true);
		}
		
		override protected function removeListeners():void{
			info.removeEventListener(CFM_SimpleButtonEvent.BUTTON_CLICKED, infoClicked);
			super.removeListeners();
		}
		
		protected function infoClicked(e:CFM_SimpleButtonEvent):void{
			dispatchEvent(new CJS_infoButtonEvent(CJS_infoButtonEvent.OPEN_INFO,"info_w", {buttonId:buttonId},true));
		}
		
		override protected function buildBackground():void{
			background = new CFM_BoxGraphics({width:10, height:10, color:0xCCCCCC, alpha:1});
			background.renderTo(backgroundContainer);
		}
		
		override protected function toOverState():void{
			TweenMax.to(label, .2, {tint:0xCCCCCC, ease:Linear.easeNone});
			TweenMax.to(backgroundContainer, .2, {tint:0x666666, ease:Linear.easeNone});
		}
		
		override protected function toOutState(_tween:Boolean=true):void{
			TweenMax.to(label, .2, {removeTint:true, ease:Linear.easeNone});
			TweenMax.to(backgroundContainer, .2, {removeTint:true, ease:Linear.easeNone});
		}
		
		override protected function resizeGraphics():void{
			background.resize(hitWidth,hitHeight,0,0);
		}
		
		override protected function killTweens():void{
			super.killTweens();
			TweenMax.killTweensOf(label);
			TweenMax.killTweensOf(background);
		}
		
		override public function enable():void{
			super.enable();
			info.enable();
		}
		
		override public function disable():void{
			super.disable();
			info.disable();
		}
		
		public function testExclude():void{
			var valid:Boolean = (!__model.config.dealerMode && dealerOnly) ? false : true;
			
			for each(var e:String in excludeArray){
				var eid:String = e.substring(0,e.indexOf("-"));
				var eval:String = e.substring(e.indexOf("-")+1);

				if(__model.config.testOption(eid,eval))
					valid = false;

				if(!valid) 
					break;
			}
			
			if(!valid) disable() else enable()
		}
	}
}