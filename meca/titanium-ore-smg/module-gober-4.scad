$fn = 100;

module fix_2_xl320(l){
    
    translate([6, l-20-6, 35]) union(){
        for(i=[0:3]){
            translate([0, 6*cos(90*i), 6*sin(90*i)]) 
            rotate([0, 90, 0]) cylinder(h=2, d=3.8, center = true);
        }
        
        translate([-2, 0, 0]) difference(){
            rotate([0, 90, 0]) cylinder(h=2, r=4, center = true);
            
            rotate([0, 90, 0]) cylinder(h=3, d=2.2, center = true);
        }
    }
}

// La pièce de Jordan, avec "l" la longueur du bras, supérieur à 22
module moving_rail_xl320(l){
    
    minl = max(22, l);
    
    mirror([0, 0, 1]) translate([0, -minl+20+6, -35])
    rail_xl320(minl);
    
}

module moving_rail(l){
    
    minl = max(22, l);
    
    mirror([0, 0, 1]) translate([0, -minl+20+6, -35])
    rail(minl);
    } 

module rail_xl320(l){


fix_2_xl320(l);
// Structure de base
cube([5, l, 5]);
translate([5, 0, 0]) cube([5, l, 2]);
translate([0, l-20, 5]) cube([5, 20, 20]);

difference(){

// Arrondi
union(){
    translate([2.5, l-20, 25])
    difference(){
        rotate([0, 90, 0]) cylinder(h=5, r=20, center = true);
    
        translate([0, -10.5, 0]) cube([6, 21, 42], center = true);
        translate([0, 0, -10.5]) cube([6, 42, 21], center = true);
    }

    translate([0, l-20-6, 25]) cube([5, 6, 20]);

    translate([2.5, l-20-6, 35])
    difference(){
        rotate([0, 90, 0]) cylinder(h=5, r=10, center = true);
    
        translate([0, 5.5, 0]) cube([6, 11, 21], center = true);
    }
}

//Trou
translate([2.5, l-20-6, 35]) rotate([0, 90, 0]) cylinder(h=6, r=4, center = true);


}

//Fioritures

difference(){
    translate([5, l-5, 2]) cube([5, 5, 15]);

    translate([15-9, l+0.5, 22-14]) rotate([90, 0, 0]) linear_extrude(height=6) polygon([[9.1, 9.1], [9, 0], [0, 9]]);
}

translate([5, l, 2]) rotate([90, 0, 0]) linear_extrude(height=l) polygon([[0, 0], [0, 2], [2, 0]]);

translate([0, l-20, 5]) rotate([90, 0, 90]) linear_extrude(height=5) polygon([[0, 0], [0, 2], [-2, 0]]);

translate([0, l-20, 25]) rotate([90, 0, 90]) linear_extrude(height=5) polygon([[0, 0], [0, -2], [-2, 0]]);

}

module rail(l){

// Structure de base
cube([5, l, 5]);
translate([5, 0, 0]) cube([5, l, 2]);
translate([0, l-20, 5]) cube([5, 20, 20]);

difference(){

// Arrondi
union(){
    translate([2.5, l-20, 25])
    difference(){
        rotate([0, 90, 0]) cylinder(h=5, r=20, center = true);
    
        translate([0, -10.5, 0]) cube([6, 21, 42], center = true);
        translate([0, 0, -10.5]) cube([6, 42, 21], center = true);
    }

    translate([0, l-20-6, 25]) cube([5, 6, 20]);

    translate([2.5, l-20-6, 35])
    difference(){
        rotate([0, 90, 0]) cylinder(h=5, r=10, center = true);
    
        translate([0, 5.5, 0]) cube([6, 11, 21], center = true);
    }
}

//Trou
translate([2.5, l-20-6, 35]) rotate([0, 90, 0]) cylinder(h=6, r=4, center = true);


}

//Fioritures

difference(){
    translate([5, l-5, 2]) cube([5, 5, 15]);

    translate([15-9, l+0.5, 22-14]) rotate([90, 0, 0]) linear_extrude(height=6) polygon([[9.1, 9.1], [9, 0], [0, 9]]);
}

translate([5, l, 2]) rotate([90, 0, 0]) linear_extrude(height=l) polygon([[0, 0], [0, 2], [2, 0]]);

translate([0, l-20, 5]) rotate([90, 0, 90]) linear_extrude(height=5) polygon([[0, 0], [0, 2], [-2, 0]]);

translate([0, l-20, 25]) rotate([90, 0, 90]) linear_extrude(height=5) polygon([[0, 0], [0, -2], [-2, 0]]);

}


moving_rail_xl320(70);

