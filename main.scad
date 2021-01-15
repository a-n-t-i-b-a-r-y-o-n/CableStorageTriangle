include <modules/inner_cylinder.scad>
include <modules/triangle.scad>

// Cable storage

$fn = 90;

CylinderHeight      = 100;
CylinderDiameter    = 80;
CylinderThickness   = 4;

TriangleHeight      = 90;
TriangleWidth       = 160;
TriangleSide        = (TriangleWidth/sin(60))*sin(90);
TriangleThickness   = 4;

translate([TriangleSide/2-CylinderDiameter/2,(TriangleSide/2)-(CylinderDiameter),0]){
    inner_cylinder();
}

difference(){
    translate([TriangleSide/2,0,0])
        triangle_center(TriangleWidth, TriangleHeight);
    /*
    translate([TriangleThickness,TriangleThickness,-1])
        triangle(TriangleWidth-(TriangleThickness*2),TriangleHeight+2);
    /*
    linear_extrude(height=TriangleHeight){
        polygon(points=[[0,0], [TriangleSide,0], [TriangleSide/2,TriangleWidth]]);
    }
    */
    /*
    translate([0,0,-1]){
        linear_extrude(height=TriangleHeight+2){
            polygon(points=[
            [TriangleThickness,TriangleThickness],
            [TriangleSide-TriangleThickness,TriangleThickness],
            [(TriangleSide/2)-TriangleThickness,TriangleWidth-TriangleThickness]]);
        }
    }
    */
}