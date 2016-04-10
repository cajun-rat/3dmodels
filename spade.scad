length = 500;

edge_radius = 200;
blade_thickness = 1.5;
blade_width = 100;
blade_length = 100;

handle_diameter = 24;

module blade_surface(text_surface) {
    upper_bs = text_surface
        ? edge_radius+blade_thickness/2  + 0.5
        : edge_radius+blade_thickness/2;
    lower_bs = text_surface
        ? edge_radius
        : edge_radius-blade_thickness/2;
  
    difference() {
        translate([0,0, lower_bs]) {
            rotate([0,90,0]) {
                cylinder(r=edge_radius,h=100, $fa=1);
            }
        }
        translate([-1,0, upper_bs]) {
            rotate([0,90,0]) {
                cylinder(r=edge_radius,h=102, $fa=1);
            }
        }
    }
}

module blade() {
    union() {
        intersection () {
            blade_surface(false);
            translate([0,0,-10]) {
             cylinder(r=blade_length, h=50, $fa=1);
            }
            translate([0, -blade_width/2, -10]) {
                cube([blade_length+10, blade_width, 50]); 
            }
        }
        intersection() {
            blade_surface(true);
            union() {
                translate([10, 30,0]) {
                    linear_extrude(50) {
                        text("Daniel", 10, 40, valign="center");
                    }
                }
                translate([10, -20,0]) {
                    linear_extrude(50) {
                        text("PW'16", 5, 40, "center");
                    }
                }
            }
        }
    }
}

//blade();
//blade_surface(false);

module socket_shape() {
	polygon(points=[
		[-1,-handle_diameter/2],
		[50, 0],
		[50, 0],
		[-1,handle_diameter/2],
       ]);

}

module socket(make_hole) {
	intersection() {
		rotate([0,90,0]) {
			if (make_hole) {
				translate([0,0,-1])
				cylinder(r=handle_diameter/2, h=52);
			} else {
				cylinder(r=handle_diameter/2+1.5, h=51);
			}
		}
   
		translate([0,handle_diameter/2+5,0]) {
			rotate([90,0,0]) {
				linear_extrude(height=handle_diameter+10) {
					if (make_hole) {
						socket_shape();
					} else {
						offset(r=1.5) {
							socket_shape();
						}
					}
				}
			}
		}
	}

	if (make_hole) {
		translate([10,0,-50]) {
			cylinder(r=1.5, h=100, $fs=0.2);
		}
	}
}


module handle() {
	rotate([0,-90,0]) {
		#cylinder(r=handle_diameter/2, h=300);
	}
}

module spade() {
difference() {
	union() {
		socket(false);
		blade();
	}
	socket(true);
}
}

// projection()
spade();
//handle();
