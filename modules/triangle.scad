module triangle(width, height){
	side = (width/sin(60))*sin(90);
	linear_extrude(height=height){
		polygon(
			points= [
				[0,0],
				[side,0],
				[side/2,width]
			]
		);
	}
}

module triangle_center(width, height){
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