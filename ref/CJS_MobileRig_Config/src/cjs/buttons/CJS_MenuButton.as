package cjs.buttons
{
	import cfm.core.events.CFM_PageEvent;
	import cfm.core.events.CFM_SimpleButtonEvent;
	import cfm.core.graphics.CFM_BoxGraphics;
	import cfm.core.text.CFM_TextField;
	
	import cjs.events.CJS_infoButtonEvent;
	import cjs.managers.FontManager;
	import cjs.model.AppModel;
	import cjs.util.CJS_Color;
	
	import com.greensock.TweenMax;
	import com.greensock.easing.Linear;
	
	import flash.display.GradientType;
	import flash.events.MouseEvent;
	import flash.filters.BevelFilter;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	public class CJS_MenuButton extends CJS_ButtonTemplate
	{
		protected var info:CJS_InfoButtonA;
		protected var selectedTF:TextFormat = new TextFormat(null,null,0x999999);
		
		public function CJS_MenuButton(_index:Number, _id:String, _labelText:String, _value:String )
		{
			super(_index, _id, _labelText, 2, 2, _value, "", true, true, [6,6,0,0]);
		}
		
		override protected function toSelectedState():void{
			toOverState();
		}
		
		override protected function toUnselectedState():void{
			toOutState();
		}
		
		override protected function buildLabel():void{	
			label = new CFM_TextField({leftMargin:10, width:275, text:labelText, font:FontManager.Rockwell, size:12, color:0x666666});
			label.renderTo(labelContainer);
			label.autoSize = TextFieldAutoSize.NONE;
			label.setProperties({y:1});
			
			info = new CJS_InfoButtonA([0,4,0,0]);
			info.renderTo(labelContainer);
			info.setProperties({x:label.x + label.width});
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
		
		override protected function toOverState():void{
			TweenMax.to(background, .2, {colorMatrixFilter:{contrast:1.5, colorize:CJS_Color.DARK_BLUE, amount:1}, bevelFilter:{angle:20, blurX:10, blurY:10, strength:1.7, distance:4}, ease:Linear.easeNone});
			TweenMax.to(label, .2, {tint:0xFFFFFF, ease:Linear.easeNone});
		}
		
		override protected function toOutState(_tween:Boolean=true):void{
			if(label.text.indexOf(":") ==-1 && !selected) {
				TweenMax.to(label, .2, {removeTint:true, ease:Linear.easeNone});
				TweenMax.to(background, _tween ? .2 : 0, {colorMatrixFilter:{amount:0, remove:true}, bevelFilter:{angle:20, blurX:2, blurY:2, strength:.8, distance:1}, ease:Linear.easeNone});
			} else {
				toOverState();
			}
		}
		
		override protected function killTweens():void{
			super.killTweens();
			TweenMax.killTweensOf(label);
			TweenMax.killTweensOf(highlight);
		}
		
		override protected function buildHit():void{
			super.buildHit();
			hit.resize(hitWidth-info.width-paddingH,hitHeight,0,0);
		}
		
		override protected function resizeGraphics():void{
			background.resize(hitWidth,hitHeight,0,0);
			highlight.resize(hitWidth,hitHeight,0,0);
		}
		
		override public function updateLabel(_newLabel:String, updateSize:Boolean = true):void{
			label.text = labelText + (_newLabel != "" ? " : " + _newLabel : "");
			
			if(updateSize){
				hitWidth = label.width + (paddingH*2);
				
				hit.resize(hitWidth-info.width-paddingH,hitHeight,0,0);
				
				if(background){
					background.resize(hitWidth,hitHeight,0,0);
				}
			}
			
			/*if(label.text.indexOf(":")!=-1)
				label.setTextFormat(selectedTF,label.text.indexOf(":")+1,label.text.length);*/
		}
	}
}