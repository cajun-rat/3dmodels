
// TODO: measure size of head
module drillhole(hole=6.3, 
		head=9, adjust=6) {

	translate([-adjust/2,0,-20]) {
		cylinder(h=30, r=hole/2);
		cylinder(h=20, r=head/2);
	}
	translate([adjust/2,0,-20]) { 
		cylinder(h=30, r=hole/2);
		cylinder(h=20, r=head/2);
	}
	translate([-adjust/2,-hole/2, -20])
		cube([adjust,hole,30]);

	translate([-adjust/2,-head/2, -20])
		cube([adjust,head,20]);
}


module catch(
	width=30,
 	length=60,
	springh=2,
	fillet=10,
	slotw=20) {


	translate([0, -width/2,0])
	difference() {
		cube([length, width, 20]);
		translate([6, -1, springh+fillet])
		cube([length, width+2, 20]);
		translate([6 + fillet, -1, springh])
		cube([length, width+2, 20]);

		// fillet
		translate([fillet+6,width+1,fillet+springh])	
		rotate([90,0,0])
		cylinder(r=10, h=width+2);

		// Drill hole
		translate([1.50, width/2,10])
		rotate([0,-90, 0])
		drillhole(adjust=5);
		

		// slot
		translate([15+slotw/2, (width-slotw)/2, -1])
		cube([length-22-slotw, slotw, 20]); 

		translate([15+slotw/2, width/2, -1])
		cylinder(r=slotw/2, h=20);
		translate([length-7-slotw/2, width/2, -1])
		cylinder(r=slotw/2, h=20);
	
		// chamfer

		translate([length-springh*1.4,-1,0])
		rotate([0,45,0])
		cube([20, width+2, 20]) ;
	}



}

// z0 is the top of the screwhead
module countersink(clearance=3, 
		head=6) {
	translate([0,0,-10])
	cylinder(r=clearance/2, h=20);
	cylinder(r=head/2,h=10);
	translate([0,0,clearance-head])
	cylinder(r1=clearance/2, r2=head/2,head-clearance);

}

module hook(width=15, 
		height=5, 
		length=15) {

	difference() {
		union() {
			cylinder(r1=width/2-1, r2=width/2, height);
			translate([0, -3.5,0])
			cube([30,7,height]);
		}
		countersink();

		// chamfer on ramp
		translate([5,-10,10])
		rotate([0,45,0])
		cube([30,20,20]);
	}
}

catch();
translate([30,30,0])
hook();
