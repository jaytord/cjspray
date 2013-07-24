package cjs.managers
{
	import cjs.events.CJS_DealerEvent;
	
	import flash.events.EventDispatcher;

	public class DealerManager extends EventDispatcher
	{
		private var _dealers:Array = [{u:"jaytord", p:"cjspray"}];
		
		public function DealerManager()
		{
			trace("Init - DealerManager");
		}
		
		public function validateDealerLogin(_username:String, _password:String):void{
			var valid:Boolean = false;
			
			for each(var d:Object in _dealers)
				if(String(d.u).toLowerCase() == _username.toLowerCase() && String(d.p) == _password)
					valid = true;
			
			dispatchEvent(new CJS_DealerEvent(CJS_DealerEvent.LOG_IN, _username, valid))
		}
		
		public function dealerLogOut():void{
			dispatchEvent(new CJS_DealerEvent(CJS_DealerEvent.LOG_OUT, null, false))
		}
	}
}