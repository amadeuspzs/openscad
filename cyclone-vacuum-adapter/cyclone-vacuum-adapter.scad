$fn = 100; // set to 100 to print

// this model facilitates the connection of a vacuum hose into a Rutland's Cyclone Dust Collector with 30L Drum: https://www.rutlands.com/products/cyclone-dust-collector-with-30l-drum

// inner diameter width of cyclone in mm
cyclone_id = 48;

// outer diameter of lip of adapter in mm
lip_od = 52;
// thickness of lip (height) in mm
lip_thickness = 1;

// outer diameter of vacuum hose
vacuum_od = 35;

// depth of adapter in mm, exclusive of lip
depth = 10;

// render base
difference() {
    cylinder(depth,cyclone_id/2,cyclone_id/2); //h,r1,r2
    cylinder(depth,vacuum_od/2,vacuum_od/2);
}

// render lip
translate([0,0,-lip_thickness])
    difference() {
        cylinder(lip_thickness, lip_od/2, lip_od/2);
        cylinder(depth,vacuum_od/2,vacuum_od/2);
    }