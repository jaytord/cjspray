package cjs.buttons
{
	import cfm.core.events.CFM_SimpleButtonEvent;
	import cfm.core.graphics.CFM_BoxGraphics;
	import cfm.core.text.CFM_TextField;
	import cfm.core.ui.CJS_TrailerButtonImage;
	
	import cjs.events.CJS_infoButtonEvent;
	import cjs.managers.FontManager;
	import cjs.util.CJS_Color;
	
	import com.greensock.TweenMax;
	import com.greensock.easing.Linear;
	
	import flash.display.GradientType;
	
	public class CJS_TrailerButton extends CJS_ButtonTemplate
	{
		private var image:CJS_TrailerButtonImage;
		private var imageUrl:String;
		private var info:CJS_InfoButtonA;
		private var bevel:CFM_BoxGraphics;
		
		public function CJS_TrailerButton(_index:Number, _id:String, _labelText:String, _paddingH:Number, _paddingV:Number, _value:String, _image:String)
		{
			imageUrl = _image;
			super(_index, _id, _labelText, _paddingH, _paddingV, _value, "",false,false);
		}
		
		protected function infoClicked(e:CFM_SimpleButtonEvent):void{
			dispatchEvent(new CJS_infoButtonEvent(CJS_infoButtonEvent.OPEN_INFO,"info_w", {buttonId:buttonId},true));
		}
		
		override protected function buildBackground():void{
			bevel = new CFM_BoxGraphics({width:10, height:10, grad:{type:GradientType.LINEAR, rotation:50}, colors:[0xFFFFFF, 0xDDDDDD], alphas:[1,1], ratios:[20,200], radius:24});
			bevel.renderTo(backgroundContainer);
			
			buildImage();
			
			background = new CFM_BoxGraphics({width:10, height:10, grad:{type:GradientType.LINEAR, rotation:50}, colors:[0xDDDDDD, 0xFFFFFF], alphas:[1,1], ratios:[0,210], radius:[0,0,12,12]});
			background.renderTo(backgroundContainer);
			background.setProperties({y:image.height});
			
			highlight = new CFM_BoxGraphics({width:10, height:10, grad:{type:GradientType.LINEAR, rotation:50}, colors:[0xFFFFFF,0xFFFFFF, 0xFFFFFF], alphas:[.5,.1,0], ratios:[0,130,135], radius:24});
			highlight.renderTo(backgroundContainer);
		}
		
		override protected function addListeners():void{
			super.addListeners();
			info.addEventListener(CFM_SimpleButtonEvent.BUTTON_CLICKED, infoClicked, false, 0, true);
		}
		
		override protected function removeListeners():void{
			info.removeEventListener(CFM_SimpleButtonEvent.BUTTON_CLICKED, infoClicked);
			super.removeListeners();
		}
		
		private function buildImage():void{
			image = new CJS_TrailerButtonImage(imageUrl);
			image.renderTo(backgroundContainer);
		}
		
		override protected function buildLabel():void{
			label = new CFM_TextField({width:image.width-(paddingH*2), text:labelText, font:FontManager.Rockwell, size:16, color:0x666666});
			label.renderTo(labelContainer);
			labelContainer.setProperties({y:image.height+paddingV});
			
			info = new CJS_InfoButtonA([0,8,0,0]);
			info.renderTo(this);
			info.setProperties({y:3, x:labelContainer.x + labelContainer.width +paddingH-info.width-4});
		}
		
		override protected function resizeGraphics():void{
			background.resize(hitWidth, label.height+(paddingV*2),0,0);
			bevel.resize(hitWidth+(paddingV*2),hitHeight+(paddingV*2),-paddingV,-paddingV);
			highlight.resize(hitWidth+(paddingV*2),hitHeight+(paddingV*2),-paddingV,-paddingV);
		}
		
		override protected function setHitDimensions():void{
			hitWidth = image.width;
			hitHeight = labelContainer.y + labelContainer.height + paddingV;
		}
		
		override protected function toOverState():void{
			TweenMax.to(labelContainer, .2, {tint:0xFFFFFF, ease:Linear.easeNone});
			TweenMax.allTo([bevel,highlight], .2, {alpha:1, ease:Linear.easeNone});
			TweenMax.to(background, .2, {colorMatrixFilter:{contrast:1.5, colorize:CJS_Color.DARK_BLUE, amount:1}, bevelFilter:{angle:20, blurX:10, blurY:10, strength:1.7, distance:4}, ease:Linear.easeNone});
		}
		
		override protected function killTweens():void{
			super.killTweens();
			TweenMax.killTweensOf(label);
			TweenMax.killTweensOf(bevel);
			TweenMax.killTweensOf(background);
		}
		
		override protected function toOutState(_tween:Boolean=true):void{
			TweenMax.allTo([bevel,highlight], _tween ? .2 : 0, {alpha:0, ease:Linear.easeNone});
			TweenMax.to(labelContainer, _tween ? .2 : 0, {removeTint:true, ease:Linear.easeNone});
			TweenMax.to(background, _tween ? .2 : 0, {colorMatrixFilter:{amount:0, remove:true}, bevelFilter:{angle:20, blurX:2, blurY:2, strength:.8, distance:1}, ease:Linear.easeNone});
		}
	}
}