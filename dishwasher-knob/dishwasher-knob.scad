$fn = 85;

// to check - thickness of end
// to check - thickness of outer circle (nb. (diam1-diam2) / 2)
// todo notch showing position

// centre piece calculations
r = 3; // radius of circle
d = 1.5; // distance from centre to chord
c = 2*sqrt(r^2 - d^2); // chord length

// outer circle
difference () {
    cylinder(d=39.5,h=21);
    translate([0, 0, 2]) cylinder(d=37.5,h=21);
}

// centre piece
difference () {
    union() {
        cylinder(d=8,h=27);
        // supports
        translate([0, 0, 21/2]) rotate([90, 0, 0]) cube([37.5, 17, 2], center=true);
        translate([0, 0, 21/2]) rotate([90, 0, 90]) cube([37.5, 17, 2], center=true);
    }
    
    linear_extrude(height=27)
    difference() {
        circle(r);
        translate([-c/2, d, 0]) square([c, d], center = false);
    }
}