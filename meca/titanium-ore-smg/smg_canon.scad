use <../other/elements_jeu.scad>

$fn=100;

e1=3;
e2=e1+2;
L1=160;
H1=85;
H2=32;
diam_vis_fix=3.3;

CONST_1=10;
ecart=34;
translation=ecart+CONST_1;

module rampe_test(L){
     difference(){
	  union(){
	       cube([5,L,80]);
	       translate([-50,0,0])cube([5,L,80]);
	  }
	  // translate([5.1,+L+0.1,80.1])rotate([0,90,180])linear_extrude(height=5.2)triangle(160+0.1,30+0.1);
     }

     translate([-12.5+5,0,0])cube([12.5,L,30]);
     translate([-50,0,0])cube([12.5,L,30]);
}

module rampe_1(){
     rail_Ti();
     translate([-e2,0,0])rail_roche();
}

module rampe(){
     rampe_1();
     translate([-translation,0,0])mirror([1,0,0])rampe_1();
}

module triangle(L,H){
     polygon(points=[[0,0],[H,0],[0,L]],paths=[[0,1,2]]);
}

module fixation_rail(){
     difference(){
	  cube([12,10,3]);
	       translate([16/2,10/2,-0.1])cylinder(d=diam_vis_fix, h=3.2);
     }
}

module rail_Ti(){
     difference(){
	  cube([e1,L1,H1]);
	  translate([e1+0.1,L1+0.1,H1+0.1])rotate([0,90,180])linear_extrude(height=e1+0.2)triangle(L1+0.1,(H1-50)+0.1);
	  translate([-0.1,-0.1,H1-1])cube([e1+0.2,25.1,5.1]);
     }
     for(i=[0:2]){
	  translate([0,75*i,0])fixation_rail();
     }
     translate([-2,10,0])rotate([0,0,-180])fixation_rail();
}

module rail_roche(){
     difference(){
	  cube([e2+2,L1,H2]);
	  translate([e1+2+0.1,L1+0.1,H2+0.1])rotate([0,90,180])linear_extrude(height=e2+0.2)triangle(L1+0.1,H2+0.1);
	  translate([-0.1,-0.1,H2-1])cube([e2+0.2,25.1,5.1]);
     }
}

// --> rendu     
     translate([-e1,0,0])rampe();
       translate([-60/2+5,0,104])minerais_titane();
       translate([-(20+5),0,43])roche_lunaire();
// --> fin de la rampe
       translate([-60/2+5,150,74])minerais_titane();
       translate([-(20+5),150,20])roche_lunaire();

// --> sol

//translate([-100,0,-1])cube([100,200,1]);





