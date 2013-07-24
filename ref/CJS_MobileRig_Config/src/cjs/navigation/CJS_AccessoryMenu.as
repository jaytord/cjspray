package cjs.navigation
{
	import cfm.core.events.CFM_SimpleButtonEvent;
	import cfm.core.ui.CFM_SimpleButton;
	
	import cjs.buttons.CJS_AccessoryButton;

	public class CJS_AccessoryMenu extends CJS_MainNavigation
	{
		public function CJS_AccessoryMenu(_list:XMLList)
		{
			super(_list, true,true);
		}
		
		override protected function buildButton(_i:Number, _tag:XML):CFM_SimpleButton{
			return new CJS_AccessoryButton(_i,_tag.@id,_tag.label,_tag.@value);
		}
		
		override protected function build():void{
			var i:Number = 0;
			for each(var bs:XML in list){
				var btn:CFM_SimpleButton = buildButton(i,bs);
				btn.renderTo(this);
				
				if(i>0){
					if(i%2) 
						btn.setProperties({x:460, y: buttonsArray[i-1].y});
					else
						btn.setProperties({x:0, y: buttonsArray[i-1].y + buttonsArray[i-1].height + 2});
				}
				
				buttonsArray.push(btn);
				i++;
			}
		}
	}
}