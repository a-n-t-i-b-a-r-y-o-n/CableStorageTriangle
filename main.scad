include <modules/inner_cylinder.scad>
include <modules/triangle.scad>

// Cable storage

$fn = 90;

CylinderHeight      = 90;
CylinderDiameter    = 80;
CylinderThickness   = 4;

TriangleHeight      = 90;
TriangleWidth       = 160;
TriangleSide        = (TriangleWidth/sin(60))*sin(90);
TriangleThickness   = 4;

NotchWidth          = 12;

BaseThickness       = 1;


// Inner cylinder
translate([TriangleSide/2-CylinderDiameter/2,(TriangleSide/2)-(CylinderDiameter),0]){
    inner_cylinder();
}

// Sides
wall_with_notch();

translate([TriangleSide,TriangleThickness,0]){
    rotate([0,0,120])
        wall_with_notch();
}

translate([TriangleSide/2,TriangleWidth,0]){
    rotate([0,0,60]){
        mirror([1,0,0])
            wall_with_notch();
    }
}



// Base
translate([TriangleSide/2,0,0]){
    triangle_center(TriangleWidth, BaseThickness);
}


module wall_with_notch(){
    difference(){
        cube([TriangleSide,TriangleThickness,TriangleHeight]);
        // Notches
        translate([8,-1,BaseThickness])
            cube([12,TriangleThickness+2,TriangleHeight]);
    }
}