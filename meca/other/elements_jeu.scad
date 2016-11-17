$fn = 100;

module minerais_titane(){
     color("white")sphere(d=60);
}

module roche_lunaire(){
     color("black")sphere(d=40);
}

module module_lunaire(){
     color("blue")difference(){
	  cylinder(d=63,h=100);
	  translate([0,0,-0.1])cylinder(d=60,h=100.2);
     }
}

//minerais_titane();
//roche_lunaire();
//module_lunaire();
