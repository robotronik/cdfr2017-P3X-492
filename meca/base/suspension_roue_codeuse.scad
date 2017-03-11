use <../../../mecanique/Modèles/roue_codeuse.scad>

$fn=50;

clearance=0.5;

epaisseur=4;
longueur_fix_roue=20;
hauteur_fix_roue=28;
longueur_fix_base=longueur_fix_roue+40;
largeur_fix_base=20;
diam_guidage=6;
longueur_guidage=10;
diam_vis=3+clearance;

longueur_spring=20;
longueur_fix_suspension=longueur_fix_base+20;
hauteur_fix_suspension=hauteur_fix_roue+2*epaisseur+2+longueur_spring+longueur_guidage;

diam_percage_axe_codeur=9.7+clearance;
diam_axe_codeur=9.7;



module fixation_roue(){
     difference(){
     union(){
translate([10-epaisseur/2,-longueur_fix_roue/2,6])cube([epaisseur,longueur_fix_roue,hauteur_fix_roue]); // fixation axe codeur

translate([10-epaisseur/2,0,6])rotate([0,90,0])resize(newsize=[longueur_fix_roue-10,longueur_fix_roue,4])cylinder(d=hauteur_fix_roue,h=4); // arrondi
}
     translate([9.9-epaisseur/2,0,+1.1+diam_axe_codeur])rotate([90,0,90])cylinder(d=diam_percage_axe_codeur,h = epaisseur+0.2); // percage axe codeur
     }
difference(){
translate([10-epaisseur/2,-longueur_fix_base/2,hauteur_fix_roue+epaisseur+2])cube([largeur_fix_base,longueur_fix_base,epaisseur]); //base

for(i=[0:1])translate([11+diam_guidage/2-epaisseur/2,diam_guidage/2+1-longueur_fix_base/2+i*(longueur_fix_base-2-diam_guidage),hauteur_fix_roue+6+epaisseur]){
	  difference(){
	  translate([0,0,-0.1-epaisseur])cylinder(d=diam_vis,h=epaisseur+0.2);
	  }
	  }
translate([10-diam_guidage/2-epaisseur/2+largeur_fix_base-1,0,hauteur_fix_roue+5.9])cylinder(d=diam_vis,h=epaisseur+0.2);
}


    }

module fixation_suspension_roue(){
     // base de la fixation globale
     difference(){
     translate([10-epaisseur/2,-longueur_fix_suspension/2,hauteur_fix_suspension])cube([largeur_fix_base,longueur_fix_suspension,epaisseur]);
// percages

for(i=[0:1])translate([11+diam_guidage/2-epaisseur/2,diam_guidage/2+1-longueur_fix_base/2+i*(longueur_fix_base-2-diam_guidage),hauteur_fix_suspension+epaisseur]){
	  difference(){
	  translate([0,0,-0.1-epaisseur])cylinder(d=diam_vis,h=epaisseur+0.2);
	  }
	  }
translate([10-diam_guidage/2-epaisseur/2+largeur_fix_base-1,0,hauteur_fix_suspension])cylinder(d=diam_vis,h=epaisseur+0.2);
     
     }

     for(i=[0:1])translate([11+diam_guidage/2-epaisseur/2,diam_guidage/2+1-longueur_fix_base/2+i*(longueur_fix_base-2-diam_guidage),hauteur_fix_roue+6+epaisseur+longueur_spring]){
	  difference(){
	  cylinder(d=diam_guidage,h=longueur_guidage);
	  translate([0,0,-0.1])cylinder(d=diam_vis,h=longueur_guidage+0.2);
	  }
	  }
translate([10-diam_guidage/2-epaisseur/2+largeur_fix_base-1,0,hauteur_fix_roue+6+epaisseur+longueur_spring]){
     difference(){
	  cylinder(d=diam_guidage,h=longueur_guidage);
	  translate([0,0,-0.1])cylinder(d=diam_vis,h=longueur_guidage+0.2);
	  }
     }
translate([largeur_fix_base+10-epaisseur/2,longueur_fix_suspension/2-epaisseur,0])rotate([0,0,90])fixation_suspension();
translate([largeur_fix_base/2-2,-longueur_fix_suspension/2+epaisseur,0])rotate([0,0,-90])fixation_suspension();
     }

module fixation_suspension(){
     cube([epaisseur,largeur_fix_base,hauteur_fix_suspension]);
     difference(){
     cube([12+epaisseur/2,largeur_fix_base,epaisseur]);
translate([7+epaisseur/2,largeur_fix_base/2,-0.1])cylinder(d=diam_vis,h=4.2);
     }
     }

// fixation à la base du robot

fixation_roue();
fixation_suspension_roue();

translate([0,0,10.8])rotate([0,90,0])mirror([1,0,0])_roue_codeuse();

// sol
c=100;
//translate([0,0,-10.5])%cube([c,c,1],center= true);

// base
//translate([0,0,-0.5])%cube([c,c,6],center= true);

// roue motrice
//translate([31.5,0,-0.5])%cube([1,c,c+50],center= true);

