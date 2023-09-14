$fn = 85;

// todo notch showing position: use sharpie

// central column
centre_height = 27;
centre_diameter = 8;
r = 3; // radius of circle for pot
d = 1.5; // distance from centre to chord
c = 2*sqrt(r^2 - d^2); // chord length

// outer circle/knob
knob_height = 23;
knob_outer_diameter = 39.5;
knob_inner_diameter = 35.5;
knob_base_thickness = 2;
support_thickness = 2;
support_height = 17;

// outer circle
difference () {
    cylinder(d=knob_outer_diameter,h=knob_height);
    translate([0, 0, knob_base_thickness]) 
    cylinder(d=knob_inner_diameter,h=knob_height);
}

// centre piece
difference () {
    union() {
        cylinder(d=centre_diameter,h=centre_height);
        // supports
        translate([0, 0, knob_height/2]) rotate([90, 0, 0]) cube([knob_outer_diameter, support_height, support_thickness], center=true);
        translate([0, 0, knob_height/2]) rotate([90, 0, 90]) cube([knob_outer_diameter, support_height, support_thickness], center=true);
    }
    
    linear_extrude(height=centre_height)
    difference() {
        circle(r);
        translate([-c/2, d, 0]) square([c, d], center = false);
    }
}