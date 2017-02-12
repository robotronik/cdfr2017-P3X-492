use <module-gober-4.scad>
$fn=100;

diam_ext_roulement=16.5;
diam_axe_roulement=5;
longueur_axe=13; 
hauteur_fix=20;

module fix_roulement(){
     difference(){
	  // structure
          union(){
	       cube([5, diam_ext_roulement+3,hauteur_fix]);
	       translate([0,-6,hauteur_fix/2+1])cube([5,6,2]);
	       translate([0,-6,hauteur_fix/2-3])cube([5,6,2]);
	       translate([0,0,-5])cube([5,diam_ext_roulement+3,5]);
	       translate([-10,0,-5])cube([10,diam_ext_roulement+3,3]);
	  }
	  // trous 
	  translate([-0.1,diam_ext_roulement/2+1.5,diam_ext_roulement/2+(hauteur_fix-1.5-diam_ext_roulement)])rotate([0,90,0])cylinder(d=diam_ext_roulement,h=5.2);
	  translate([-0.1,-0.1,hauteur_fix/2-1])cube([5.2,1.7,2]);
	  translate([2.5,-3,5])cylinder(d=3,h=10);
	  translate([-5,4.88,-10])cylinder(d=3,h=10);
	  translate([-5,14.63,-10])cylinder(d=3,h=10);
     }
     // axe+fixation_rail

     translate([6,10,10])axe_fixation();

}

module axe_fixation_1(){
     difference(){
	  union(){
	       translate([0,0,0])rotate([0,90,0])cylinder(d=diam_axe_roulement, h=longueur_axe);
	       translate([0,0,0])rotate([0,90,0])cylinder(d=diam_axe_roulement+10, h=1);
	  }
	  translate([-0.1,0,0])rotate([0,90,0])cylinder(d=3.5, h=longueur_axe+1.2);
     }
}

module axe_fixation_2(){
     difference(){
	  translate([0,0,0])rotate([0,90,0])cylinder(d=diam_axe_roulement+10, h=1);
	  translate([-0.1,0,0])rotate([0,90,0])cylinder(d=3.5, h=1.2);
     }
}
module rondelle_separation(){
     difference(){
	  translate([0,0,0])rotate([0,90,0])cylinder(d=diam_axe_roulement+6, h=1);
	  translate([-0.1,0,0])rotate([0,90,0])cylinder(d=diam_axe_roulement+1, h=1.2);
     }
}

module axe_fixation(){
     color("blue")translate([6,0,0])rotate([0,180,0])axe_fixation_1();
color("green")translate([0,0,0])rotate([0,180,0])rondelle_separation();
color("red")translate([-longueur_axe+6,0,0])rotate([0,180,0])axe_fixation_2();
}

moving_rail(70);
translate([-6,-10,-10])fix_roulement();


