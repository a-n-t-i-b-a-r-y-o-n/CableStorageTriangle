module inner_cylinder() {
	difference(){
		// outer
		cylinder(h=CylinderHeight,r1=CylinderDiameter/2,r2=CylinderDiameter/2);
		// inner
		translate([0,0,-1])
			cylinder(h=CylinderHeight+CylinderThickness,r1=(CylinderDiameter/2)-(CylinderThickness*2),r2=(CylinderDiameter/2)-(CylinderThickness*2));
	}
}