package cfm.utils.youtube.player {
	
	import cfm.utils.youtube.events.PlayerEvent;
	
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.external.ExternalInterface;
	import flash.net.URLRequest;
	import flash.system.LoaderContext;
	import flash.system.Security;
	
	public class PlayerProxy extends Sprite {
		private var proxy:Object;
		private var loader:Loader;
		
		public function PlayerProxy(playerAPI_URL:String = "http://www.youtube.com/apiplayer?version=3") {
			//Security.allowInsecureDomain("*");
			Security.allowDomain("www.youtube.com");
			//Security.loadPolicyFile("www.youtube.com/crossdomain.xml");
			loader = addChild(new Loader()) as Loader;
			loader.contentLoaderInfo.addEventListener( Event.INIT, onLoaderInit );
			loader.load( new URLRequest( playerAPI_URL ),new LoaderContext(true) );
		}
		
		protected function onLoaderInit(e:Event):void {
			trace( "onLoaderInit" );
			//proxy = loader.content;
			
			loader.content.addEventListener( PlayerEvent.READY, onPlayerReady );
			loader.content.addEventListener( PlayerEvent.ERROR, onPlayerError );
			loader.content.addEventListener( PlayerEvent.STATE_CHANGE, onPlayerStateChange );
			loader.content.addEventListener( PlayerEvent.PLAYBACK_QUALITY_CHANGE, onVideoPlaybackQualityChange);
		}
		
		
		protected function onPlayerReady(e:Event):void {
			// Event.data contains the event parameter, which is the Player API ID 
			proxy = loader.content;
			//trace("player ready:", Object(e).data);
			dispatchEvent(e);
		
		}
		
		protected function onPlayerError(e:Event):void {
			// Event.data contains the event parameter, which is the error code
			//trace("player error:", Object(e).data);
			dispatchEvent(e);
		}
		
		protected function onPlayerStateChange(e:Event):void {
			// Event.data contains the event parameter, which is the new player state
			//trace("player state:", Object(e).data);
			dispatchEvent(e);
		}
		
		protected function onVideoPlaybackQualityChange(e:Event):void {
			// Event.data contains the event parameter, which is the new video quality
			//trace("video quality:", Object(e).data);
			dispatchEvent(e);
		}
		
		// QUEUEING FUNCTIONS
		/**
		 * Loads the specified video's thumbnail and prepares the player to play the video.
		 * 
		 * <p>The player does not request the FLV until playVideo() or seekTo() is called.</p>
		 * 
		 * 
		 * @param	videoId				Specifies the YouTube Video ID of the video to be played.
		 * @param	startSeconds		Specifies the time from which the video should start playing when playVideo() is called. If you specify a startSeconds value and then call seekTo(), then the player plays from the time specified in the seekTo()  call. When the video is cued and ready to play, the player will broadcast a video cued event (5).
		 * @param   suggestedQuality 	Specifies the suggested playback quality for the video. Please see the definition of the setPlaybackQuality function for more information about playback quality.
		 */
		public function cueVideoById(videoId:String, startSeconds:Number = 0, suggestedQuality:String = "default"):void {
			//Security.allowDomain("www.youtube.com");
			//Security.allowInsecureDomain("*");
			//Security.allowDomain("*");
			//Security.loadPolicyFile("www.youtube.com/crossdomain.xml");
			
			proxy.cueVideoById(videoId, startSeconds, suggestedQuality);
		}
		
		/**
		 * Loads and plays the specified video.
		 * 
		 * @param	videoId				Specifies the YouTube Video ID of the video to be played.
		 * @param	startSeconds		If it is specified, then the video will start from the closest keyframe to the specified time.
		 * @param   suggestedQuality 	Specifies the suggested playback quality for the video. Please see the definition of the setPlaybackQuality function for more information about playback quality.
		 */
		public function loadVideoById( videoId:String, startSeconds:Number = 0, suggestedQuality:String = "default" ):void {
			proxy.loadVideoById(videoId, startSeconds, suggestedQuality);
		}
		
		/**
		 * Loads the specified video's thumbnail and prepares the player to play the video. 
		 * 
		 * <p>The player does not request the FLV until playVideo()  or seekTo()  is called.</p>
		 * 
		 * @param	mediaContentUrl		A fully qualified YouTube player URL in the format http://www.youtube.com/v/VIDEO_ID.
		 * @param	startSeconds		Specifies the time from which the video should start playing when playVideo()  is called. If you specify startSeconds and then call seekTo(), then the player plays from the time specified in the seekTo()  call. When the video is cued and ready to play, the player will broadcast a video cued event (5).
		 */
		public function cueVideoByUrl(mediaContentUrl:String, startSeconds:Number): void {
			proxy.cueVideoByUrl(mediaContentUrl, startSeconds);
		}
		
		/**
		 * Loads and plays the specified video.
		 * 
		 * @param	mediaContentUrl		A fully qualified YouTube player URL in the format http://www.youtube.com/v/VIDEO_ID.
		 * @param	startSeconds		Specifies the time from which the video should start playing. If startSeconds is specified, the video will start from the closest keyframe to the specified time.
		 */
		public function loadVideoByUrl(mediaContentUrl:String, startSeconds:Number ):void {
			proxy.loadVideoByUrl(mediaContentUrl, startSeconds);			
		}
		
		// PLAYBACK CONTROL FUNCTIONS
		/**
		 * Plays the currently cued/loaded video.
		 * 
		 * <p>The final player state after this function executes will be playing (1).
		 */ 
		public function playVideo() : void {
			proxy.playVideo();
		}
		
		/**
		 * Pauses the currently playing video.
		 * 
		 * <p>The final player state after this function executes will be paused(2), unless the player is 
		 * in the ended(0) state when the function is called, in which case the player state will not change</p>
		 */ 
		public function pauseVideo() : void {
			proxy.pauseVideo();
		}
		
		/**
		 * Stops and cancels loading of the current video.
		 * 
		 * <p>This function should be reserved for rare situations when you know that the user 
		 * will not be watching additional video in the player. If your intent is to pause the 
		 * video, you should just call the pauseVideo  function. If you want to change the video 
		 * that the player is playing, you can call one of the queueing functions without 
		 * calling stopVideo  first.</p>
		 * 
		 * 
		 * <p>Important: Unlike the pauseVideo function, which leaves the player in the paused (2) 
		 * state, the stopVideo function could put the player into any not-playing state, including
		 * ended (0), paused (2), video cued (5) or unstarted (-1).</p>
		 */
		public function stopVideo() : void {
			proxy.stopVideo();
		}
		
		/**
		 * Seeks to a specified time in the video.
		 * 
		 * <p>The final player state after this function executes will be playing  (1) unless the 
		 * value of the seconds parameter is greater than the video length, in which case the final 
		 * player state will be ended  (0).</p>
		 * 
		 * @param	seconds			Identifies the time from which the video should start playing. <ul><li>If the player has already buffered the portion of the video to which the user is advancing, then the player will start playing the video at the closest keyframe to the specified time. This behavior is governed by the seek() method of the Flash player's NetStream object. In practice, this means that the player could advance to a keyframe just before or just after the specified time. (For more information, see Adobe's documentation for the NetStream class.)</li><li>If the player has not yet buffered the portion of the video to which the user is seeking, then the player will start playing the video at the closest keyframe before the specified time.</li></ul>
		 * @param	allowSeekAhead	<p>Determines whether the player will make a new request to the server if seconds  parameter specifies a time outside of the currently buffered video data. We recommend that you set this parameter to false while the user is dragging the mouse along a video progress bar and then set the parameter to true when the user releases the mouse.</p><p>This approach lets the user scroll to different points of the video without requesting new video streams by scrolling past unbuffered points in the video. Then, when the user releases the mouse button, the player will advance to the desired point in the video, only requesting a new video stream if the user is seeking to an unbuffered point in the stream.</p>
		 */
		public function seekTo(seconds:Number, allowSeekAhead:Boolean):void {
			proxy.seekTo(seconds, allowSeekAhead);
		}
		
		// VOLUME FUNCTIONS
		/**
		 * Mutes the player.
		 */
		public function mute() : void {
			proxy.mute();
		}
		
		/**
		 * Unmutes the player.
		 */ 
		public function unMute() : void {
			proxy.unMute();
		}
		
		/**
		 * Returns true if the player is muted, false if not.
		 */
		public function isMuted():Boolean {
			return proxy.isMuted;
		}
		
		/**
		 * Sets the volume.
		 * 
		 * @param	volume	An integer between 0 and 100.
		 */
		public function setVolume( volume : Number ) : void {
			proxy.setVolume( volume );
		}
		
		/**
		 * Returns the player's current volume.
		 * 
		 * @returns		An integer between 0 and 100.
		 */
		public function getVolume():Number {
			return proxy.getVolume();
		}
		
		// SETTING PLAYER SIZE FUNCTION
		
        /**
		 * Sets the size in pixels of the player.
		 * 
		 * <p>This method should be used instead of setting the width and height 
		 * properties of the MovieClip. Note that this method does not constrain
		 * the proportions of the video player, so you will need to maintain a 4:3
		 * aspect ratio. The default size of the chromeless SWF when loaded into
		 * another SWF is 320px by 240px and the default size of the embedded
		 * player SWF is 480px by 385px.</p>
		 * 
		 * @param	width 	Number in pixels to set the width of the player.
		 * @param	height	Number in pixels to set the height of the player.
		 */		
		public function setSize(width:Number, height:Number):void {
			proxy.setSize(width, height);
			//proxy.setSize(480,360);
		}
		
		// PLAYBACK STATUS FUNCTIONS
		
		/**
		 * Returns the number of bytes loaded for the current video.
		 */
		public function getVideoBytesLoaded():Number {
			return proxy.getVideoBytesLoaded();
		}
		
		/**
		 * Returns the size in bytes of the currently loaded/playing video.
		 */
		public function getVideoBytesTotal():Number {
			return proxy.getVideoBytesTotal();
		}
		
		/**
		 * Returns the number of bytes the video file started loading from.
		 * 
		 * <p>Example scenario: the user seeks ahead to a point that hasn't 
		 * loaded yet, and the player makes a new request to play a segment
		 * of the video that hasn't loaded yet.</p>
		 */
		public function getVideoStartBytes():Number {
			return proxy.getVideoStartBytes();
		}
		
		/**
		 * Return the state of the player.
		 * 
		 * <p>Possible values are unstarted (-1), ended (0), playing (1), 
		 * paused (2), buffering (3), video cued (5).</p>
		 */
		public function getPlayerState():Number {
			return proxy.getPlayerState();
		}
		
		/**
		 * This function sets the suggested video quality for the current video.
		 * 
		 * <p>The function causes the video to reload at its current position in
		 *  the new quality. If the playback quality does change, it will only
		 *  change for the video being played.</p>
		 * 
		 * <p>Calling this function does not guarantee that the playback quality
		 * will actually change. If the playback quality does change, it will only
		 * change for the video being played. At that time, the onPlaybackQualityChange
		 * event will fire, and your code should respond to the event rather than
		 * the fact that it called the setPlaybackQuality function.</p>
		 * 
		 * @param	suggestedQuality	<p>A String with the possible values "small", "medium", "large", "hd720" or "default". Setting the parameter value to "default" instructs YouTube to select the most appropriate playback quality, which will vary for different users, videos, systems and other playback conditions.</p>
		 */
		public function setPlaybackQuality(suggestedQuality:String):void {
			proxy.setPlaybackQuality(suggestedQuality);
		}
		
		/**
		 */
		public function getAvailableQualityLevels():Array {
			return proxy.getAvailableQualityLevels();
		}
		
		/**
		 * Returns the duration in seconds of the currently playing video. 
		 * 
		 * <p>Note that getDuration() will return 0 until the video's metadata 
		 * is loaded, which normally happens just after the video starts playing.</p> 
		 */
		public function getDuration():Number {
			return proxy.getDuration();
		}
		
		/**
		 * Returns the YouTube.com URL for the currently loaded/playing video.
		 */
		public function getVideoUrl():String {
			return proxy.getVideoUrl();
		}
		
		/**
		 * Returns the embed code for the currently loaded/playing video.
		 */
		public function getVideoEmbedCode():String {
			return proxy.getVideoEmbedCode();
		}
		
		/**
		 * Destroys the player instance. 
		 * <p>It should be called before unloading the player SWF from your parent SWF.</p>
		 * 
		 * <p>Important: You should always call player.destroy() to unload a YouTube player. 
		 * This function will close the NetStream object and stop additional videos from 
		 * downloading after the player has been unloaded. If your code contains additional 
		 * references to the player SWF, you also need to destroy those references separately 
		 * when you unload the player.</p>
		 */
		public function destroy():void {
			// Need to rethink how to handle the creation and destruction of the proxy since this wrapper object is of no use once the proxy is destroyed
			proxy.destroy();
			loader.unload();
		}
	}
}