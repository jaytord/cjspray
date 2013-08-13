package cfm.core.away.utils {
	import flash.geom.Matrix3D;
	import flash.geom.Vector3D;
	
   /**
    * Axis-Aligned Bounding Box. 
	* Assumes left-handed co-ordinate system; +ve y-axis points up, 
	* +ve x-axis points right and +ve z points in the direction 
	* away from the viewer. 
	*/
	public class AABB{
		private var min:Vector3D;
		private var max:Vector3D;
		
		public function AABB(_min:Vector3D = null, _max:Vector3D = null) {
			min = _min || new Vector3D();
			max = _max || new Vector3D();
		}
		
		public function get minX():Number { return min.x; }
		
		public function get minY():Number { return min.y; }
		
		public function get minZ():Number { return min.z; }
		
		public function get maxX():Number { return max.x; }
		
		public function get maxY():Number { return max.y; }
		
		public function get maxZ():Number { return max.z; }
		
		public function get minVertex():Vector3D { return min.clone(); }
		
		public function get maxVertex():Vector3D { return max.clone(); }
		
		public function get width():Number { return Math.abs(maxX - minX); }
		
		public function get height():Number { return Math.abs(maxY - minY);}
		
		public function get depth():Number { return Math.abs(maxZ - minZ); }
		
		public function clone():AABB { return new AABB(min, max); }
		
		public function union(aabb:AABB):void {
			min = new Vector3D(
				(minX < aabb.minX)?minX:aabb.minX,
				(minY < aabb.minY)?minY:aabb.minY,
				(minZ < aabb.minZ)?minZ:aabb.minZ,
				0.0
			);
			
			max = new Vector3D(
				(maxX > aabb.maxX)?maxX:aabb.maxX,
				(maxY > aabb.maxY)?maxY:aabb.maxY,
				(maxZ > aabb.maxZ)?maxZ:aabb.maxZ,
				0.0
			);
		}
		
		public function applyTransform(transformMatrix:Matrix3D):void {
			min = transformMatrix.transformVector(min);
			max = transformMatrix.transformVector(max);
		}
		
		public function toString():String { return "[width="+width+", height="+height+", depth="+depth+", minX="+minX+", maxX="+maxX+", minY="+minY+", maxY="+maxY+", minZ="+minZ+", maxZ="+maxZ+"]"; }
	}
}