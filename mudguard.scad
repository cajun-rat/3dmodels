

/* TODO

spacing
rackdia (plus thickness of inner tube for grip)
circlip width
racktaper


*/

module mudguard(spacing=100, thickness=15, rackdia=10) {
	clipwidth = 1.5; // Width of the hooks that hold the mudguard in
	circlip = 10; // Width of the hose clip that holds to bracket to the rack

	racktaper = asin(10/400); // angle of the legs of the rack. TODO

	difference() {
		translate([0,-spacing/2 - rackdia, 0]) cube([thickness,spacing + 2*rackdia,35]);
		translate ([0,0,4]) intersection() {
			translate([-20,0,-0.5]) rotate([0,90,0]) cylinder(r=18, h=50);
			translate([-20,-50,0]) cube([100,100,100]);
		}
		
		
		translate([-20,-18+clipwidth,-1]) cube([50, 36 - 2*clipwidth, 6]);


		rotate([-racktaper,0,0]) {
		translate([thickness/2, -spacing/2 - rackdia,-10]) cylinder(r=rackdia, h=35+20);

		# translate([-1, -spacing/2 + 5, (35-circlip)/2])
			cube([thickness+2, 5, circlip]);
		}

		rotate([racktaper, 0, 0]) {
		translate([thickness/2, spacing/2 + rackdia,-10]) cylinder(r=rackdia, h=35+20);

		# translate([-1, spacing/2 - 5, (35-circlip)/2])
			cube([thickness+2, 5, circlip]);
		}

	}
}


//rotate([0,-90,0])
mudguard();

