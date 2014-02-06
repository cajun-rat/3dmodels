
module pulley(id=6, thickness=10, d=30) {

	difference() {
		union() {
			cylinder(r=id/2+2, thickness);
			cylinder(r1=d/2, r2=d/2-thickness/4, thickness/2-1);
			translate([0,0,thickness/2-1])
			cylinder(r1=d/2-thickness/4, r2=d/2, thickness/2-1);
		}
		translate([0,0,-1])
		cylinder(r=id/2, thickness+2);
	}
}


pulley();