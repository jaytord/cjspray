package cjs.config
{
	import flash.xml.XMLDocument;

	public class AppConfig
	{
		public static var MAIN_DOMAIN:String = 				"";
		public static var ASSETS_DIRECTORY:String = 		MAIN_DOMAIN + "assets/";
		public static var IMAGES_DIRECTORY:String = 		ASSETS_DIRECTORY + "images/";
		public static var XML_DIRECTORY:String = 			ASSETS_DIRECTORY + "xml/";
		public static var SOUNDS_DIRECTORY:String = 		ASSETS_DIRECTORY + "sounds/";
		public static var MAIN_XML_URL:String =				XML_DIRECTORY + "mobile_rigs.xml";
	}
}