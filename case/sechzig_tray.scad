/*
 * Sechzig Tray
 * Copyright (c) 2024 Lone Dynamics Corporation. All rights reserved.
 *
 */

$fn = 100;

board_length = 79 + 0.75;
board_thickness = 1.85;
board_width = 8 + 2;

boards = 8;

sechzig_tray();

module sechzig_tray() {
	
	length = board_length + 5;
	width = board_width * boards + 10;
	
	difference() {
		
		translate([-length/2,-width/2,-3/2]) roundedcube(length, width, 10, 5);
		
		for ( i = [0:boards-1] ) {
			translate([0,width/2-5-(i*board_width),13.5-8])
				cube([board_length, board_thickness, 10], center=true);
		}
		
		translate([length/2-20,-width/2+5,7.75])
			linear_extrude(2)
				text("S E C H Z I G", size=4, halign="center",
					font="Lato:style=Bold");

		translate([-length/2+10,-width/2+5,7.75])
			linear_extrude(2)
				text("/ / /", size=4, halign="center",
					font="Lato:style=Bold");
	
		
	}
	
}

// https://gist.github.com/tinkerology/ae257c5340a33ee2f149ff3ae97d9826
module roundedcube(xx, yy, height, radius)
{
    translate([0,0,height/2])
    hull()
    {
        translate([radius,radius,0])
        cylinder(height,radius,radius,true);

        translate([xx-radius,radius,0])
        cylinder(height,radius,radius,true);

        translate([xx-radius,yy-radius,0])
        cylinder(height,radius,radius,true);

        translate([radius,yy-radius,0])
        cylinder(height,radius,radius,true);
    }
}