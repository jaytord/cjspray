package cfm.core.ui
{
	import cfm.core.containers.CFM_ObjectContainer;
	import cfm.core.events.CFM_FormFieldEvent;
	import cfm.core.graphics.CFM_BoxGraphics;
	import cfm.core.objects.CFM_Object;
	import cfm.core.text.CFM_TextField;
	
	import com.greensock.TweenMax;
	
	import flash.events.Event;
	import flash.events.FocusEvent;
	import flash.text.Font;
	import flash.text.TextFieldAutoSize;
	
	public class CFM_FormField extends CFM_Object
	{
		protected const MARGIN:int = 10;
		
		protected var backgroundContainer:CFM_ObjectContainer;
		protected var labelContainer:CFM_ObjectContainer;
		protected var errorContainer:CFM_ObjectContainer;
		
		public var background:CFM_BoxGraphics;
		protected var error:CFM_BoxGraphics;
		
		protected var input:CFM_TextField;
		
		protected var defaultText:String;
		protected var isEmail:Boolean;
		protected var tweenTime:Number;
		protected var isValid:Boolean = false;
		protected var index:Number;
		public var enabled:Boolean = true;
		protected var required:Boolean = true;
		protected var isPassword:Boolean = false;
		
		public function CFM_FormField(_index:Number, _isEmail:Boolean = false, _required:Boolean = true, _password:Boolean = false, _defaultText:String="", _autoInit:Boolean = true, _autoDestroy:Boolean = true)
		{
			defaultText = _defaultText;
			isEmail = _isEmail;
			index = _index;
			required = _required;
			isPassword = _password;
			
			super("CFM_FormField",_autoInit, _autoDestroy);
		}
		
		public function get inputValue():String{return input.text;}
		
		protected override function build():void{
			backgroundContainer = new CFM_ObjectContainer();
			backgroundContainer.renderTo(this);
			
			labelContainer = new CFM_ObjectContainer();
			labelContainer.renderTo(this);
			
			errorContainer = new CFM_ObjectContainer();
			errorContainer.renderTo(this);
			
			buildBackground();
			buildError();
			buildInput();
			buildLabel();
			buildComplete();
		}
		
		protected function get inputParams():Object{
			return {width:300, text:defaultText, font:Font, color:0xFFFFFF, size:14, input:true, password:isPassword};
		}
		
		public function reset():void{
			input.text = defaultText;
			isValid = validate();
		}
		
		protected function buildBackground():void{
			background = new CFM_BoxGraphics({color:0x999999, alpha:1, width:10, height:10, width:10});
			background.renderTo(backgroundContainer);
		}
		
		protected function buildError():void{
			error = new CFM_BoxGraphics({color:0xFFFFFF, alpha:0, lineStyle:{thickness:1, color:0xFF0000}, width:10, height:10});
			error.renderTo(errorContainer);
		}
		
		protected function buildInput():void{
			input = new CFM_TextField(inputParams);
			input.renderTo(this);
			input.setProperties({x:MARGIN, y:MARGIN});
		}
		
		protected function buildLabel():void{}
		
		protected function buildComplete():void{
			background.resize(input.width+(MARGIN*2),input.height+(MARGIN*2),0,0);
			error.resize(input.width+(MARGIN*2),input.height+(MARGIN*2),0,0);
			input.tabIndex = index;
			validate();
			focusOut(null);
		}
		
		protected override function addListeners():void{
			input.addEventListener(FocusEvent.FOCUS_IN, focusIn, false, 0, true);
			input.addEventListener(FocusEvent.FOCUS_OUT, focusOut, false, 0, true);
			input.addEventListener(Event.CHANGE, onChange, false, 0, true);
		}
		
		protected function focusIn(e:FocusEvent):void{
			toFocusState();
			
			if(input.text == defaultText){
				input.text = "";
			}

			input.displayAsPassword = inputParams.password;
		}
		
		protected function toErrorState():void{
			isValid = false;
			
			TweenMax.killTweensOf(errorContainer);
			TweenMax.to(errorContainer, .3, {autoAlpha:1});
		}
				
		protected function noErrorState():void{
			isValid = true;
			
			TweenMax.killTweensOf(errorContainer);
			TweenMax.to(errorContainer, .3, {autoAlpha:0});
		}
		
		protected function toFocusState():void{
			TweenMax.killTweensOf(backgroundContainer);
			TweenMax.to(backgroundContainer, tweenTime, {dropShadowFilter:{color:0, blurX:8, blurY:8, alpha:.3,amount:1, inner:true}});
		}
		
		protected function toUnFocusedState():void{
			TweenMax.killTweensOf(backgroundContainer);
			TweenMax.to(backgroundContainer, tweenTime, {dropShadowFilter:{color:0, blurX:0, blurY:0, alpha:0,amount:0, inner:true,remove:true}});
		}
		
		protected function focusOut(e:FocusEvent):void{
			toUnFocusedState();
			
			if(input.text == "" || input.text == defaultText){
				input.displayAsPassword = false;
				input.text = defaultText;
			}	
		}
		
		protected function onChange(e:Event):void{
			dispatchEvent(new CFM_FormFieldEvent(CFM_FormFieldEvent.VALIDATE, input.text, validate(),true));
		}
		
		public function validate():Boolean{
			var valid:Boolean = true;
			
			if(required){
				if(input.text.length >= 1 && input.text != defaultText){
					if(isEmail){
						if(!validateEmail(input.text)){
							valid = false;
						}
					}
				} else {
					valid = false;
					toErrorState();
				}
			}
			
			if(!valid){
				toErrorState();
			} else {
				noErrorState();
			}
			
			return valid;
		}
		
		protected override function removeListeners():void{
			input.removeEventListener(FocusEvent.FOCUS_IN, focusIn);
			input.removeEventListener(FocusEvent.FOCUS_OUT, focusOut);
			input.removeEventListener(Event.CHANGE, onChange);
		}
		
		protected function validateEmail(_txt:String):Boolean{
			var v:RegExp = /^[a-z][\w.-]+@\w[\w.-]+\.[\w.-]*[a-z][a-z]$/i;
			return v.test(_txt);
		}
		
		public function disable():void{
			backgroundContainer.alpha = .5;
			input.mouseEnabled = false;
			enabled = false;
		}
		
		public function enable():void{
			backgroundContainer.alpha = 1;
			input.mouseEnabled = true;
			enabled = true;
		}
	}
}