

module nailhole(pos, height=8) {
	color("Blue", 0.5) 
	translate(pos) {
		translate ([0, 0, -5]) cylinder(h=height+10, r=1.6/2, $fn=12);
		translate ([0, 0, height-0.7]) cylinder(h=3, r=3.6/2, $fn=20);
	}
}

module number(b, height=8) {
	minkowski() {
		linear_extrude(height = height-b) import("20.dxf", center=true);
		polyhedron(
			points=[[b,b,0],[b,-b,0],[-b,-b,0],[-b,b,0],
           [0,0,b]],
			triangles=[ [0,1,4],[1,2,4],[2,3,4],[3,0,4], // each triangle side
              [1,0,3],[2,1,3] ] // two triangles for square base
		);
	}
}

difference() {
	union() {
		number(2);
		/* Sprue to hold the numbers aligned */
		translate([51.6,57.8,0]) cube([20,3,2]);
		translate([51.6, 7.3, 0]) cube([27.4, 3, 2]);
	}
	nailhole([25, 8.7, 0]);
	nailhole([41.5, 71.4, 0]);
	nailhole([76.7, 43.5, 0]);
	nailhole([116.2, 43.5, 0]);
}