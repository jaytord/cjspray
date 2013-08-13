package cjs.pages
{
	import cfm.core.events.CFM_NavigationEvent;
	
	import cjs.events.CJS_DealerEvent;
	import cjs.events.CJS_ModeEvent;
	import cjs.events.CJS_infoButtonEvent;
	import cjs.navigation.CJS_TrailerMenu;
	
	import flashx.textLayout.events.ModelChange;

	public class CJS_TrailerPage extends CJS_PageTemplate
	{
		private var trailerXML				:XML;
		private var trailerMenu				:CJS_TrailerMenu;
		
		public function CJS_TrailerPage(_pageId:String)
		{
			super(_pageId);
			
			trailerXML = 					__model.xml.TRAILER_XML;
		}
		
		override protected function dealerLogin():void{
			if(!__model.config.dealerMode)
				__model.windows.changePage("dealer_w");
			else
				__model.dealers.dealerLogOut();
		}
		
		public function toDealerMode(_username:String):void{
			navigation.buttonsArray[0].updateLabel(_username + " : Log Out",true);
		}
		
		public function killDealerMode():void{
			navigation.buttonsArray[0].updateLabel("Dealer Login");
		}
		
		override protected function buildHeading():void{
			super.buildHeading();
			heading.y = 50;
		}
		
		override protected function build():void{
			trailerMenu = new CJS_TrailerMenu(trailerXML.menu.selection);
			trailerMenu.renderTo(this);
			trailerMenu.setProperties({y:100});
			
			super.build();
		}
		
		override protected function addListeners():void{
			super.addListeners();
			
			trailerMenu.addEventListener(CJS_infoButtonEvent.OPEN_INFO, openInfo, false, 0, true);
			trailerMenu.addEventListener(CFM_NavigationEvent.BUTTON_CLICKED, trailerSelected, false, 0, true);
			
			__model.dealers.addEventListener(CJS_DealerEvent.LOG_IN, onDealerLoginAttempt, false, 0, true);
			__model.dealers.addEventListener(CJS_DealerEvent.LOG_OUT, onDealerLogOut, false, 0, true);
		}
		
		private function onDealerLoginAttempt(e:CJS_DealerEvent):void{
			if(!e.success){
				__model.windows.changePage("login_fail");
			} else {
				__model.config.dealerMode = true;
				__model.windows.removeCurrentPage(true);
				toDealerMode(e.username);
			}
		}
		
		private function onDealerLogOut(e:CJS_DealerEvent):void{
			__model.config.dealerMode = false;
			killDealerMode();
		}
		
		private function trailerSelected(e:CFM_NavigationEvent):void{
			__model.config.updateOption(trailerXML.menu.@id,e.value);
			
			dispatchEvent(new CJS_ModeEvent(CJS_ModeEvent.MODE_CHANGED, CJS_ModeEvent.OPTIONS_MODE));
		}
		
		override public function resize():void{
			super.resize();
			
			setProperties({x:((stage.stageWidth-width+14)/2)});
		}
	}
}