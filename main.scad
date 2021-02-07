// Cable storage

$fn = 360;

CylinderHeight      = 65;
CylinderDiameter    = 70;
CylinderThickness   = 3;

TriangleHeight      = 65;
TriangleWidth       = 185;
TriangleSide        = (TriangleWidth/sin(60))*sin(90);
TriangleThickness   = 5;

NotchWidth          = 12;

BaseThickness       = 1;


// Inner cylinder
rotate([0,0,30]){
    translate([TriangleSide*tan(30),0,0])
        inner_cylinder();
}

// NOTE: The triangle module is used only for the base, the walls are a single module rotated 3 ways

// x-axis side
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
        triangle(TriangleWidth, BaseThickness);
    }
    // hollow circle to match inner hollow portion of cylinder
    rotate([0,0,30]){
        translate([TriangleSide*tan(30),0,-1]){
            cylinder(h=BaseThickness+2,r1=(CylinderDiameter/2)-(CylinderThickness*2),r2=(CylinderDiameter/2)-(CylinderThickness*2));
        }
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

module inner_cylinder() {
    difference(){
        // outer
        cylinder(h=CylinderHeight,r1=CylinderDiameter/2,r2=CylinderDiameter/2);
        // inner
        translate([0,0,-1])
            cylinder(h=CylinderHeight+CylinderThickness,r1=(CylinderDiameter/2)-(CylinderThickness*2),r2=(CylinderDiameter/2)-(CylinderThickness*2));
    }
}

module triangle(width, height){
    side = (width/sin(60))*sin(90);
    linear_extrude(height=height){
        polygon(
            points=[
                [-side/2,0],
                [side/2,0],
                [0,width]
            ]
        );
    }
}