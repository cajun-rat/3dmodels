// Drill depth gauge collet
// default sizes are for a M8 nut
module collet(
	drilldia=5,
	min=6.8,
	max=9,
	slot=0.5) {


	difference() {
		union() {
			cylinder(r=max/2, h=10);
			translate([0,0,10])
				cylinder(r1=max/2, r2=min/2, h=15);
			translate([0,0,20])
				cylinder(r=min/2,h=5);
		}

		translate([-10,-slot/2,8])
			cube([20,slot,20]);

		translate([-slot/2,-10,8])
			cube([slot,20,20]);

		translate([0,0,-5])
			cylinder(r=drilldia/2, h=40);
	}
}


collet();

