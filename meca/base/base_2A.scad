use <supports_moteur_brushless.scad>
use <../../../mecanique/Modèles/moteurs_brushless.scad>
use <../other/elements_jeu.scad>
use <../titanium-ore-smg/smg_canon.scad>

use <../../../mecanique/Modèles/new_support_codeur.scad>
use <../../../mecanique/Modèles/roue_motrice.scad>
use <../../../mecanique/Modèles/xl320.scad>
use <../../../robot-sumo/mecanique/roue_omni.scad>
use <../../../mecanique/Modèles/roue_codeuse.scad>

color("grey")translate([largeur_base/2-80,longueur_base-60,38+(epaisseur_base-3)])rotate([0,0,-90])import ("../module-gober/module-gober_1.stl");
color("grey")translate([largeur_base/2+55,longueur_base-60,38+(epaisseur_base-3)])rotate([0,0,-90])import ("../module-gober/module-gober_1.stl");

$fn = 100;

diam_module=65;
L_stock=((diam_module+5)*2)+diam_module/2;
L_coupe=100;

longueur_base=260;
largeur_base=330;
epaisseur_base=6;

largeur_roue_motrice=15;

module base_robot_2A(L,l,e){
     difference(){
	  cube([L,l,e]);
	  translate([(L-diam_module)/2,(l-L_stock),-0.1])cube([diam_module,L_stock+0.1,epaisseur_base+0.2]);
	  translate([L/2,l-L_stock,-0.1])cylinder(d=diam_module,h=epaisseur_base+0.2);
	  translate([0,l-sqrt(2)*L_coupe/2,-0.1])rotate([0,0,45])cube([L_coupe,L_coupe,10]);
	  translate([L,l-sqrt(2)*L_coupe/2,-0.1])rotate([0,0,45])cube([L_coupe,L_coupe,10]);
	  translate([largeur_base/2-104,longueur_base/2-5,-0.1])cube([largeur_roue_motrice+4,64,13.2],center=true);
	  translate([largeur_base/2+104,longueur_base/2-5,-0.1])cube([largeur_roue_motrice+4,64,13.2],center=true);
     }
}

module power_train(){
     translate([largeur_base/2-90,longueur_base/2-5,30+(epaisseur_base-3)])moteur_Brushless_EC_45_flat_30W_geared();
     translate([largeur_base/2-90,longueur_base/2-37.5,3+(epaisseur_base-3)])support_moteur_brushless();
     translate([largeur_base/2-104,longueur_base/2-5,24+(epaisseur_base-3)])roue_motrice();
     /*translate([30,125,0])chariot();
     translate([0,125,10])rotate([0,-90,180])_roue_codeuse();*/
}

module stockage_capacite(){

     for(i=[0:2]){
	  translate([largeur_base/2,(63+2+5)*i+90,-9])module_lunaire();
     }
}

module roue_jocket(){

     translate([largeur_base/2,25,0])bille_jockey(50); // bille d'appui pour avancer
     translate([largeur_base/6,205,0])bille_jockey(50);
     translate([largeur_base-largeur_base/6,205,0])bille_jockey(50);
}

module profiles(e){

     translate([5,5,e])cube([10,10,150]);
     translate([largeur_base-15,5,e])cube([10,10,150]);
     translate([5,175,e])cube([10,10,150]);
     translate([largeur_base-15,175,e])cube([10,10,150]);
}

base_robot_2A(largeur_base,longueur_base,epaisseur_base);
power_train();
translate([330,0,0])mirror([1,0,0])power_train();

profiles();
roue_jocket();
stockage_capacite();


translate([270,35,73])minerais_titane();
//#translate([50,105,-12])cube([20,20,1]);

//translate([40,10,3])rotate([0,0,-90])canon();
//translate([70,253,3])rotate([0,0,180])canon();
//translate([260,59,7])mirror([0,0,0])rotate([0,0,-90])xl320();

//--> Sol

%translate([-10,-10,-10])cube([350,300,1]);

     
