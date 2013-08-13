package cjs.buttons
{
	import cfm.core.events.CFM_PageEvent;
	import cfm.core.graphics.CFM_BoxGraphics;
	import cfm.core.text.CFM_TextField;
	import cfm.core.ui.CFM_SimpleButton;
	
	import cjs.managers.FontManager;
	import cjs.util.CJS_Color;
	
	import com.greensock.TweenMax;
	import com.greensock.easing.Linear;
	
	import flash.events.MouseEvent;
	import flash.filters.DropShadowFilter;
	
	public class CJS_InfoButtonA extends CJS_ButtonTemplate
	{
		public function CJS_InfoButtonA(_corners:Array)
		{
			super(0, "info", "i", 3, 0, "info", "", false, false);
			corners = _corners;
		}
		
		override protected function buildLabel():void{			
			label = new CFM_TextField({text:labelText, font:FontManager.RockwellBold, size:14, color:0x999999});
			label.renderTo(labelContainer);
		}
		
		override protected function buildBackground():void{
			background = new CFM_BoxGraphics({width:10, height:10, color:0xFFFFFF, alpha:1, radius:corners});
			background.renderTo(backgroundContainer);
		}
		
		override protected function toOverState():void{
			TweenMax.to(labelContainer, .2, {tint:CJS_Color.DARK_BLUE, ease:Linear.easeNone});
			TweenMax.to(background, 0, {bevelFilter:{angle:-20, blurX:5, blurY:5, strength:1, distance:.5}, ease:Linear.easeNone});
		}
		
		override protected function toOutState(_tween:Boolean=true):void{
			TweenMax.to(labelContainer, .2, {removeTint:true, ease:Linear.easeNone});
			TweenMax.to(background, 0, {bevelFilter:{angle:-20, blurX:5, blurY:5, strength:.5, distance:.5}, ease:Linear.easeNone});
		}
	}
}