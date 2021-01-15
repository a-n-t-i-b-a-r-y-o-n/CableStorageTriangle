module inner_cylinder() {
	difference(){
		// outer
		translate([CylinderDiameter/2,CylinderDiameter/2,0])
			cylinder(h=CylinderHeight,r1=CylinderDiameter/2,r2=CylinderDiameter/2);
		// inner
		translate([(CylinderDiameter/2),(CylinderDiameter/2),-1])
			cylinder(h=CylinderHeight+CylinderThickness,r1=(CylinderDiameter/2)-(CylinderThickness*2),r2=(CylinderDiameter/2)-(CylinderThickness*2));
	}
}