use <../other/elements_jeu.scad>
use <../../../mecanique/Modèles/xl320.scad>
use <end_rampe.scad>
use <support_launcher.scad>

$fn=100;

e1=3;
e2=e1+2;
L1=160;
L2=50;
H1=85;
H2=32;
l1=6;
angle=0;
diam_vis_fix=3.3;
diam_rail_Ti=3.3;

CONST_1=10;
ecart=34;
ecart_rampe=20;
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

module rampe_fin(){
     rail_final_1();
     translate([-translation,0,0])mirror([1,0,0])rail_final_1();
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
	  translate([-0.1,L1-10,H1-30-15])rotate([0,90,0])cylinder(d=diam_rail_Ti,h=e1+0.2);
	  translate([-0.1,L1-30,H1-30.1-10.5])rotate([0,90,0])cylinder(d=diam_rail_Ti,h=e1+0.2);
	  translate([0,L1-35,H1-30-17.5])translate([-0.1,0,19.9])rotate([-12.35,0,0])cube([3.2,37,0.3]);
     }
     for(i=[0:2]){
	  translate([0,75*i,0])fixation_rail();
     }
     translate([-2,10,0])rotate([0,0,-180])fixation_rail();
     translate([3,L1-35,H1-30-17.5])lamelle(150);
}

module rail_roche(){
     difference(){
	  cube([e2+2,L1,H2]);
	  translate([e1+2+0.1,L1+0.1,H2+0.1])rotate([0,90,180])linear_extrude(height=e2+0.2)triangle(L1+0.1,H2+0.1);
	  translate([-0.1,-0.1,H2-1])cube([e2+0.2,25.1,5.1]);
     }
}

module rail_final_1(){
     difference(){
	  union(){
	  translate([0,ecart_rampe+10,0])cube([l1,L2,l1]);
	  translate([8-2-2,-5,-5])cube([2,2*ecart_rampe+L2-5,8-2]);
	  translate([-3,-0,-2])rotate([0,90,0])cylinder(d=3,h=e1+4);
	  translate([e1,-0,-2])rotate([0,90,0])cylinder(d=3+2,h=e1-1.5);
	  }
	  }
     
     }

module rail_final_V2(){
     end_rampe(63);
     }

module lamelle(l){

     // fixation
     difference(){
     translate([0,0,0])cube([1,30,20]);
     translate([e1-1,L1-125,H1-37.37])rotate([0,90,180])linear_extrude(height=e1+0.2)triangle(L1+0.1,(H1-50)+0.1);
     }
     translate([0,5,6.9])rotate([0,-90,0])cylinder(d=diam_rail_Ti,h=e1+0.2+5);
     translate([0,25,6.9-4.4])rotate([0,-90,0])cylinder(d=diam_rail_Ti,h=e1+0.2+5);
     // lamelle

     translate([-3,0,19.9])rotate([-12.35,0,0])cube([4,l,0.3]);
     
     }
     
module canon(){
// --> rendu     
     translate([-e1,0,0])rampe();
       translate([-60/2+5,0,104])minerais_titane();
       translate([-(20+5),0,43])roche_lunaire();
// --> fin de la rampe
       translate([-60/2+5,170,69])minerais_titane();
       translate([-(20+5),150,20])roche_lunaire();
      // translate([-e1,L1-10,50-8])rotate([angle,0,0])#rampe_fin();
       //translate([2,L1+46,15])
       translate([6,186,15])rotate([-0,0,180])rail_final_V2();
       translate([-58,163,0])rotate([0,0,90])support_launcher();
       //translate([0,L1-35,H1-30-17.5])lamelle(150);
        

}




canon();
// --> sol

//translate([-100,0,-1])cube([100,200,1]);





