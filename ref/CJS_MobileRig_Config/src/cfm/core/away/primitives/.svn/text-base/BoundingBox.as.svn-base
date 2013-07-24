package cfm.core.away.primitives {
	import away3dlite.arcane;
	import away3dlite.materials.ColorMaterial;
	import away3dlite.primitives.AbstractPrimitive;
	
	import flash.geom.Vector3D;
	
	use namespace arcane;
	
	public class BoundingBox extends AbstractPrimitive {
		protected var vtmp:Vector.<Number> = new Vector.<Number>();
		protected var indicesCounter:int=0;
		protected var min:Vector3D;
		protected var max:Vector3D;
		
		public function BoundingBox(min:Vector3D, max:Vector3D, color:* = "random", colorAlpha:Number = 1) {
			super (new ColorMaterial( color, colorAlpha));
			this.min = min;
			this.max = max;
		}
		
		protected override function buildPrimitive():void {
			super.buildPrimitive();
			
			v(max.x, max.y, min.z);
			v(max.x, min.y, min.z);
			v(min.x, min.y, min.z);
			v(min.x, max.y, min.z);
			v(max.x, max.y, max.z);
			v(max.x, min.y, max.z);
			v(min.x, min.y, max.z);
			v(min.x, max.y, max.z); 
			
			// back tris
			f(4,0,3,0.332,0.335,0.332,0.666,0.002,0.666);
			f(4,3,7,0.666,0.002,0.335,0.332,0.666,0.332);
			
			// left tris	
			f(2,6,7,0.332,0.002,0.332,0.332,0.002,0.332);
			f(2,7,3,0.999,0.669,0.669,0.999,0.999,0.999);
			
			// front tris
			f(1,5,2,0.999,0.666,0.669,0.666,0.999,0.335);
			f(5,6,2,0.998,0.668,0.668,0.668,0.668,0.998);
			
			// right tris
			f(0,4,1,0.666,0.666,0.666,0.335,0.335,0.666);
			f(4,5,1,0.668,0.665,0.668,0.334,0.998,0.334);
			
			// top tris
			f(4,7,5,0.334,0.001,0.334,0.331,0.665,0.001);
			f(7,6,5,0.331,0.334,0.001,0.334,0.001,0.665);
			
			// bottom tris
			f(0,1,2,0.665,0.334,0.334,0.334,0.334,0.665);
			f(0,2,3,0.331,0.001,0.001,0.331,0.001,0.001);
			
			x = 0.000; y = 0.000; z = 0.000;
			
			rotationX = 0.000; rotationY = 0.000; rotationZ = 0.000;
			
			scaleX = 1.000; scaleY = 1.000; scaleZ = 1.000;
		}
		
		public function v(x:Number, y:Number, z:Number):void {
			vtmp.push(x, y, z);
		}
		
		public function f(vertexIndex1:int, vertexIndex2:int, vertexIndex3:int, uv00:Number, uv01:Number, uv10:Number, uv11:Number, uv20:Number, uv21:Number ):void {
			var vi1:int=vertexIndex1*3;
			var vi2:int=vertexIndex2*3;
			var vi3:int=vertexIndex3*3;
			_vertices.push(vtmp[vi1],vtmp[vi1+1],vtmp[vi1+2]);
			_vertices.push(vtmp[vi2],vtmp[vi2+1],vtmp[vi2+2]);
			_vertices.push(vtmp[vi3],vtmp[vi3+1],vtmp[vi3+2]);
			_uvtData.push(uv00,uv01,1,uv10,uv11,1,uv20,uv21,1);
			_indices.push(indicesCounter++,indicesCounter++,indicesCounter++);
			_faceLengths.push( 3 );
		}
	}
}