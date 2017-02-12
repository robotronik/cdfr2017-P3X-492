use <module-gober-4.scad>
use <support_moving_rail.scad>
use <../../../mecanique/Modèles/xl320.scad>

$fn=100;

module end_rampe(ecart){

     // parts
translate([56,26,10])mirror([1,0,0])rotate([180,0,0])xl320();
translate([10,-10,-10])mirror([1,0,0])fix_roulement();
rotate([0,0,0]){
difference(){
     union(){
translate([-1,0,0])moving_rail(70);
translate([ecart,0,0])mirror([1,0,0])moving_rail_xl320(70);
translate([4,6,17])cube([ecart-9,5,5]);
}
     translate([-1.1,7.5+(5-3)/2,18.5+(5-3)/2])rotate([0,90,0])cylinder(d=3,h=ecart+1.2);
     }
}

     
// fixations moteur

translate([29,15,-11])fix_xl320();

}

module fix_xl320(){
    // xl320 part
    difference(){
translate([0,15-2,0])rotate([0,0,-90])cube([15,3,21]);
        translate([-1, 8, 10.5]) rotate([0, 90, 0]) cylinder(h=26, d=4);
        translate([-1, 8, 16.5]) rotate([0, 90, 0]) cylinder(h=26, d=4);
        translate([-1, 8, 4.5]) rotate([0, 90, 0]) cylinder(h=26, d=4);
	}
    // base part
    translate([0,15-2,-4])rotate([0,0,-90])cube([15,3,4]);
    difference(){
    translate([0,15-2,-4])rotate([90,0,-90])cube([15,3,8]);
    translate([-4,-0.5-3/2+3.75,-10])cylinder(d=3,h=10);
    translate([-4,-0.5-3/2+11.25,-10])cylinder(d=3,h=10);
    }
}

end_rampe(63);



