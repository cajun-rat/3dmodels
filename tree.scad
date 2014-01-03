

module nailhole(pos, height=8) {
	color("Blue", 0.5) 
	translate(pos) {
		translate ([0, 0, -5]) cylinder(h=height+10, r=1.6/2, $fn=12);
		translate ([0, 0, height-0.7]) cylinder(h=3, r=3.6/2, $fn=20);
	}
}

module number(b, height=8) {
	//minkowski() {
		linear_extrude(height = height-b) import("tree.dxf", center=true);
		//polyhedron(
			//points=[[b,b,0],[b,-b,0],[-b,-b,0],[-b,b,0],
           //[0,0,b]],
//			triangles=[ [0,1,4],[1,2,4],[2,3,4],[3,0,4], // each triangle side
  //            [1,0,3],[2,1,3] ] // two triangles for square base
	//	);
	//}
}

number(2);
