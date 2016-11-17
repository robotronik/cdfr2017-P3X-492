use <../../../mecanique/Modèles/moteurs_brushless.scad>
$fn = 100;

clearence = 0;
diam_gear = 45;

module support_moteur_base(L,l,H){
     difference(){
	  cube([L,l,H]);
	  translate([-0.1,l/2,H])rotate([0,90,0])cylinder(d=diam_gear+clearence,h=L+0.2);
	  translate([L/4,(l/2-(diam_gear+clearence)/2)/2,H-10])cylinder(d=3,h=10.1);
	  translate([L-L/4,(l/2-(diam_gear+clearence)/2)/2,H-10])cylinder(d=3,h=10.1);
	  translate([L/4,l-(l/2-(diam_gear+clearence)/2)/2,H-10])cylinder(d=3,h=10.1);
	  translate([L-L/4,l-(l/2-(diam_gear+clearence)/2)/2,H-10])cylinder(d=3,h=10.1);
     }
     difference(){
	  translate([-2,28/2,0])cube([2,l-28,H-12]);
	  translate([-2.1,l/2,21.2])rotate([0,90,0])cylinder(d=21.5,h=2.2);
	  translate([-2.1,l/2-10,11.2])rotate([0,90,0])cylinder(d=4.7,h=2.2);
	  translate([-2.1,l/2+10,11.2])rotate([0,90,0])cylinder(d=4.7,h=2.2);
     }
     translate([14+(L-14)/2,2,0])rotate([0,0,-180])equerre_fix_moteur();
     translate([(L-14)/2,l-2,0])rotate([0,0,0])equerre_fix_moteur();
     translate([L-2,14,0])rotate([0,0,-90])equerre_fix_moteur();
     translate([L-2,l,0])rotate([0,0,-90])equerre_fix_moteur();
     

}

module support_moteur_haut(L,l,H){
     difference(){
	  cube([L,l,H-5]);
	  translate([-0.1,l/2,H])rotate([0,90,0])cylinder(d=diam_gear+clearence,h=L+0.2);
	  translate([L/4,(l/2-(diam_gear+clearence)/2)/2,-0.1])cylinder(d=3,h=25.1);
	  translate([L-L/4,(l/2-(diam_gear+clearence)/2)/2,-0.1])cylinder(d=3,h=25.1);
	  translate([L/4,l-(l/2-(diam_gear+clearence)/2)/2,-0.1])cylinder(d=3,h=25.1);
	  translate([L-L/4,l-(l/2-(diam_gear+clearence)/2)/2,-0.1])cylinder(d=3,h=25.1);
     }
}

module support_moteur_brushless(){
     support_moteur_base(20,65,diam_gear/2+5);
     translate([0,0,56])mirror([0,0,1])support_moteur_haut(20,65,diam_gear/2+5);
}

diametre_tete=7;
epaisseur_tete=10;
diametre_vis=3.5;
longueur_filetage=5;
module empreinte_vis(d_tete,h_tete,m,l_filetage){
     cylinder(d=d_tete,h=h_tete);
     translate([0,0,-l_filetage])cylinder(d=m,h=l_filetage);

}

module equerre_fix_moteur(){
     L=14;
     E1=3;
     E2=2;
     l1=13;
     l2=10;
     cube([L,E1,l1]);
     difference(){
	  translate([0,E1,0])cube([L,l2,E1]);
	  translate([L/2,l2/2+E1,E1+0.1])empreinte_vis(7,5,3.5,5);
     }
     translate([0,E1,E1])rotate([180,-90,0])linear_extrude(height = E2)polygon(
	  points=[ [0,0],[l2,0],[0,-l2] ],
	  paths=[ [0,1,2] ]);
     translate([L-E2,E1,E1])rotate([180,-90,0])linear_extrude(height = E2)polygon(
	  points=[ [0,0],[l2,0],[0,-l2] ],
	  paths=[ [0,1,2] ]);
}

//translate([0,65/2,45/2+5])moteur_Brushless_EC_45_flat_30W_geared();

//support_moteur_base(20,65,diam_gear/2+5);
//translate([0,0,56])mirror([0,0,1])support_moteur_haut(20,65,diam_gear/2+5);
//support_moteur_haut(20,65,diam_gear/2+5);

support_moteur_brushless();

