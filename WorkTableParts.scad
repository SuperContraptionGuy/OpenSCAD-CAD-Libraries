include<WorkTableDimensions.scad>;





module longTable() {
	difference() {

		cube([table_D, space_W, wood_D]);

		linear_extrude(wood_D){

			polygon([
				[0, 0],
				[table_D, 0],
				[table_D, table_D]
			]);
		}
	}
}


module shortTable() {

	difference() {
	
		cube([space_D, table_D, wood_D]);
	
		linear_extrude(wood_D){
	
			polygon([
				[0, 0],
				[0, table_D],
				[table_D, table_D]
			]);
		}
	}
}

module tableConnector() {

	difference() {
		translate([0, 0, -wood_D / 2])
			cube([tableConnector_L, tableConnector_W, wood_D], center = true);

		translate([tableConnector_L / 2 - tableConnector_L / 4, 0, -wood_D])
			cylinder(r = screwPortHole_R, h = wood_D);

		translate([-tableConnector_L / 2 + tableConnector_L / 4, 0, -wood_D])
			cylinder(r = screwPortHole_R, h = wood_D);

	}
}

module supportTop() {

	difference() {
		translate([0, -supportRectangle_W / 2, 0])
			cube([table_D * 2 / 3, supportRectangle_W, wood_D]);

		translate([supportTriangle_H / 4 + wood_D, 0])
			cylinder(r = screwPortHole_R, h = wood_D);

		translate([supportTriangle_H * 3 / 4 + wood_D, 0])
			cylinder(r = screwPortHole_R, h = wood_D);
	}
}

module supportBack() {

	difference() {
		rotate([0, 90, 0])
			translate([0, -supportRectangle_W / 2, 0])
				cube([table_D * 2 / 3 - wood_D, supportRectangle_W, wood_D]);
				
		translate([0, 0, -supportTriangle_H / 4])
			rotate([0, 90, 0])
				cylinder(r = screwPortHole_R, h = wood_D);

		translate([0, 0, -supportTriangle_H * 3 / 4])
			rotate([0, 90, 0])
				cylinder(r = screwPortHole_R, h = wood_D);
	}
}

module supportTriangle() {

	difference() {
		rotate([-90, 0, 0])
			linear_extrude(wood_D, center = true) {
				polygon([
					[0, 0],
					[supportTriangle_H, 0],
					[0, supportTriangle_H]
				]);
			}
			
		translate([supportTriangle_H / 4, 0, -wood_D])
			cylinder(r = screwPortHole_R, h = wood_D);

		translate([supportTriangle_H * 3 / 4, 0, -wood_D])
			cylinder(r = screwPortHole_R, h = wood_D);

		rotate([0, 90, 0]) {
			translate([supportTriangle_H / 4, 0, 0])
				cylinder(r = screwPortHole_R, h = wood_D);

			translate([supportTriangle_H * 3 / 4, 0, 0])
				cylinder(r = screwPortHole_R, h = wood_D);
		}
	}
}

module twoByFourLong() {

	cube([wood2_D, twoByFour1_L, wood2_H]);
}

module twoByFourShort() {

	cube([wood2_D, twoByFour2_L, wood2_H]);
}
