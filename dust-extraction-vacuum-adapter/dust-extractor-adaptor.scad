$fn = 100; // set to 100 to print

// od = outer diameter
// id = inner diameter

shell_thickness = 2.5;

base_height = 25;
mid_height = 25;
end_height = 20;

/*
design of adaptor is that base attaches OUTSIDE exhaust pipe of tool. define inner diameter to match outer diameter of exhaust pipe.
end of adaptor attaches OUTSIDE vacuum hose to maximise flow volume. define inner diameter to match outer diameter of vacuum hose.
alter as you need.
*/

base_id = 100; // match with outer diameter of exhaust pipe so it fits over. you may want to reduce this by 1mm to ensure a snug fit. 
base_od = base_id + 2*shell_thickness;
end_id = 35; // match with outer diameter of vacuum pipe so it fits over. you may want to reduce this by 0.5mm to ensure a snug fit.
end_od = end_id + 2*shell_thickness;

// render base
difference() {
    cylinder(base_height,base_od/2,base_od/2); //h,r1,r2
    cylinder(base_height,(base_id/2),(base_id/2));
}

// strenghthen the central section by adding a little extra
extra_thickness = shell_thickness/2;

// note this is currently thinner due to geometry
difference() {
    translate([0,0,base_height]) cylinder(mid_height,(base_od/2),(end_od/2)+extra_thickness);
    translate([0,0,base_height]) cylinder(mid_height,(base_id/2),(end_id/2));
}

// render end
 difference() {
     translate([0,0,base_height+mid_height]) cylinder(end_height,end_od/2,end_od/2);
     translate([0,0,base_height+mid_height]) cylinder(end_height,(end_id/2),(end_id/2));
 }