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
translate([TriangleSide/2-CylinderDiameter/2,(TriangleSide/2)-(CylinderDiameter)+CylinderThickness,0]){
    inner_cylinder();
}

// x-plane side
wall_with_notch();
// right side
translate([TriangleSide,TriangleThickness,0]){
    rotate([0,0,120])
        wall_with_notch();
}
// left side
translate([TriangleSide/2,TriangleWidth,0]){
    rotate([0,0,60]){
        mirror([1,0,0])
            wall_with_notch();
    }
}



// Base
difference(){
    // triangle base
    translate([TriangleSide/2,0,0]){
        triangle_center(TriangleWidth, BaseThickness);
    }
    // hollow circle to match inner hollow portion of cylinder
    translate([TriangleSide/2,(TriangleSide/2)-(CylinderDiameter/2)+CylinderThickness,-1]){
        cylinder(h=CylinderHeight+CylinderThickness,r1=(CylinderDiameter/2)-(CylinderThickness*2),r2=(CylinderDiameter/2)-(CylinderThickness*2));
    }
}


module wall_with_notch(){
    difference(){
        // wall
        cube([TriangleSide,TriangleThickness,TriangleHeight]);
        // notch
        translate([8,-1,BaseThickness])
            cube([12,TriangleThickness+2,TriangleHeight]);
    }
}