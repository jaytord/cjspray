package cfm.utils.facebook.graph
{
	public class ConnectionType
	{
		static private const _connections:Array = ["feed", "picture", "tagged", "links", "photos", "groups", "albums", "statuses", "videos", "notes", "posts", "events"];

		static public const FEED:String = "feed";
		static public const PICTURE:String = "picture";
		static public const TAGGED:String = "tagged";
		static public const LINKS:String = "links";
		static public const PHOTOS:String = "photos";
		static public const GROUPS:String = "groups";
		static public const ALBUMS:String = "albums";
		static public const STATUSES:String = "statuses";
		static public const VIDEOS:String = "videos";
		static public const NOTES:String = "notes";
		static public const POSTS:String = "posts";
		static public const EVENTS:String = "events";
		
		{
			trace("--FBGraphAPI-inited");
		}
		
		static public function get CONNECTIONS():Array {
			return _connections.concat();
		}
	}
}