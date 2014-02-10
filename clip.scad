

module clip(rod=8, h=9, t=3, in=1) {
	id = rod+1;
	l = id+4+4;
	id2 = id-in;
	difference() {
		union() {
			translate([0,-id/2-t,0])
			cube([l, id+2*t, h]);
			cylinder(r=t+id/2, h=h);
		}
		translate([0,0,-1]) {
			#cylinder(r=id/2, h=h+2);
			translate([0, -id2/2, 0])
			cube([l+1, id2, h+2]);
		}
		translate([id, -15, h/2-2])
		#cube([4,30, 4]);
	}
}

clip();