package cjs.managers
{
	public class FontManager
	{
		[Embed(source='../embed/fonts/ROCKWELL.TTF', embedAsCFF="false", fontName='Rockwell', unicodeRange='U+0020-007E,U+00AE,U+2122,U+2022')]
		public static var Rockwell:Class;
		
		[Embed(source='../embed/fonts/ROCKWELB.TTF', embedAsCFF="false", fontName='RockwellBold', unicodeRange='U+0020-007E,U+00AE,U+2122,U+2022')]
		public static var RockwellBold:Class;
	}
}