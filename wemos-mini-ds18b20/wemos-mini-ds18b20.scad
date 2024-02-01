$fn = 100;

/*

This case is designed for a Wemos D1 Mini clone with a DS18B20 shield.

Original items:

* Wemos D1 Mini clone: https://www.ebay.co.uk/itm/363891216533
* DS18B20 shield: https://www.ebay.co.uk/itm/313603433601

*/

pcb_length = 34.5;
pcb_width = 25.8;
pcb_height = 7; //17.1; // height from bottom of USB socket to top board, excluding sensor poking out top

usb_socket_width = 9;
usb_socket_height = 2;

pcn_lip_height = usb_socket_height;
pcb_lip_depth = 4;

sensor_diameter = 5;
case_wall_thickness = 2;

reset_hole_diameter = 3;
reset_hole_offset = 1.5; // distance from edge
// Build crude case

module crude_case() {
    difference() {
        cube([pcb_width + (2*case_wall_thickness), pcb_length + (2*case_wall_thickness), pcb_height + (case_wall_thickness)], center=true);
        translate([0,0,case_wall_thickness/2])
        cube([pcb_width, pcb_length, pcb_height], center=true);
    }
}

// usb hole
module usb_hole() {
    translate([2, (pcb_length + case_wall_thickness)/2, -(pcb_height/2) + case_wall_thickness]) cube([usb_socket_width, case_wall_thickness, usb_socket_height], center = true);
}

// reset hole

module reset_hole() {
    translate([((pcb_width+case_wall_thickness)/2), pcb_length/2 - case_wall_thickness/2 - reset_hole_offset/2,-(pcb_height/2) + case_wall_thickness/2 + reset_hole_diameter/2]) rotate([0,90,0]) cylinder(h = case_wall_thickness, d = reset_hole_diameter, center = true);
}

// pcb lip

module pcb_lip() {
    translate([0,-pcb_length/2 + case_wall_thickness,-pcb_height/2 + case_wall_thickness]) cube([pcb_width/2, pcb_lip_depth, pcb_lip_height], center = true);
}

// combine

difference() {
    crude_case();
    usb_hole();
    reset_hole();
}

pcb_lip();
