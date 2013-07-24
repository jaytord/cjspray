package cjs.windows
{
	import cfm.core.events.CFM_NavigationEvent;
	import cfm.core.ui.CFM_EmailForm;
	
	import cjs.ui.CJS_LoginForm;

	public class CJS_DealerLoginWindow extends CJS_WindowTemplate
	{
		private var form:CJS_LoginForm;
		
		public function CJS_DealerLoginWindow(_index:Number, _xml:XML, _params:Object)
		{
			super(_index, _xml, _params);
			
			WINDOW_WIDTH = 270;
		}
		
		override protected function buildContent():void{
			buildForm();
		}
		
		protected function buildForm():void{
			form = new CJS_LoginForm(xml.form.field,"",WINDOW_WIDTH-(MARGIN*2));
			form.renderTo(content);
			form.setProperties({x:MARGIN, y:description.y + description.height + MARGIN+8});
		}
		
		override protected function navigationClicked(e:CFM_NavigationEvent):void{
			form.submitForm();
		}
		
		override protected function buildComplete():void{
			super.buildComplete();
			navigation.y += MARGIN-4;
			content.y = -190;
		}
	}
}