package cfm.core.away.utils
{
	import away3dlite.containers.ObjectContainer3D;
	import away3dlite.core.base.Mesh;
	import away3dlite.core.base.Object3D;
	
	import flash.display.DisplayObject;
	import flash.geom.Matrix3D;
	import flash.geom.Vector3D;
	import flash.utils.getQualifiedClassName;
	
	public class AABBCalculator {
		static private var _instance:AABBCalculator;
		static public function get instance():AABBCalculator {
			if(_instance == null) _instance = new AABBCalculator();
			return _instance;
		}
		
		private var aabb:AABB;
		private var collectAABB:Function;
		private var transformAABB:Function;
		
		public var showTrace:Boolean = false;
		
	    public function getAABBFromMesh(mesh:Mesh, ...exclude):AABB {
			var className:String = getQualifiedClassName(mesh);
			var vertices:Vector.<Number>;
			mesh = mesh.clone() as Mesh;
			var name:String;
			var obj:DisplayObject;
			
			for each( name in exclude) {
				obj = mesh.getChildByName(name);
				if(obj) obj.visible = false;
			}
			if (className == "away3dlite.containers::ObjectContainer3D") {
				var container:ObjectContainer3D = mesh as ObjectContainer3D;
				
				var children:Array = (mesh as ObjectContainer3D).children;
				var meshes:Array = children.filter (
						function(obj:*, index:int, array:Array):Boolean {
							return (getQualifiedClassName(obj) == "away3dlite.core.base::Mesh" && obj.visible);
						}
					);
				
				vertices = new Vector.<Number>;
				
				for each ( var m:Mesh in meshes) {
					trace("AABBCalculator::getAABBFromMesh = " + mesh.name + ", [x = " + mesh.x + ", y = " + mesh.y + ", z = " + mesh.z + "]");
					vertices = vertices.concat(m.vertices);
				}
				
			} else if (className == "away3dlite.core.base::Mesh"){
				vertices = mesh.vertices.concat();
			}
			
			for each( name in exclude) {
				obj = mesh.getChildByName(name);
				if(obj) obj.visible = true;
			}
			
			return (vertices == null)? new AABB(): calculateAABB(vertices, mesh.transform.matrix3D);
		}
		
		public function getUnionOf(aMesh:Mesh, ...exclude:Array):AABB {
			var aabb:AABB = new AABB();
			
			collectAABB = function(_aabb:AABB):void { aabb.union(_aabb); };
			transformAABB = function(_transform:Matrix3D):void { aabb.applyTransform(_transform); };
			
			traverseObjectGraph(aMesh, exclude);
			
			return aabb;
		}
		
		public function getSetOf(aMesh:Mesh, ...exclude:Array):Vector.<AABB> {
			var aabbs:Vector.<AABB> = new Vector.<AABB>();
			
			collectAABB = function(_aabb:AABB):void { aabbs.push(_aabb); };
			transformAABB = function(_transform:Matrix3D):void {
					for each( var aabb:AABB in aabbs) {
						aabb.applyTransform(_transform);
					}
				};
			
			traverseObjectGraph(aMesh, exclude);
			
			return aabbs;
		}
				
		private function traverseObjectGraph(root:Mesh, ...exclude:Array):void {
			var children:Array;
			var childMesh:Mesh;
			
			var stack:Array = [];
			var className:String = getQualifiedClassName(root);
			var mesh:Mesh = root as Mesh;
			var parentTransform:Matrix3D;
			var name:String;
			var child:DisplayObject;
			
			for each ( name in exclude) {
				child = mesh.getChildByName(name);
				if(child) child.visible = false;
			} 
			
			var str:String = "::::::AABB OBJECT GRAPH TRACE:::::\n";
			var level:String = "\t";
			var i:int;
			str += "ENTER ROOT"
			if ( className == "away3dlite.containers::ObjectContainer3D" && mesh.visible) {
				str += " [CONTAINER]\n";
				children = (mesh as ObjectContainer3D).children;
				parentTransform = mesh.transform.matrix3D;
				
				for( i = 0; i < children.length; i++) {
					childMesh = children[i] as Mesh; 
					className = getQualifiedClassName(childMesh);
					
					// leaf node operation
					if ( className == "away3dlite.core.base::Mesh" && childMesh.visible ) {
						collectAABB(calculateAABB(childMesh.vertices));
						str += level + "PROCESS MESH\n";
					}
					
					// save parent node and traverse children
					if ((className == "away3dlite.containers::ObjectContainer3D") && childMesh.visible) {
						stack.push({array:children, index:i, parentTransform:parentTransform, level:level});
						children = (childMesh as ObjectContainer3D).children;
						parentTransform = childMesh.transform.matrix3D;
						i = -1;
						str += level + "ENTER CONTAINER\n";
						level += "\t";
						
						var inverted:Matrix3D = childMesh.transform.matrix3D.clone();
						inverted.invert();
						transformAABB(inverted);
					} 
					
					// merge children and restore parent 
					while ((i == children.length - 1) && (stack.length > 0)){
						transformAABB(parentTransform);
						var obj:Object = stack.pop() as Object;
						level = obj.level;
						str += level + "LEAVE CONTAINER index=" + i + ", length=" + children.length + " \n";
						children = obj.array as Array;
						parentTransform = obj.parentTransform as Matrix3D;
						i = obj.index;
						//str += level + "LEAVE CONTAINER index=" + i + ", length=" + children.length + " \n";
					}
				}
				
				transformAABB(parentTransform);
				
			} else if (className == "away3dlite.core.base::Mesh" && mesh.visible) {
				
				collectAABB(calculateAABB(childMesh.vertices));
				str += " [MESH]\n";
				
			}
			str += "LEAVE ROOT\n";
			if(showTrace) {
				trace(str);
				showTrace = false;
			}
			
			for each ( name in exclude) {
				child = mesh.getChildByName(name);
				if(child) child.visible = true;
			} 
		}
		
		/**
		 * Calculates the Axis-Aligned Bounding Box of a given set of vertices
		 * 
		 * @param vertices 			A Vector of Numbers, with every three values in sequence representing a vertex tuple (x,y,z).
		 * @param transformMatrix 	Transform matrix to apply to vertices so that they match the object's current transform state.
		 * 
		 * @returns 		An AABB object.
		 */
		public function calculateAABB(vertices:Vector.<Number>, transformMatrix:Matrix3D = null):AABB {
			var minX:Number = Infinity;
			var minY:Number = Infinity;
			var minZ:Number = Infinity;
			
			var maxX:Number = -Infinity;
			var maxY:Number = -Infinity;
			var maxZ:Number = -Infinity;
			
			for ( var i:int = 0; i < vertices. length; i += 3 ) {
				minX = (vertices[i] < minX) ? vertices[i] : minX;
				maxX = (vertices[i] > maxX) ? vertices[i] : maxX;
				
				minY = (vertices[i + 1] < minY) ? vertices[i + 1] : minY;
				maxY = (vertices[i + 1] > maxY) ? vertices[i + 1] : maxY;
				
				minZ = (vertices[i + 2] < minZ) ? vertices[i + 2] : minZ;
				maxZ = (vertices[i + 2] > maxZ) ? vertices[i + 2] : maxZ;
			}
			
			var minVertex:Vector3D = (transformMatrix)?transformMatrix.transformVector(new Vector3D(minX, minY, minZ)):new Vector3D(minX, minY, minZ);
			var maxVertex:Vector3D = (transformMatrix)?transformMatrix.transformVector(new Vector3D(maxX, maxY, maxZ)):new Vector3D(maxX, maxY, maxZ);
			
			return new AABB(minVertex, maxVertex);
		}
		
		
	}
}