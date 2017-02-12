use <supports_moteur_brushless.scad>
use <../../../mecanique/Modèles/moteurs_brushless.scad>
use <../other/elements_jeu.scad>
use <../titanium-ore-smg/smg_canon.scad>

use <../../../mecanique/Modèles/new_support_codeur.scad>
use <../../../mecanique/Modèles/roue_motrice.scad>
use <../../../mecanique/Modèles/xl320.scad>

color("grey")translate([85,200,38])rotate([0,0,-90])import ("../module-gober/module-gober_1.stl");
color("grey")translate([225,200,38])rotate([0,0,-90])import ("../module-gober/module-gober_1.stl");

$fn = 100;

diam_module=65;
L_stock=diam_module*2+diam_module/2;
L_coupe=100;


module base_robot_2A(L,l,e){
     difference(){
	  cube([L,l,e]);
	  translate([(L-diam_module)/2,(l-L_stock),-0.1])cube([diam_module,L_stock+0.1,3.2]);
	  translate([L/2,l-L_stock,-0.1])cylinder(d=diam_module,h=3.2);
	  translate([0,l-sqrt(2)*L_coupe/2,-0.1])rotate([0,0,45])cube([L_coupe,L_coupe,10]);
	  translate([L,l-sqrt(2)*L_coupe/2,-0.1])rotate([0,0,45])cube([L_coupe,L_coupe,10]);
     }
}

module power_train(){
     translate([75,125,30])moteur_Brushless_EC_45_flat_30W_geared();
     translate([75,92.5,3])support_moteur_brushless();
     translate([61,125,24])roue_motrice();
     translate([30,125,0])chariot();
}

module stockage_capacite(){

     for(i=[0:2]){
	  translate([330/2,(63+2)*i+90+10,-12])module_lunaire();
     }
}

base_robot_2A(330,260,3);
power_train();
translate([330,0,0])mirror([1,0,0])power_train();

stockage_capacite();
translate([270,35,73])minerais_titane();
//#translate([50,105,-12])cube([20,20,1]);

translate([40,10,3])rotate([0,0,-90])canon();
//translate([260,59,7])mirror([0,0,0])rotate([0,0,-90])xl320();

     
