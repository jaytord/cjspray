package cfm.utils.youtube.data {
	import cfm.utils.youtube.events.FeedLoaderEvent;
	
	import flash.errors.IOError;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import cfm.utils.youtube.ns.atom;
	
	[Event(name="complete", type="flash.events.Event")]
	[Event(name="progress", type="flash.events.ProgressEvent")]
	
	/**
	 * @eventType cfm.utils.youtube.events.FeedLoaderEvent.COMMENT_FEED_LOADED
	 */
	[Event(name="commentFeedLoaded", type="cfm.utils.youtube.events.FeedLoaderEvent")]
	
	/**
	 * @eventType cfm.utils.youtube.events.FeedLoaderEvent.VIDEO_FEED_LOADED
	 */
	[Event(name="videoFeedLoaded", type="cfm.utils.youtube.events.FeedLoaderEvent")]
	
	/**
	 * @eventType cfm.utils.youtube.events.FeedLoaderEvent.FAVORITES_FEED_LOADED
	 */ 
	[Event(name="favoritesFeedLoaded", type="cfm.utils.youtube.events.FeedLoaderEvent")]
	
	/**
	 * @eventType cfm.utils.youtube.events.FeedLoaderEvent.PLAYLIST_FEED_LOADED
	 */
	[Event(name="playlistFeedLoaded", type="cfm.utils.youtube.events.FeedLoaderEvent")]
	
	/**
	 * @eventType cfm.utils.youtube.events.FeedLoaderEvent.SUBSCRIPTION_FEED_LOADED
	 */
	[Event(name="subscriptionFeedLoaded", type="cfm.utils.youtube.events.FeedLoaderEvent")]
	
	/**
	 * @eventType cfm.utils.youtube.events.FeedLoaderEvent.USER_PROFILE_FEED_LOADED
	 */
	[Event(name="userProfileFeedLoaded", type="cfm.utils.youtube.events.FeedLoaderEvent")]
	
	/**
	 * @eventType cfm.utils.youtube.events.FeedLoaderEvent.CHANNEL_FEED_LOADED
	 */
	[Event(name="channelFeedLoaded", type="cfm.utils.youtube.events.FeedLoaderEvent")]
	
	/**
	 * @eventType cfm.utils.youtube.events.FeedLoaderEvent.CAPTION_TRACK_FEED_LOADED
	 */
	[Event(name="captionTrackFeedLoaded", type="cfm.utils.youtube.events.FeedLoaderEvent")]
	
	/**
	 * @eventType cfm.utils.youtube.events.FeedLoaderEvent.CONTACTS_FEED_LOADED
	 */
	[Event(name="contactsFeedLoaded", type="cfm.utils.youtube.events.FeedLoaderEvent")]
	
	/**
	 * <p>Authentication required.</p>
	 * @eventType cfm.utils.youtube.events.FeedLoaderEvent.INBOX_FEED_LOADED
	 */
	[Event(name="inboxFeedLoaded", type="cfm.utils.youtube.events.FeedLoaderEvent")]
	
	/**
	 * @eventType cfm.utils.youtube.events.FeedLoaderEvent.ACTIVITY_FEED_LOADED
	 */
	[Event(name="activityFeedLoaded", type="cfm.utils.youtube.events.FeedLoaderEvent")]
	
	public class FeedLoader extends EventDispatcher{
		static public const YOU_TUBE_DATA_API_VERSION:String = "2";
		static public const SCHEME_KIND:String = "http://schemas.google.com/g/2005#kind";
		
		private var urlLoader:URLLoader;
		
		public function FeedLoader(url:String = null) {
			urlLoader = new URLLoader();
			urlLoader.addEventListener(Event.COMPLETE, onLoadComplete);
			urlLoader.addEventListener(IOErrorEvent.IO_ERROR, onLoadError);
			urlLoader.addEventListener(ProgressEvent.PROGRESS, onLoadProgress);
			trace("loadFeed--------" + url);
			if (url) loadFeed(url);
		}
		
		public function loadFeed(url:String):void {
			trace("loadFeed--------" + url);
			if(url.indexOf("http://gdata.youtube.com") == -1) {
				
				throw new IOError("FeedLoader::loadFeed(). ERROR:Invalid URL; feed must originate from http://gdata.youtube.com.");
			}
			
			url = setAPIVersion(url);
			urlLoader.load(new URLRequest(url));
		}
		
		private function setAPIVersion(url:String):String {
			if(url.indexOf("?") != -1){
				var i:int = url.search("v=");
				if( i == -1) {
					url += "v=" + YOU_TUBE_DATA_API_VERSION;
				} else if (url.substr(i,3) != "v=" + YOU_TUBE_DATA_API_VERSION){
					url = url.replace(url.substr(i, 3), "v=" + YOU_TUBE_DATA_API_VERSION); 
				}
			}else {
				url += "?v=" + YOU_TUBE_DATA_API_VERSION;
			}
			
			return url;
		}
		
		/**
		 * Re-dispatch <code>complete</code> event.
		 */ 
		private function onLoadComplete(e:Event):void {
			var feed:XML = XML(urlLoader.data);
			// Redispatch "complete" event.
			dispatchEvent(e);
			
			// Note: The event constants of FeedLoaderEvent are URIs matching feed categories as defined
			// in YouTube's data API. Passing the feed's category string as the event type provides a clean
			// way to dispatch a "loaded" event specific to a given category.
			dispatchEvent(new FeedLoaderEvent(feed.atom::category.(@scheme == SCHEME_KIND).@term, feed));			
		}
		
		/**
		 * Re-dispatch <code>progress</code> event.
		 */
		private function onLoadProgress(e:ProgressEvent):void {
			dispatchEvent(e);
		}
		
		private function onLoadError(e:IOErrorEvent):void {
			dispatchEvent(e);
		}
	}
}