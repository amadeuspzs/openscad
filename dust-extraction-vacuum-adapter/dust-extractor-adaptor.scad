$fn = 40;
// width are outer diameters
base_width = 100;
base_depth = 20;
mid_depth = 30;
end_depth = 20;
end_width = 31;
shell_width = 1;

difference() {
    cylinder(base_depth,base_width/2,base_width/2);
    cylinder(base_depth,(base_width/2)-shell_width,(base_width/2)-shell_width);
}
difference() {
    translate([0,0,base_depth]) cylinder(mid_depth,(base_width/2),(end_width/2));
    translate([0,0,base_depth]) cylinder(mid_depth,(base_width/2)-shell_width,(end_width/2)-shell_width);
}

difference() {
    translate([0,0,base_depth+mid_depth]) cylinder(end_depth,end_width/2,end_width/2);
    translate([0,0,base_depth+mid_depth]) cylinder(end_depth,(end_width/2)-shell_width,(end_width/2)-shell_width);
}