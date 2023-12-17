/*
 * Sechzig Case
 * Copyright (c) 2023 Lone Dynamics Corporation. All rights reserved.
 *
 * required hardware:
 *  - 2 x M3 x 16MM countersunk bolts
 *  - 2 x M3 nuts
 *
 */

$fn = 100;

board_depth = 1.6;
board_height = 40;

//translate([0,-2.5,6]) sechzig_module();
//rotate([180,0,180]) translate([0,0,-12]) sechzig_front();
sechzig_back();

module sechzig_module() {
	difference() {
		//color([0,1,0]) cube([79,50,8], center=true);
		color([0,1,0]) cube([79,board_height,8], center=true);
		translate([79/2,-50/2+15,-10]) cylinder(d=3, h=50);
		translate([-79/2,-50/2+15,-10]) cylinder(d=3, h=50);
	}
}

module sechzig_front() {
	
	//	color([0,1,0]) translate([0,0,6]) cube([80,53,board_depth], center=true);
	
	difference() {

		union() {
			translate([-95/2,-60/2+1.5,0]) roundedcube(95,board_height+10,6-(board_depth/2),2.5);
			translate([0,0,1.6]) cube([95+2,10,6-(board_depth/2)+2], center=true);
		}
				
		// module component cutout
		translate([0,0,6-(board_depth/2)]) cube([78,board_height+0.5,8.4], center=true);
		
		// bottom opening
		translate([0,-55/2+3.5,6]) cube([93,9.5,12-2], center=true);
	
		// vents
		translate([-5,12,0]) rotate([0,0,15]) cube([1,8,8], center=true);
		translate([0,12,0]) rotate([0,0,15]) cube([1,8,8], center=true);
		translate([5,12,0]) rotate([0,0,15]) cube([1,8,8], center=true);
		
		// bolt holes
		translate([-43.5,0,-2]) cylinder(d=3.2, h=100);
		translate([43.5,0,-2]) cylinder(d=3.2, h=100);
		
		// bolt countersink holes
		translate([-43.5,0,-2]) cylinder(d=6, h=1);
		translate([43.5,0,-2]) cylinder(d=6, h=1);
	
		rotate([0,180,0])
			translate([0,-2,1.5])
				linear_extrude(1)
					text("S E C H Z I G  M L 1", size=4, halign="center",
						font="Liberation Sans:style=Bold");

	}
		
}

module sechzig_back() {
		
//	color([0,1,0]) translate([0,0,6]) cube([80,53,board_depth], center=true);
	
	difference() {
		union() {
			translate([-95/2,-60/2+1.5,0]) roundedcube(95,board_height+10,6+(board_depth/2),2.5);
			translate([0,0,2.4]) cube([95+2,10,6+(board_depth/2)+2], center=true);
			
			// guide notches
			translate([20,-3.5,-1])
				cube([9.5,board_height+10,2], center=true);
				
			translate([-20,-3.5,-1])
				cube([9.5,board_height+10,2], center=true);

		}
		
		// module board cutout
		translate([0,0,6]) cube([79+0.5,board_height+0.5,board_depth], center=true);		

		// board notch adjacent cutouts
		translate([79/2-0.75,-55/2+15-2,3.8]) cube([2,2,5.6], center=true);
		translate([79/2-0.75,-55/2+15+2,3.8]) cube([2,2,5.6], center=true);
		translate([-79/2+0.75,-55/2+15-2,3.8]) cube([2,2,5.6], center=true);
		translate([-79/2+0.75,-55/2+15+2,3.8]) cube([2,2,5.6], center=true);
		
		
		// module component cutout
		translate([0,0,6]) cube([78,board_height+0.5,12-2], center=true);
		
		// bottom opening
		translate([0,-55/2+3.5,6]) cube([93,9.5,12-2], center=true);
		
		// vents
		translate([-5,12,0]) rotate([0,0,15]) cube([1,8,8], center=true);
		translate([0,12,0]) rotate([0,0,15]) cube([1,8,8], center=true);
		translate([5,12,0]) rotate([0,0,15]) cube([1,8,8], center=true);

		// bolt holes
		translate([-43.5,0,-2]) cylinder(d=3.2, h=100);
		translate([43.5,0,-2]) cylinder(d=3.2, h=100);
		
		// nut holes
		translate([-43.5,0,-2.5]) rotate([0,0,30]) cylinder(d=7, h=2.5, $fn=6);
		translate([43.5,0,-2.5]) rotate([0,0,30]) cylinder(d=7, h=2.5, $fn=6);
	
		rotate([0,180,0])
			translate([0,-2,1.5])
				linear_extrude(1)
					text("M L 1", size=4, halign="center",
						font="Liberation Sans:style=Bold");

	}

	// board notches
	translate([79/2+0.25,-55/2+15,3.8]) cylinder(d=2.75, h=6, center=true);
	translate([-79/2-0.25,-55/2+15,3.8]) cylinder(d=2.75, h=6, center=true);

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
