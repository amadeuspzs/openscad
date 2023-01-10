$fn = 40;

// od = outer diameter
// id = inner diameter

shell_width = 3;

base_height = 30;
mid_height = 30;
end_height = 20;

/*
design of adaptor is that base attaches OUTSIDE exhaust pipe of tool, so define inner diameter to match outer diameter of exhaust pipe.
end of adaptor attaches INSIDE vacuum hose so that all matter is extracted. define outer diameter to match outer diameter of vacuum hose.
alter as you need.
*/

base_id = 105; // match with outer diameter of exhaust pipe so it fits over 
base_od = base_id + shell_width;
end_od = 35; // match with inner diameter of vacuum pipe so it fits inside
end_id = end_od - shell_width;

// render base
difference() {
    cylinder(base_height,base_od/2,base_od/2); //h,r1,r2
    cylinder(base_height,(base_id/2),(base_id/2));
}

// render taper from base to end
difference() {
    translate([0,0,base_height]) cylinder(mid_height,(base_od/2),(end_od/2));
    translate([0,0,base_height]) cylinder(mid_height,(base_id/2),(end_id/2));
}

// render end
 difference() {
     translate([0,0,base_height+mid_height]) cylinder(end_height,end_od/2,end_od/2);
     translate([0,0,base_height+mid_height]) cylinder(end_height,(end_id/2),(end_id/2));
 }