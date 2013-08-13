package cjs.ui
{
	import cfm.core.containers.CFM_ObjectContainer;
	import cfm.core.objects.CFM_Object;
	import cfm.core.text.CFM_TextField;
	
	import cjs.managers.FontManager;
	import cjs.model.AppModel;
	
	public class CJS_SelectionsPanel extends CFM_Object
	{
		protected var __model:AppModel;
		
		protected var selection:CJS_SelectionItem;
		protected var selections:Array = [];
		protected var selectionsHolder:CFM_ObjectContainer;
		
		protected const SPACING:Number = 15;
		
		public function CJS_SelectionsPanel()
		{
			__model = AppModel.inst;
			
			super("CurrentSelectionsPanel", true, true);
		}
		
		override protected function build():void{
			selectionsHolder = new CFM_ObjectContainer();
			selectionsHolder.renderTo(this);
		}
		
		public function killCurrnetSelections():void{
			for each(var s:CJS_SelectionItem in selections){
				s.remove();
				s = null;
			}
			
			selections = [];
		}
		
		public function updateSelections():void{
			killCurrnetSelections();
			
			var i:Number = 0;
			for each(var so:Object in __model.config.configuration){
				if(so.value != "X"){					
					var label:String =  getButtonLabel(so.id) + " : " + getSelectionLabel(so.id, so.value);
					
					selection = new CJS_SelectionItem(label, __model.config.dealerMode ? so.dprice : so.price, 500);
					selection.renderTo(selectionsHolder);
					
					selection.setProperties({ y: i>0 ? (selections[i-1].y + SPACING) : 0 });
					
					selections.push(selection);
					i++;
				}
			}
		}
		
		protected function getButtonLabel(_id:String):String{
			return __model.xml.mainXML..menu.(@id == _id).button.label;
		}
		
		protected function getSelectionLabel(_id:String, _value:String):String{
			return __model.xml.mainXML..menu.(@id == _id).selection.(@value == _value).label;
		}
	}
}