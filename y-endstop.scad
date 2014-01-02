
module endstop(length, tablen, width, h)
{
	tabw = 1;
	cube(size=[length, width, 1]);
	translate([0,(width-tabw)/2,0])
		cube(size=[tablen,tabw,h]);
}

endstop(70, 45, 10, 9.5);

