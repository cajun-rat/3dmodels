
module drillhole(hole=6.3, 
		head=8, adjust=8) {

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


module catch(width=50,
	height=20,
	prongw=8,
	prongh=6,
	prongl=40) {
	
	difference() {
	
	translate([(15+prongl+6),-width/2,0])	
	rotate([90,0,180]) 
	linear_extrude(height=width) polygon([
		[0,0],
		[15,15],
		[15,prongh],
		[15+prongl-5,prongh],
		[15+prongl,prongh+5],
		[15+prongl,height],
		[15+prongl+6, height],
		[15+prongl+6,0],
		[0,0]
	]);
	translate([6,-10-width/2, -5])
	cube([prongl+15+10,(width-prongw)/2+10,height+10]);

	translate([6,prongw/2, -5])
	cube([prongl+15+10,(width-prongw)/2+10,height+10]);
	
		// Drill holes

		translate([2,width/2-10,height/2]) rotate([0,-90,0]) drillhole();
		translate([2,-width/2+10,height/2]) rotate([0,-90,0]) drillhole();
	}
}


catch();
//drillhole();