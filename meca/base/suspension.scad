use <../../../robot-sumo/mecanique/roue_omni.scad>

$fn=50;

clearance=0.5;
diam_vis=3+clearance;
diam_support=43;
diam_guidage=6;
diam_percage_guide=3+clearance;
longueur_guidage=10;
epaisseur=3;

longueur_spring=20;
hauteur_fix = longueur_spring + longueur_guidage+4.5;

module suspension(){
     difference(){
	  union(){
	       //translate([-diam_support/2+0.75,-5,0])cube([2,10,hauteur_fix]); // fixation
	       // --> translate([diam_support/2-2.75,-5,0])cube([2,10,hauteur_fix]);
	       // fixation base
	       //translate([-diam_support/2+0.75-10,-5,hauteur_fix-2])cube([12,10,2]);
	       // --> translate([diam_support/2-2.75,-5,hauteur_fix-2])cube([12,10,2]);
	       cylinder(d=diam_support,h=3);
	       //cylinder(d=2.5,h=longueur_guidage+3); // fixation central spring 
	       for(i=[0:2]){
		    translate([12.6*cos(i*120),12.6*sin(i*120), 0]) cylinder(d=diam_guidage,h=longueur_guidage+epaisseur);
	       }
	       for(i=[0:2])rotate([0,0,60+120*i])translate([diam_support/2-2.75,-5,hauteur_fix])mirror([0,0,1])fixation_suspension();
	  }
	  for(i=[0:2]){
	       translate([12.6*cos(i*120),12.6*sin(i*120), -0.1]) cylinder(d=diam_percage_guide,h=longueur_guidage+epaisseur+0.2);
	  }
	  // percage fixation base
	  //translate([-diam_support/2+0.75-5,0,hauteur_fix-2-0.1])cylinder(d=3.5,h=2.2);
	  // --> translate([diam_support/2-2.75+7,0,hauteur_fix-2-0.1])cylinder(d=3.5,h=2.2);
     }
}

module fixation_suspension(){
     cube([2,10,hauteur_fix]);
     difference(){
     cube([12,10,2]);
translate([7,5,-0.1])cylinder(d=diam_vis,h=2.2);
     }
     }

translate([0,0,37.1])mirror([0,0,1])suspension();
//fixation_suspension();
//translate([0,0,3])bille_jockey(50);
/*
// sol
c=50;
translate([0,0,-10.5])%cube([c,c,1],center= true);

// base
translate([0,0,-0.5])%cube([c,c,6],center= true);*/


