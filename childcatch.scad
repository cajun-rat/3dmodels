
// TODO: measure size of head
module drillhole(hole=6.3, 
		head=9, adjust=6) {

	translate([-adjust/2,0,-10]) {
		cylinder(h=20, r=hole/2);
		cylinder(h=10, r=head/2);
	}
	translate([adjust/2,0,-10]) { 
		cylinder(h=20, r=hole/2);
		cylinder(h=10, r=head/2);
	}
	translate([-adjust/2,-hole/2, -10])
		cube([adjust,hole,20]);

	translate([-adjust/2,-head/2, -10])
		cube([adjust,head,10]);
}


module catch(width=30,
	height=18,
	prongw=8,
	prongh=3,
	prongl=40, 
	fillet=10) {


	difference() {
		translate([(16+prongl+6),-width/2,0])	
		rotate([90,0,180]) 
		linear_extrude(height=width) polygon([
			[0,0],
			[16,16],
			[16,prongh],
			[16+prongl-10,prongh],
			[16+prongl,prongh+10],
			[16+prongl,height],
			[16+prongl+6, height],
			[16+prongl+6,0],
			[0,0]
		]);
	
		// Centre gap
		translate([6,-6, -5])
		cube([prongl,12,height+10]);
	
		// Drill hole
		translate([2,0,height/2]) rotate([0,-90,0]) drillhole();
	translate([fillet+6,width/2+1,fillet+prongh])	
	rotate([90,0,0])
	cylinder(r=10, h=width+2);


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

module hook(width=25, 
		height=6, 
		length=15) {

	difference() {
		translate([-width/2,0,0])
		rotate([90,0,90])
		linear_extrude(height=width) {
		polygon([
			[0,0],
			[length,0],
			[length-height,height],
			[0, height],
			[0,0]
		]);
		}
		translate([-width/2+4, (length-height)/2,height-1])
		countersink();

		translate([width/2-4, (length-height)/2,height-1])
		countersink();


	}
}

catch();
//drillhole();

translate([30,30,0])
hook();
//countersink();