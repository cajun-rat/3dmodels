

module peg(thickness=4) {
	difference() {
		translate([0,20,0]) rotate([90,0,0]) linear_extrude(height=20) import("tentpeg.dxf");
		translate([0,-10,thickness]) cube([140,10+(20-thickness)/2, 20-thickness*2]);
		translate([0,(20+thickness)/2,thickness]) cube([140,10+(20-thickness)/2, 20-thickness*2]);
	}
}

peg();