package cjs.buttons
{
	import cfm.core.graphics.CFM_BoxGraphics;
	import cfm.core.managers.CFM_SoundManager;
	import cfm.core.text.CFM_TextField;
	import cfm.core.ui.CFM_SimpleButton;
	
	import cjs.config.AppConfig;
	import cjs.managers.FontManager;
	import cjs.model.AppModel;
	import cjs.util.CJS_Color;
	
	import com.greensock.TweenMax;
	import com.greensock.easing.Linear;
	
	import flash.display.GradientType;
	import flash.events.MouseEvent;
	
	public class CJS_ButtonTemplate extends CFM_SimpleButton
	{
		private var __soundManager:CFM_SoundManager;
		
		protected var highlight:CFM_BoxGraphics;
		protected var corners:Array;
		
		public function CJS_ButtonTemplate(_index:Number, _id:String, _labelText:String, _paddingH:Number, _paddingV:Number, _value:String, _href:String, _toggle:Boolean=false, _selectState:Boolean=true, _corners:Array = null)
		{
			__soundManager = AppModel.inst.sounds;
			corners = _corners || [10,10,0,0]
			super(_index, _id, _labelText, _paddingH, _paddingV, _value, _href, _toggle, _selectState,true,true);
		}
		
		override protected function buildLabel():void{			
			label = new CFM_TextField({text:labelText, font:FontManager.Rockwell, size:14, color:0x666666});
			label.renderTo(labelContainer);
		}
		
		override protected function buildBackground():void{
			background = new CFM_BoxGraphics({width:10, height:10, grad:{type:GradientType.LINEAR, rotation:40}, colors:[0xDDDDDD, 0xFFFFFF], alphas:[1,1], ratios:[0,210], radius:corners});
			background.renderTo(backgroundContainer);
			
			highlight = new CFM_BoxGraphics({width:10, height:10, grad:{type:GradientType.LINEAR, rotation:40}, colors:[0xFFFFFF,0xFFFFFF, 0xFFFFFF], alphas:[.1,.2,0], ratios:[0,95,105], radius:corners});
			highlight.renderTo(backgroundContainer);
		}
		
		override protected function over(e:MouseEvent):void{
			super.over(e);
		}
		
		override public function clicked(e:MouseEvent):void{
			super.clicked(e);
			__soundManager.playSoundClip(AppConfig.SOUNDS_DIRECTORY + "pindrop.mp3",0,.2);
		} 
		
		override protected function toOverState():void{
			TweenMax.to(labelContainer, .2, {tint:0xFFFFFF, ease:Linear.easeNone});
			TweenMax.to(background, .2, {colorMatrixFilter:{contrast:1.5, colorize:CJS_Color.DARK_BLUE, amount:1}, bevelFilter:{angle:20, blurX:10, blurY:10, strength:1.7, distance:4}, ease:Linear.easeNone});
		}
		
		override protected function resizeGraphics():void{
			super.resizeGraphics();
			if(highlight) highlight.resize(hitWidth,hitHeight,0,0);
		}
		
		override protected function killTweens():void{
			super.killTweens();
			TweenMax.killTweensOf(background);
		}
		
		override protected function toOutState(_tween:Boolean=true):void{
			TweenMax.to(labelContainer, _tween ? .2 : 0, {removeTint:true, ease:Linear.easeNone});
			TweenMax.to(background, _tween ? .2 : 0, {colorMatrixFilter:{amount:0, remove:true}, bevelFilter:{angle:20, blurX:2, blurY:2, strength:.8, distance:1}, ease:Linear.easeNone});
		}
	}
}