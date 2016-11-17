use <supports_moteur_brushless.scad>
use <../../../mecanique/Modèles/moteurs_brushless.scad>
use <../other/elements_jeu.scad>

use <../../../mecanique/Modèles/new_support_codeur.scad>
use <../../../robotronik/mecanique/Modèles/roue_motrice.scad>

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
	  translate([350/2,(63+2)*i+90,0])module_lunaire();
     }
}

base_robot_2A(350,250,3);
power_train();
translate([350,0,0])mirror([1,0,0])power_train();

stockage_capacite();
translate([60,40,3])minerais_titane();
//#translate([50,105,-12])cube([20,20,1]);

     
