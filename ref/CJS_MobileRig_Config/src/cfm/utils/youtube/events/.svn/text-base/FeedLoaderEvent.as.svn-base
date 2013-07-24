package cfm.utils.youtube.events {
	import flash.events.Event;
	
	public class FeedLoaderEvent extends Event {
		/** @eventType commentFeedLoaded */
		public static const COMMENT_FEED_LOADED:String = "http://gdata.youtube.com/schemas/2007#comment";
		
		/** @eventType http://gdata.youtube.com/schemas/2007#video */
		public static const VIDEO_FEED_LOADED:String = "http://gdata.youtube.com/schemas/2007#video";
		
		/** @eventType http://gdata.youtube.com/schemas/2007#favorite */
		public static const FAVORITES_FEED_LOADED:String = "http://gdata.youtube.com/schemas/2007#favorite";
		
		/** @eventType http://gdata.youtube.com/schemas/2007#playlistLink */
		public static const PLAYLIST_FEED_LOADED:String = "http://gdata.youtube.com/schemas/2007#playlistLink";
		
		/** @eventType http://gdata.youtube.com/schemas/2007#subscription */
		public static const SUBSCRIPTION_FEED_LOADED:String = "http://gdata.youtube.com/schemas/2007#subscription";
		
		/** @eventType http://gdata.youtube.com/schemas/2007#userProfile */
		public static const USER_PROFILE_FEED_LOADED:String = "http://gdata.youtube.com/schemas/2007#userProfile";
				
		/** @eventType http://gdata.youtube.com/schemas/2007#channel */
		public static const CHANNEL_FEED_LOADED:String = "http://gdata.youtube.com/schemas/2007#channel";
		
		/** @eventType http://gdata.youtube.com/schemas/2007#captionTrack */
		public static const CAPTION_TRACK_FEED_LOADED:String = "http://gdata.youtube.com/schemas/2007#captionTrack";
		
		/** @eventType http://gdata.youtube.com/schemas/2007#friend */
		public static const CONTACTS_FEED_LOADED:String = "http://gdata.youtube.com/schemas/2007#friend";
		
		/** @eventType http://gdata.youtube.com/schemas/2007#videoMessage */
		public static const INBOX_FEED_LOADED:String = "http://gdata.youtube.com/schemas/2007#videoMessage";
		
		/** @eventType http://gdata.youtube.com/schemas/2007#userEvent */
		public static const ACTIVITY_FEED_LOADED:String = "http://gdata.youtube.com/schemas/2007#userEvent";
		
		public var feed:XML;
		public function FeedLoaderEvent(type:String, feed:XML, bubbles:Boolean = false, cancelable:Boolean = false) {
			this.feed = feed;
			super(type, bubbles, cancelable);
		}
	}
}