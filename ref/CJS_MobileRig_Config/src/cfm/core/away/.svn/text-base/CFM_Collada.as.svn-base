package cfm.core.away
{
	import away3dlite.animators.*;
	import away3dlite.animators.bones.*;
	import away3dlite.containers.*;
	import away3dlite.core.base.*;
	import away3dlite.core.utils.*;
	import away3dlite.loaders.Collada;
	import away3dlite.loaders.data.*;
	import away3dlite.loaders.utils.*;
	
	import flash.geom.*;
	import flash.utils.*;
	
	public class CFM_Collada extends Collada
	{
		public function CFM_Collada()
		{
			super();
		}
		
		override protected function buildAnimations():void{
			var bone:Bone;
			
			//hook up bones to skincontrollers
			for each (_skinController in _skinControllers) {
				bone = (container as ObjectContainer3D).getBoneByName(_skinController.name);
				if (bone) {
					_skinController.joint = bone.joint;
					_skinController.update();
				} else
					Debug.warning("no joint found for " + _skinController.name);
			}
			
			//process animations
			for each (var _animationData:AnimationData in animationLibrary)
			{
				switch (_animationData.animationType)
				{
					case AnimationData.SKIN_ANIMATION:
						var animation:CFM_BonesAnimator = new CFM_BonesAnimator();
						
						for each (_skinController in _skinControllers)
						animation.addSkinController(_skinController);
						
						var param:Array;
						var rX:String;
						var rY:String;
						var rZ:String;
						var sX:String;
						var sY:String;
						var sZ:String;
						
						for each (var channelData:ChannelData in _animationData.channels) {
						var channel:Channel = channelData.channel;
						
						channel.target = _containers[channel.name];
						animation.addChannel(channel);
						
						var times:Array = channel.times;
						
						if (_animationData.start > times[0])
							_animationData.start = times[0];
						
						if (_animationData.end < times[times.length - 1])
							_animationData.end = times[times.length - 1];
						
						if (channel.target is Bone) {
							rX = "jointRotationX";
							rY = "jointRotationY";
							rZ = "jointRotationZ";
							sX = "jointScaleX";
							sY = "jointScaleY";
							sZ = "jointScaleZ";
						} else {
							rX = "rotationX";
							rY = "rotationY";
							rZ = "rotationZ";
							sX = "scaleX";
							sY = "scaleY";
							sZ = "scaleZ";
						}
						
						switch(channelData.type)
						{
							case "translateX":
							case "translationX":
							case "transform(3)(0)":
								channel.type = ["x"];
								if (yUp) {
									for each (param in channel.param)
									param[0] *= -scaling;
								} else {
									for each (param in channel.param)
									param[0] *= scaling;
								}
								break;
							case "translateY":
							case "translationY":
							case "transform(3)(1)":
								if (yUp)
									channel.type = ["y"];
								else
									channel.type = ["z"];
								
								for each (param in channel.param)
								param[0] *= -scaling;
								break;
							case "translateZ":
							case "translationZ":
							case "transform(3)(2)":
								if (yUp)
									channel.type = ["z"];
								else
									channel.type = ["y"];
								
								for each (param in channel.param)
								param[0] *= scaling;
								break;
							case "jointOrientX":
							case "rotateXANGLE":
							case "rotateX":
							case "RotX":
								channel.type = [rX];
								
								for each (param in channel.param)
								param[0] *= -1;
								break;
							case "jointOrientY":
							case "rotateYANGLE":
							case "rotateY":
							case "RotY":
								if (yUp)
									channel.type = [rY];
								else
									channel.type = [rZ];
								
								for each (param in channel.param)
								param[0] *= -1;
								break;
							case "jointOrientZ":
							case "rotateZANGLE":
							case "rotateZ":
							case "RotZ":
								if (yUp)
									channel.type = [rZ];
								else
									channel.type = [rY];
								break;
							case "scaleX":
							case "transform(0)(0)":
								channel.type = [sX];
								break;
							case "scaleY":
							case "transform(1)(1)":
								if (yUp)
									channel.type = [sY];
								else
									channel.type = [sZ];
								break;
							case "scaleZ":
							case "transform(2)(2)":
								if (yUp)
									channel.type = [sZ];
								else
									channel.type = [sY];
								break;
							case "translate":
							case "translation":
								if (yUp) {
									channel.type = ["x", "y", "z"];
									for each (param in channel.param) {
										param[0] *= -scaling;
										param[1] *= -scaling;
										param[2] *= scaling;
									}
								} else {
									channel.type = ["x", "z", "y"];
									for each (param in channel.param) {
										param[0] *= scaling;
										param[1] *= -scaling;
										param[2] *= scaling;
									}
								}
								break;
							case "scale":
								if (yUp)
									channel.type = [sX, sY, sZ];
								else
									channel.type = [sX, sZ, sY];
								break;
							case "rotate":
								if (yUp)
									channel.type = [rX, rY, rZ];
								else
									channel.type = [rX, rZ, rY];
								
								for each (param in channel.param)
								param[0] *= -1;
								break;
							case "transform":
								channel.type = ["transform"];
								break;
							
							case "visibility":
								channel.type = ["visibility"];
								break;
						}
					}
						
						animation.start = _animationData.start;
						animation.length = _animationData.end - _animationData.start;
						
						_animationData.animation = animation;
						break;
					case AnimationData.VERTEX_ANIMATION:
						break;
				}
			}
		}
	}
}