include<units.scad>;
include<WorkTableDimensions.scad>;
include<WorkTableParts.scad>;
include<dimensioning.scad>;


module support() {

	supportTop();
	supportBack();
	translate([wood_D, 0, 0])
		supportTriangle();
}

module WorkTable() {

	translate([0, 0, table_H - wood_D]) {

		longTable();

		translate([0, 0, -wood2_H])
			twoByFourLong();

		translate([0, 0, -supportTriangle_H - wood_D])
			twoByFourLong();

		translate([wood2_D, support1Spacing, -wood_D])
			support();
		translate([wood2_D, support2Spacing, -wood_D])
			support();


		shortTable();

		translate([wood2_D, wood2_D, -wood2_H])
			rotate([0, 0, -90])
				twoByFourShort();

		translate([wood2_D, wood2_D, -supportTriangle_H - wood_D])
			rotate([0, 0, -90])
				twoByFourShort();

		translate([support3Spacing, wood2_D, -wood_D])
			rotate([0, 0, 90])
				support();

		translate([support4Spacing, wood2_D, -wood_D])
			rotate([0, 0, 90])
				support();

		rotate([0, 0, -45])
			translate([0, tableConnector1Spacing, 0])
				tableConnector();

		rotate([0, 0, -45])
			translate([0, tableConnector2Spacing, 0])
				tableConnector();
	}
}

