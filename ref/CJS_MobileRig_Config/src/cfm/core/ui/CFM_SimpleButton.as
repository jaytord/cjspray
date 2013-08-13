package cfm.core.ui
{
	import cfm.core.containers.CFM_ObjectContainer;
	import cfm.core.events.CFM_SimpleButtonEvent;
	import cfm.core.graphics.CFM_BoxGraphics;
	import cfm.core.objects.CFM_Object;
	import cfm.core.text.CFM_TextField;
	
	import com.greensock.TweenMax;
	import com.greensock.easing.Linear;
	
	import flash.display.GradientType;
	import flash.events.MouseEvent;
	import flash.text.Font;
	
	[Event(name="buttonClicked", type="cfm.core.events.CFM_SimpleButtonEvent")]
	public class CFM_SimpleButton extends CFM_Object
	{
		protected var selectState:Boolean;
		protected var toggle:Boolean;
		protected var container:CFM_ObjectContainer;

		protected var hit:CFM_BoxGraphics;
		protected var backgroundContainer:CFM_ObjectContainer;
		protected var background:CFM_BoxGraphics;
		protected var labelContainer:CFM_ObjectContainer;
		protected var label:CFM_TextField;
		protected var paddingH:Number;
		protected var paddingV:Number;
		
		public var buttonIndex:Number;
		public var buttonId:String;
		public var buttonValue:String;
		public var labelText:String;
		public var selected:Boolean;
		public var href:String;
		public var hitWidth:Number;
		public var hitHeight:Number;
		public var disabled:Boolean = false;
		
		public function CFM_SimpleButton(	_index:Number, 
											_id:String,
											_labelText:String,
											_paddingH:Number,
											_paddingV:Number,
											_value:String, 
											_href:String, 
											_toggle:Boolean = false,
											_selectState:Boolean = true,
											_autoInit:Boolean = true, 
											_autoDestroy:Boolean = true )
		{
			super("JT_SimpleButton",_autoInit,_autoDestroy);
			
			buttonId = _id;
			paddingH = _paddingH;
			paddingV = _paddingV;
			buttonValue = _value;
			buttonIndex = _index;
			labelText = _labelText;
			selectState = _selectState;
			toggle = _toggle;
			href = _href;
		}
		
		protected override function build():void{
			container = new CFM_ObjectContainer();
			container.renderTo(this);
			
			backgroundContainer = new CFM_ObjectContainer();
			backgroundContainer.renderTo(container);
			
			labelContainer = new CFM_ObjectContainer();
			labelContainer.renderTo(container);
			labelContainer.setProperties({x:paddingH, y:paddingV});
			
			buildBackground();
			buildLabel();
			setHitDimensions();
			buildHit();
			
			buildComplete();
		}
		
		protected function buildHit():void{
			hit = new CFM_BoxGraphics({width:hitWidth, height:hitHeight, color:0, alpha:0});
			hit.renderTo(container);
			hit.setProperties({buttonMode:true});
		}
		
		override public function get width():Number{
			return hitWidth;
		}
		
		override public function get height():Number{
			return hitHeight;
		}
		
		protected function setHitDimensions():void{
			hitWidth = labelContainer.width + (paddingH*2);
			hitHeight = labelContainer.height + (paddingV*2);
		}
		
		protected function buildBackground():void{
			background = new CFM_BoxGraphics({width:10, height:10, grad:{type:GradientType.LINEAR, rotation:90}, colors:[0x999999,0x666666], alphas:[1,1], ratios:[0,255], radius:8});
			background.renderTo(backgroundContainer);
		}
		
		protected function buildLabel():void{			
			label = new CFM_TextField({text:labelText, font:Font, size:14, color:0x444444});
			label.renderTo(labelContainer);
		}
		
		protected override function addListeners():void{
			hit.addEventListener(MouseEvent.MOUSE_DOWN, clicked, false, 0, true);
			hit.addEventListener(MouseEvent.MOUSE_OVER, over, false, 0, true);
			hit.addEventListener(MouseEvent.MOUSE_OUT, out, false, 0, true);
		}
		
		protected function buildComplete():void{
			resizeGraphics();
			
			toOutState(false);
		}
		
		protected function resizeGraphics():void{
			if(background) background.resize(hitWidth, hitHeight,0,0);
		}
		
		protected function over(e:MouseEvent):void{
			killTweens();
			toOverState();
		}
		
		protected function out(e:MouseEvent):void{
			killTweens();
			toOutState();
		}
		
		public function clicked(e:MouseEvent):void{
			killTweens();
			
			if(selectState){
				if(selected){
					if(toggle){
						deselect();
					}
				} else {
					select();
				}
			}
			
			dispatchSelected();
		}
		
		public function select(_dispatch:Boolean = false):void{
			selected = true;
			toSelectedState();
			
			if(_dispatch)
				dispatchSelected();
		}
		
		private function dispatchSelected():void{
			dispatchEvent(new CFM_SimpleButtonEvent(CFM_SimpleButtonEvent.BUTTON_CLICKED,buttonIndex, buttonId,buttonValue,labelText,href));
		}
		
		public function deselect():void{
			selected = false;
			toUnselectedState();
		}
		
		protected function toOverState():void{
			TweenMax.to(labelContainer, .2, {tint:0xFFFFFF, ease:Linear.easeNone});
			TweenMax.to(backgroundContainer, .2, {alpha:1, ease:Linear.easeNone});
		}
		
		protected function toOutState(_tween:Boolean = true):void{
			TweenMax.to(labelContainer, _tween ? .2 : 0, {removeTint:true, ease:Linear.easeNone});
			TweenMax.to(backgroundContainer, _tween ? .2 : 0, {alpha:.1, ease:Linear.easeNone});
		}
		
		protected function toSelectedState():void{
			TweenMax.to(labelContainer, .2, {tint:0xFFFFFF, ease:Linear.easeNone});
			TweenMax.to(backgroundContainer, .2, {alpha:1, ease:Linear.easeNone, dropShadowFilter:{distance:1,alpha:.4, blurX:4, blurY:4}});
		}
		
		protected function toUnselectedState():void{			
			TweenMax.to(labelContainer, .2, {removeTint:true, ease:Linear.easeNone});
			TweenMax.to(backgroundContainer, .2, {alpha:.1, ease:Linear.easeNone, dropShadowFilter:{remove:true, alpha:0, blurX:0, blurY:0}});
		}
		
		public function updateLabel(_newLabel:String, updateSize:Boolean = true):void{
			label.text = _newLabel;
			
			if(updateSize){
				hitWidth = labelContainer.width + (paddingH*2);
			
				hit.resize(hitWidth,hitHeight,0,0);
			
				if(background){
					background.resize(hitWidth,hitHeight,0,0);
				}
			}
		}
	
		public function resetLabel():void{
			updateLabel(labelText, true);
		}
		
		public function enable():void{
			disabled = false;
		}
		
		public function disable():void{
			disabled = true;
		}
		
		protected function killTweens():void{
			TweenMax.killTweensOf(labelContainer);
			TweenMax.killTweensOf(backgroundContainer);
		}
		
		protected override function removeListeners():void{			
			hit.removeEventListener(MouseEvent.MOUSE_DOWN, clicked);
			hit.removeEventListener(MouseEvent.MOUSE_OVER, over);
			hit.removeEventListener(MouseEvent.MOUSE_OUT, out);
		}
		
		protected function resizeAll():void {
			
		}
	}
}