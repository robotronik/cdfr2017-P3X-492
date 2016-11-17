use <../../../mecanique/Modèles/xl320.scad>

$fn = 100;

clearence = -0.2;

module wheel_hub_base(diam, H){
     translate([0,0,1])difference(){
	  union(){
	       cylinder(d=diam-clearence, h=H, $fn =6);
	       translate([0,0,-1])cylinder(d=20,h=1);
	       translate([0,0,0])cylinder(d1=20,d2=12.2,h=1.5);
	  }
	  translate([0,0,-0.1-1])cylinder(d=8-clearence,h=H+0.2+1);
	  translate([0,diam/4*sqrt(3)+0.1,H])rotate([-45,0,0])cube([diam/2+1,1,1],center=true);
	  translate([-diam/4-0.25,-diam/4*sqrt(3)-sqrt(2)/2-0.1,H])rotate([-45,0,0])cube([diam/2+0.5,1,1]);
	  translate([-diam/4-0.451,diam/4*sqrt(3)-sqrt(2)/2+0.1,H])rotate([-45,0,-120])cube([diam/2+8,1,1],center=true);
	  translate([-diam/2-0.1155,0,H])rotate([-45,0,120])cube([diam/2+10.5,1,1],center=true);
	  	  translate([diam/2+0.1155,0,H])rotate([-45,0,-120])cube([diam/2+7.5,1,1],center=true);
		   translate([+diam/2+0.1155,0,H])rotate([-45,0,120])cube([diam/2+8,1,1],center=true);
	  
     }
     
}

module wheel_hub_top(diam,H){
     translate([0,0,1])difference(){
	  union(){
	       cylinder(d=diam-clearence, h=H);
	       translate([0,0,-1])cylinder(d=20-clearence,h=1);
	       
	  }
     }
}

module fixation_axe_xl320(){
     difference(){
	  cylinder(d=20,h=1.5);
	  translate([0,0,-0.1])cylinder(d=3,h=3.7);
	  }
      for(i = [0:3]){
           translate([6*cos(i*90+45), 6*sin(i*90+45), -0.3]) cylinder(h=3.5, d=3.9-clearence, center=true);
        }
}

module support_roue(){
translate([0,0,1.5])wheel_hub_base(14,13);
fixation_axe_xl320();
}

module roue(){
     cylinder(d=30,h=10);
     }

support_roue();
//translate([0,0,3.5])roue();

//wheel_hub_top(8,10);
//xl320();
