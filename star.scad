

module nailhole(pos, height=8) {
	color("Blue", 0.5) 
	translate(pos) {
		translate ([0, 0, -5]) cylinder(h=height+10, r=1.6/2, $fn=12);
		translate ([0, 0, height-0.7]) cylinder(h=3, r=3.6/2, $fn=20);
	}
}

module star1(height=3) {
	linear_extrude(height = height) import("star1.dxf", center=true);
}


module star2(height=3) {
	linear_extrude(height = height) import("star2.dxf", center=true);
}


star1(3);

translate([0,60,0]) star2(3);
