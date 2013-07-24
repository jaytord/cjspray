package cfm.utils.facebook.graph
{
	import cfm.utils.facebook.graph.events.QueryEvent;
	
	import com.adobe.serialization.json.JSON;
	
	import flash.errors.IOError;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	import flash.utils.Dictionary;
	
	[Event(name="complete", type="flash.events.Event")]
	[Event(name="progress", type="flash.events.ProgressEvent")]
	
	// Facebook GraphAPI "Object" events.
	/** @eventType cfm.utils.facebook.graph.events.QueryRequestEvent.ALBUM */
	[Event(name="album", type="cfm.utils.facebook.graph.events.QueryEvent")]
	
	/** @eventType cfm.utils.facebook.graph.events.QueryRequestEvent.APPLICATION */
	[Event(name="application", type="cfm.utils.facebook.graph.events.QueryEvent")]
	
	/** @eventType cfm.utils.facebook.graph.events.QueryRequestEvent.EVENT */
	[Event(name="event", type="cfm.utils.facebook.graph.events.QueryEvent")]
	
	/** @eventType cfm.utils.facebook.graph.events.QueryRequestEvent.GROUP */
	[Event(name="group", type="cfm.utils.facebook.graph.events.QueryEvent")]
	
	/** @eventType cfm.utils.facebook.graph.events.QueryRequestEvent.LINK */
	[Event(name="link", type="cfm.utils.facebook.graph.events.QueryEvent")]
	
	/** @eventType cfm.utils.facebook.graph.events.QueryRequestEvent.NOTE */
	[Event(name="note", type="cfm.utils.facebook.graph.events.QueryEvent")]
	
	/** @eventType cfm.utils.facebook.graph.events.QueryRequestEvent.PAGE */
	[Event(name="page", type="cfm.utils.facebook.graph.events.QueryEvent")]
	
	/** @eventType cfm.utils.facebook.graph.events.QueryRequestEvent.PHOTO */
	[Event(name="photo", type="cfm.utils.facebook.graph.events.QueryEvent")]
	
	/** @eventType cfm.utils.facebook.graph.events.QueryRequestEvent.POST */
	[Event(name="post", type="cfm.utils.facebook.graph.events.QueryEvent")]
	
	/** @eventType cfm.utils.facebook.graph.events.QueryRequestEvent.STATUS_MESSAGE */
	[Event(name="status", type="cfm.utils.facebook.graph.events.QueryEvent")]
	
	/** @eventType cfm.utils.facebook.graph.events.QueryRequestEvent.SUBSCRIPTION */
	[Event(name="subscription", type="cfm.utils.facebook.graph.events.QueryEvent")]
	
	/** @eventType cfm.utils.facebook.graph.events.QueryRequestEvent.USER */
	[Event(name="user", type="cfm.utils.facebook.graph.events.QueryEvent")]
	
	/** @eventType cfm.utils.facebook.graph.events.QueryRequestEvent.VIDEO */
	[Event(name="video", type="cfm.utils.facebook.graph.events.QueryEvent")]

	
	// Facebook GraphAPI "Connection" events
	/** @eventType cfm.utils.facebook.graph.events.QueryRequestEvent.FEED */
	[Event(name="feed", type="cfm.utils.facebook.graph.events.QueryEvent")]
	
	/** @eventType cfm.utils.facebook.graph.events.QueryRequestEvent.PICTURE */
	[Event(name="picture", type="cfm.utils.facebook.graph.events.QueryEvent")]
	
	/** @eventType cfm.utils.facebook.graph.events.QueryRequestEvent.TAGGED */
	[Event(name="tagged", type="cfm.utils.facebook.graph.events.QueryEvent")]
	
	/** @eventType cfm.utils.facebook.graph.events.QueryRequestEvent.LINKS */
	[Event(name="links", type="cfm.utils.facebook.graph.events.QueryEvent")]
	
	/** @eventType cfm.utils.facebook.graph.events.QueryRequestEvent.PHOTOS */
	[Event(name="photos", type="cfm.utils.facebook.graph.events.QueryEvent")]
	
	/** @eventType cfm.utils.facebook.graph.events.QueryRequestEvent.GROUPS */
	[Event(name="groups", type="cfm.utils.facebook.graph.events.QueryEvent")]
	
	/** @eventType cfm.utils.facebook.graph.events.QueryRequestEvent.ALBUMS */
	[Event(name="albums", type="cfm.utils.facebook.graph.events.QueryEvent")]
	
	/** @eventType cfm.utils.facebook.graph.events.QueryRequestEvent.STATUSES */
	[Event(name="statuses", type="cfm.utils.facebook.graph.events.QueryEvent")]
	
	/** @eventType cfm.utils.facebook.graph.events.QueryRequestEvent.VIDEOS */
	[Event(name="videos", type="cfm.utils.facebook.graph.events.QueryEvent")]
	
	/** @eventType cfm.utils.facebook.graph.events.QueryRequestEvent.NOTES */
	[Event(name="notes", type="cfm.utils.facebook.graph.events.QueryEvent")]
	
	/** @eventType cfm.utils.facebook.graph.events.QueryRequestEvent.POSTS */
	[Event(name="posts", type="cfm.utils.facebook.graph.events.QueryEvent")]
	
	/** @eventType cfm.utils.facebook.graph.events.QueryRequestEvent.EVENTS */
	[Event(name="events", type="cfm.utils.facebook.graph.events.QueryEvent")]
	
	public class Query extends EventDispatcher
	{
		static private const GRAPH_API_DOMAIN:String = "https://graph.facebook.com";
		//static private const connectionPattern:RegExp = /https:\/\/graph.facebook.com\/(\w)+\/(feed|)/;
		
		protected var loaderQueue:Dictionary = new Dictionary();
		protected var _queueSize:int = 0;
		
		public function get queueSize():int {
			return _queueSize;
		}
		
		public function Query(url:String = null, limit:int = 25, accessToken:String = null)
		{
			if(url) makeQuery(url, limit, accessToken);
		}
		
		//public function makeQuery(id:String, connection:String, limit:int = 25, accessToken:String = null, requestMetadata:Boolean = false):void {
		//	
		//}
		public function makeQuery(url:String, limit:int = 25, accessToken:String = null):void {
			if(url.indexOf(GRAPH_API_DOMAIN) == -1) {
				throw new IOError("cfm.utils.facebook.graph.Query::makeQuery(). ERROR:Invalid URL; all facebook graph api queries must be passed to https://graph.facebook.com");
			}
			
			var connectionType:String = getConnectionType(url);
			var resultType:String = (connectionType)?ResultType.CONNECTION:ResultType.OBJECT;
			
			var request:URLRequest = new URLRequest(url);
			var variables:URLVariables = new URLVariables();
			
			if(resultType == ResultType.OBJECT) {
				variables.metadata = "1";
			}else {
				variables.limit = limit;
			}
			
			if(accessToken) {
				variables.access_token = accessToken;
			}
			
			request.data = variables;
			
			var loader:URLLoader = new URLLoader(request);
			loader.addEventListener(Event.COMPLETE, onLoadComplete);
			loader.addEventListener(IOErrorEvent.IO_ERROR, onLoadError);
			loader.addEventListener(ProgressEvent.PROGRESS, onLoadProgress);
			
			loader.addEventListener(Event.COMPLETE, onLoadComplete);
			loaderQueue[loader] ={rType:resultType, cType:connectionType};
			++_queueSize;
		}
		
		/**
		 * Re-dispatch <code>complete</code> event.
		 */
		protected function onLoadComplete(e:Event):void {
			--_queueSize;
			
			var loader:URLLoader = e.currentTarget as URLLoader;
			var params:Object = loaderQueue[loader];
			
			var content:Object = JSON.decode(loader.data as String) as Object;
			
			if(content.error) throw new IOError(content.error.type + "; " + content.error.message);
			
			dispatchEvent(new QueryEvent((params.cType)?params.cType:content.type, content, params.rType));
			delete loaderQueue[loader];
		}
		
		/**
		 * Re-dispatch <code>progress</code> event.
		 */
		protected function onLoadProgress(e:ProgressEvent):void {
			dispatchEvent(e);
		}
		
		/**
		 * Re-dispatch <code>ioError</code> event.
		 */
		protected function onLoadError(e:IOErrorEvent):void {
			dispatchEvent(e);
		}
		
		protected function getConnectionType(url:String):String {
			var v:Number = url.indexOf("?");
			var sub:String = url.substring(url.lastIndexOf("/") + 1,(v != -1)?v:Number.MAX_VALUE).toLowerCase();
			return (ConnectionType.CONNECTIONS.join("").indexOf(sub) != -1)?sub:null;
		}
	}
}