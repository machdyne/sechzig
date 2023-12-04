/*
 * Sechzig Case
 * Copyright (c) 2023 Lone Dynamics Corporation. All rights reserved.
 *
 * required hardware:
 *  - 2 x M2.5 x 12MM bolts
 *  - 2 x M2.5 nuts
 *
 */

$fn = 36;

board_depth = 1.5;
board_height = 40;

// cart is 95 x 60 x 12
// bottom opening has to be: 9.2 x 92.7

//translate([0,-2.5,6]) sechzig_module();
rotate([180,0,180]) translate([0,0,-12]) sechzig_front();
//sechzig_back();

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
		
		translate([-95/2,-60/2+1.5,0]) roundedcube(95,board_height+10,6,2.5);
		
		// module board cutout
		translate([0,0,6]) cube([79+0.5,board_height+0.5,board_depth], center=true);		
		
		// module component cutout
		translate([0,0,6]) cube([78,board_height+0.5,12-2], center=true);
		
		// bottom opening
		translate([0,-55/2+3.5,6]) cube([93,9.5,12-2], center=true);
		
		// bolt holes
		translate([-43.5,0,0]) cylinder(d=2.7, h=100);
		translate([43.5,0,0]) cylinder(d=2.7, h=100);
		
		// bolt countersink holes
		translate([-43.5,0,0]) cylinder(d=5, h=1);
		translate([43.5,0,0]) cylinder(d=5, h=1);
	
		rotate([0,180,0])
			translate([0,-2,-0.5])
				linear_extrude(1)
					text("S E C H Z I G  M L 1", size=4, halign="center",
						font="Liberation Sans:style=Bold");

	}

	// board notches
	translate([79/2+0.25,-55/2+15,6/2]) cylinder(d=2.75, h=6, center=true);
	translate([-79/2-0.25,-55/2+15,6/2]) cylinder(d=2.75, h=6, center=true);
		
}

module sechzig_back() {
		
//	color([0,1,0]) translate([0,0,6]) cube([80,53,board_depth], center=true);
	
	difference() {
		union() {
			translate([-95/2,-60/2+1.5,0]) roundedcube(95,board_height+10,6,2.5);
			
			//translate([-20,1.5,-1])
			translate([20,-3.5,-1])
				cube([9.5,board_height+10,2], center=true);
				
			//translate([-20,1.5,-1])
			translate([-20,-3.5,-1])
				cube([9.5,board_height+10,2], center=true);

		}
		
		// module board cutout
		translate([0,0,6]) cube([79+0.5,board_height+0.5,board_depth], center=true);		
		
		// module component cutout
		translate([0,0,6]) cube([78,board_height+0.5,12-2], center=true);
		
		// bottom opening
		translate([0,-55/2+3.5,6]) cube([93,9.5,12-2], center=true);
		
		// bolt holes
		translate([-43.5,0,0]) cylinder(d=2.7, h=100);
		translate([43.5,0,0]) cylinder(d=2.7, h=100);
		
		// nut holes
		translate([-43.5,0,0]) cylinder(d=6, h=2.5, $fn=6);
		translate([43.5,0,0]) cylinder(d=6, h=2.5, $fn=6);
	
	}

	// board notches
	translate([79/2+0.25,-55/2+15,6/2]) cylinder(d=2.75, h=6, center=true);
	translate([-79/2-0.25,-55/2+15,6/2]) cylinder(d=2.75, h=6, center=true);

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
