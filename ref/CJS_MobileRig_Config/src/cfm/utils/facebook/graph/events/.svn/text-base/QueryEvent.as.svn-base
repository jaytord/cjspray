package cfm.utils.facebook.graph.events
{
	import flash.events.Event;
	
	public class QueryEvent extends Event
	{
		// Facebook GraphAPI "Object" events.
		/** @eventType album*/
		static public const ALBUM:String = "album";
		/** @eventType application*/
		static public const APPLICATION:String = "application";
		/** @eventType event*/
		static public const EVENT:String = "event";
		/** @eventType group*/
		static public const GROUP:String = "group";
		/** @eventType link*/
		static public const LINK:String = "link";
		/** @eventType note*/
		static public const NOTE:String = "note";
		/** @eventType page*/
		static public const PAGE:String = "page";
		/** @eventType photo*/
		static public const PHOTO:String = "photo";
		/** @eventType post*/
		static public const POST:String = "post";
		/** @eventType status*/
		static public const STATUS_MESSAGE:String = "status";
		/** @eventType subscription*/
		static public const SUBSCRIPTION:String = "subscription";
		/** @eventType user*/
		static public const USER:String = "user";
		/** @eventType video*/
		static public const VIDEO:String = "video";
		
		// Facebook GraphAPI "Connection" events.
		/** @eventType feed*/
		static public const FEED:String = "feed";
		/** @eventType picture*/
		static public const PICTURE:String = "picture";
		/** @eventType tagged*/
		static public const TAGGED:String = "tagged";
		/** @eventType links*/
		static public const LINKS:String = "links";
		/** @eventType photos*/
		static public const PHOTOS:String = "photos";
		/** @eventType groups*/
		static public const GROUPS:String = "groups";
		/** @eventType albums*/
		static public const ALBUMS:String = "albums";
		/** @eventType statuses*/
		static public const STATUSES:String = "statuses";
		/** @eventType videos*/
		static public const VIDEOS:String = "videos";
		/** @eventType notes*/
		static public const NOTES:String = "notes";
		/** @eventType posts*/
		static public const POSTS:String = "posts";
		/** @eventType events*/
		static public const EVENTS:String = "events";

		public var content:Object;
		public var resultType:String;
		public function QueryEvent(type:String, content:Object, resultType:String,bubbles:Boolean=false, cancelable:Boolean=false)
		{
			this.content = content;
			this.resultType = resultType;
			super(type, bubbles, cancelable);
		}
	}
}