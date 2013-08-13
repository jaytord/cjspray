package cjs.buttons
{
	import cfm.core.graphics.CFM_BoxGraphics;
	import cfm.core.ui.CFM_SimpleButton;
	
	public class CJS_CloseButton extends CJS_ButtonTemplate
	{
		public function CJS_CloseButton()
		{
			super(0, "close", "X", 4, 2, "close", "", false, false, [0,0,0,0]);
		}
	}
}