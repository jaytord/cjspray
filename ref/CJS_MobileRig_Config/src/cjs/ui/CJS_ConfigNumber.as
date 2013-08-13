package cjs.ui
{
	import cfm.core.containers.CFM_ObjectContainer;
	import cfm.core.graphics.CFM_BoxGraphics;
	import cfm.core.objects.CFM_Object;
	import cfm.core.text.CFM_TextField;
	
	import cjs.managers.FontManager;
	import cjs.model.AppModel;
	
	import com.greensock.OverwriteManager;
	import com.greensock.TweenMax;
	import com.greensock.easing.Back;
	import com.greensock.easing.Cubic;
	
	public class CJS_ConfigNumber extends CFM_Object
	{		
		private var __model:AppModel;
		private var section:CJS_NumberSection;
		private var sectionArray:Array = [];
		private var sectionHolder:CFM_ObjectContainer;
		
		private const SECTION_SPACING:Number = 1;
		
		public function CJS_ConfigNumber()
		{
			__model = AppModel.inst;
			
			super("ConfigNumber", true, true);
		}
		
		override protected function build():void{
			sectionHolder = new CFM_ObjectContainer();
			sectionHolder.renderTo(this);
			
			for each(var o:Object in __model.config.configuration){
				section = new CJS_NumberSection(o.id, o.value);
				section.renderTo(sectionHolder);
				sectionArray.push(section);
			}
			
			updateLayout();
		}
		
		private function updateLayout():void{
			var i:Number = 0;
			
			for each(var s:CJS_NumberSection in sectionArray){
				s.setProperties({x:i > 0 ? (sectionArray[i-1].x + sectionArray[i-1].width + SECTION_SPACING) : 0});
				i++;
			}
		}

		public function reset():void{
			for each(var cn:CJS_NumberSection in sectionArray)
				cn.reset();
			
			updateLayout();
		}
		
		public function updateSection(_id:String, _value:String):void{
			getSection( getSectionIndex(_id) ).update(_value);
			updateLayout();
		}
		
		public function getSection(_index:Number):CJS_NumberSection{ return sectionArray[_index]; }
		
		public function getSectionIndex(_id:String):Number{
			var index:Number;
			var i:Number = 0;
			
			for each(var s:CJS_NumberSection in sectionArray){
				if(s.id == _id){ 
					index = i;
					break;
				}
				i++;
			}
			
			return index;
		}
	}
}