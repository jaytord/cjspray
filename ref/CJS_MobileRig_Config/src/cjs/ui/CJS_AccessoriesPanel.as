package cjs.ui
{
	import cfm.core.text.CFM_TextField;
	
	import cjs.managers.FontManager;

	public class CJS_AccessoriesPanel extends CJS_SelectionsPanel
	{
		private var MAX_ROWS:Number = 8;
		private var heading:CFM_TextField;
		
		public function CJS_AccessoriesPanel()
		{
			super();
		}
		
		override protected function build():void{
			super.build();
			buildHeading();
		}
		
		protected function buildHeading():void{
			heading = new CFM_TextField(headingParams);
			heading.renderTo(this);
			
			selectionsHolder.setProperties({y:heading.y + heading.height});
		}
		
		private function get headingParams():Object{
			return {font:FontManager.Rockwell, size:18, color:0x999999, text:"Accessories"};
		}
		
		override public function updateSelections():void{
			killCurrnetSelections();
			
			var i:Number = 0;
			for each(var _id:String in __model.config.accessories){
				var label:String =  getSelectionLabel(_id, null);
				var price:Number = __model.config.getAccessoryPrice(_id);
				
				selection = new CJS_SelectionItem(label, price, __model.config.accessories.length > MAX_ROWS ? 230 : 500);
				selection.renderTo(selectionsHolder);
				
				if(i>0)
					if(i%2 && __model.config.accessories.length > MAX_ROWS)
						selection.setProperties({ x:270, y: selections[i-1].y });
					else
						selection.setProperties({ y: selections[i-1].y + SPACING });
				
				selections.push(selection);
				i++;
			}
		}
		
		override protected function getSelectionLabel(_id:String, _value:String):String{
			return __model.xml.ACCESSORY_XML..selection.(@id == _id).label;
		}
	}
}