module airfoil(height=8) {
	linear_extrude(height = 30) import("ag03-il.dxf", center=true);
}


hull() {
	for (i = [0: 0.1 : 0.99]) {
		translate([55/2 -sqrt(1 - i*i) * 55/2, 0, i * 75]) {
			scale ( sqrt(1 - i*i) * 0.55) {
				linear_extrude(height = 1) import("ag03-il.dxf");
			}
		}
	}
}


module example001()
{
	function r_from_dia(d) = d / 2;

	module rotcy(rot, r, h) {
		rotate(90, rot)
			cylinder(r = r, h = h, center = true);
	}

	difference() {
		sphere(r = r_from_dia(size));
		rotcy([0, 0, 0], cy_r, cy_h);
		rotcy([1, 0, 0], cy_r, cy_h);
		rotcy([0, 1, 0], cy_r, cy_h);
	}

	size = 50;
	hole = 25;

	cy_r = r_from_dia(hole);
	cy_h = r_from_dia(size * 2.5);
}

//example001();
