﻿package cfm.core.media{	import cfm.core.containers.CFM_ObjectContainer;	import cfm.core.events.CFM_ImageEvent;	import cfm.core.managers.CFM_ErrorManager;	import cfm.core.managers.CFM_ImageManager;	import cfm.core.objects.CFM_Object;		import com.greensock.TweenMax;	import com.greensock.easing.Linear;		import flash.display.Bitmap;	import flash.display.Loader;	import flash.display.LoaderInfo;	import flash.events.Event;	import flash.events.IOErrorEvent;	import flash.events.ProgressEvent;	import flash.net.URLRequest;	import flash.system.LoaderContext;	import flash.system.Security;	import flash.ui.KeyLocation;	import flash.ui.Keyboard;
		public class CFM_Image extends CFM_Object	{		protected var wdth:Number;		protected var hght:Number;		protected var domain:String;		public var loadedBitmap:Bitmap;		protected var loader:Loader;		protected var container:CFM_ObjectContainer;				protected var loadPercent:Number;		protected var tweenIn:Boolean;		public var url:String;				public function CFM_Image(_url:String, _width:Number, _height:Number, _tweenIn:Boolean = true, _autoInit:Boolean = true, _autoDestoy:Boolean = true)		{			url = _url;			wdth = _width;			hght = _height;			tweenIn = _tweenIn ;									super("CFM_Image",_autoInit, _autoDestoy);		}				protected override function build():void{			container = new CFM_ObjectContainer();			container.renderTo(this);			container.setProperties({alpha:0, visible:false});						loadPolicy();			loadFacebookImagePolicies();						if(CFM_ImageManager.isAlreadyLoaded(url)){				createImage();			} else {				loader = new Loader();				loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, CFM_ErrorManager.ioError, false, 0, true);				loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loadingComplete, false, 0, true);				loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, imageLoadProgress, false, 0, true);								try {					loader.load( new URLRequest(url), new LoaderContext( true ) );				} catch (e:Error) {					trace("missing image - " + url);				}			}		}				public function loadPolicy():void{			domain = url.substring( 0 , url.indexOf("/", 10 )+1 );						if(CFM_ImageManager.POLICY_DOMAINS.indexOf(domain) == -1){				CFM_ImageManager.POLICY_DOMAINS.push(domain);				Security.loadPolicyFile(domain + "crossdomain.xml");			} 		}				public function loadFacebookImagePolicies():void{			var profileDomain:String = "http://profile.ak.fbcdn.net/";						if(CFM_ImageManager.POLICY_DOMAINS.indexOf(profileDomain) == -1){				CFM_ImageManager.POLICY_DOMAINS.push(profileDomain);				Security.loadPolicyFile(profileDomain + "crossdomain.xml");			}						for ( var i:Number = "a".charCodeAt(); i <= "z".charCodeAt(); i++) {				var domain:String = "http://photos-" + String.fromCharCode(i) + ".ak.fbcdn.net/";								if(CFM_ImageManager.POLICY_DOMAINS.indexOf(domain) == -1){					CFM_ImageManager.POLICY_DOMAINS.push(domain);					Security.loadPolicyFile(domain + "crossdomain.xml");					//trace("::::" + domain + "::::");				} 			}		}						private function loadingComplete(e:Event):void{			var bmp:Bitmap = Bitmap(e.target.loader.content);									CFM_ImageManager.LOADED_IMAGES_ARRAY.push({bmp:bmp, url:url, ar:bmp.width/bmp.height});						var loader:Loader = LoaderInfo(e.currentTarget).loader;			loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, CFM_ErrorManager.ioError);			loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, loadingComplete);			loader.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS, imageLoadProgress);						createImage();		}				private function createImage():void{			var bmp:Bitmap = CFM_ImageManager.getBitmapImage(url,wdth,hght);			bmp.smoothing = true;			container.addChild(bmp);							loadedBitmap = bmp;			loadedBitmap.smoothing = true;						showImage();			dispatchEvent(new CFM_ImageEvent(CFM_ImageEvent.IMAGE_LOADER_COMPLETE, url, loadedBitmap, 1));		}				protected function showImage():void{			TweenMax.to(container, tweenIn ? .3 : 0, {delay:tweenIn ? Math.random(): 0, autoAlpha:1, ease:Linear.easeNone});		}				private function imageLoadProgress(e:ProgressEvent):void{			var li:LoaderInfo = LoaderInfo(e.currentTarget);						loadPercent = e.bytesLoaded/e.bytesTotal;			updatePreloadIcon();		}				protected function updatePreloadIcon():void{}				public function resize(_width:Number, _height:Number, _delay:Number, _tweenTime:Number, _ease:Object):void{			var newS:Number = _width/wdth;								TweenMax.to(container, _tweenTime, {delay:_delay, ease:_ease, scaleX:newS, scaleY:newS});		}				protected override function destroy(e:Event):void{			while(container.numChildren>0){				var c:* = container.getChildAt(0);				container.removeChild(c);				c = null;			}						try {				loader.unload();				loader.close();			} catch (e:Error) {				trace(e);			}						super.destroy(e);		}	}}