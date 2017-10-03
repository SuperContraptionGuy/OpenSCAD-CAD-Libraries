include<dimensioning.scad>;
include<WorkTableParts.scad>;
include<WorkTableDimensions.scad>;
include<units.scad>;
include<WorkTable.scad>;


//longTableDimensioned();
//shortTableDimensioned();
//tableConnectorDimensioned();
//supportTopDimensioned();
//supportBackDimensioned();
supportTriangleDimensioned();
//twoByFourLongDimensioned();
//twoByFourShortDimensioned();


module projectInfoText(part, x, y, textHeight) {

	translate([x, y, 0]) {

		text("Project: WorkTable", textHeight);
		translate([0, -textHeight, 0])
			text(str("Part: ", part), textHeight);
		translate([0, -2 * textHeight, 0])
			text("Author: Hudson Kendall", textHeight);
		translate([0, -3 * textHeight, 0])
			text("Date: 07/24/2014", textHeight);
	}
}


module longTableDimensioned() {

	textHeight = 1.4*in;
	lineThickness = textHeight / 7;

	longTable();

	color("Black")
		linear_extrude(1) {

			projectInfoText("Long Table", table_D * 2.5, space_W / 2,  textHeight);
	
			translate([0, space_W, 0])
				LinearDimension(table_D, in, textHeight, lineThickness);

			rotate([0, 0, 90])
				LinearDimension(space_W, in, textHeight, lineThickness);

			AngleDimension(0, 45, 10*in, textHeight, lineThickness);


		}
	
}

module shortTableDimensioned() {

	textHeight = 1.4*in;
	lineThickness = textHeight / 7;

	shortTable();

	color("Black")
		linear_extrude(1) {

			projectInfoText("Short Table", space_D / 2, table_D * 1.5, textHeight);
	
			translate([0, - textHeight, 0])
				LinearDimension(space_D, in, textHeight, lineThickness);

			translate([space_D + textHeight, 0, 0])
				rotate([0, 0, 90])
					LinearDimension(table_D, in, textHeight, lineThickness);

			AngleDimension(0, 45, 10*in, textHeight, lineThickness);
		}
}

module tableConnectorDimensioned() {

	textHeight = 0.1*in;
	lineThickness = textHeight / 7;

	translate([tableConnector_L / 2, tableConnector_W / 2, 0])
		tableConnector();

	color("Black")
		linear_extrude(1) {

			projectInfoText("Table Connector", tableConnector_L / 2, tableConnector_W * 1.5, textHeight);

			translate([0, tableConnector_W, 0])
				DatumDimension([tableConnector_L / 4, tableConnector_L * 3 / 4, tableConnector_L], in, textHeight, lineThickness);


			translate([tableConnector_L, tableConnector_W, 0])
				rotate([0, 0, -90])
					DatumDimension([tableConnector_W / 2, tableConnector_W], in, textHeight, lineThickness, direction = 1, flipText = true);

			CenterPoint([tableConnector_L / 4, tableConnector_W / 2], screwPortHole_R, lineThickness);

			CenterPoint([tableConnector_L * 3 / 4, tableConnector_W / 2], screwPortHole_R, lineThickness);

			translate([tableConnector_L / 4, tableConnector_W / 2])
				HoleNote(screwPortHole_R * 2, in, [-0.5*in, -in], textHeight, lineThickness, note = "Typ.");
		}
}

module supportTopDimensioned() {

	textHeight = 0.2*in;
	lineThickness = textHeight / 7;

	translate([0, supportRectangle_W / 2, -wood_D])
		supportTop();

	color("Black")
		linear_extrude(1) {

			projectInfoText("Support Top", supportTriangle_H / 2, (supportRectangle_W + wood_D) * 1.5, textHeight);

			CenterPoint([supportTriangle_H / 4 + wood_D, supportRectangle_W / 2], screwPortHole_R, lineThickness);

			CenterPoint([supportTriangle_H * 3 / 4 + wood_D, supportRectangle_W / 2], screwPortHole_R, lineThickness);

			translate([supportTriangle_H / 4 + wood_D, supportRectangle_W / 2, 0])
				HoleNote(screwPortHole_R * 2, in, [-0.5*in, -1*in], textHeight, lineThickness, note = "Typ.");

			translate([0, supportRectangle_W, 0])
				DatumDimension([supportTriangle_H / 4 + wood_D, supportTriangle_H * 3 / 4 + wood_D, supportTriangle_H + wood_D], in, textHeight, lineThickness);

			translate([supportTriangle_H + wood_D, supportRectangle_W, 0])
				rotate([0, 0, -90])
					DatumDimension([supportRectangle_W / 2, supportRectangle_W], in, textHeight, lineThickness, flipText = true/*, supportRectangle_W * 1.5*/);
		}
}

module supportBackDimensioned() {

	textHeight = 0.3*in;
	lineThickness = textHeight / 7;

	translate([supportTriangle_H, supportRectangle_W / 2, 0])
		rotate([0, 90, 0])
			supportBack();

	color("Black")
		linear_extrude(1) {

			projectInfoText("Support Back", supportTriangle_H / 2, supportRectangle_W * 3, textHeight);

			CenterPoint([supportTriangle_H / 4, supportRectangle_W / 2], screwPortHole_R, lineThickness);

			CenterPoint([supportTriangle_H * 3 / 4, supportRectangle_W / 2], screwPortHole_R, lineThickness);

			translate([supportTriangle_H / 4, supportRectangle_W / 2])
				HoleNote(screwPortHole_R * 2, in, [-in, -in], textHeight, lineThickness, note = "Typ.");

			translate([0, supportRectangle_W, 0])
				DatumDimension([supportTriangle_H / 4, supportTriangle_H * 3 / 4, supportTriangle_H], in, textHeight, lineThickness);

			translate([supportTriangle_H, supportRectangle_W, 0])
				rotate([0, 0, -90])
					DatumDimension([supportRectangle_W / 2, supportRectangle_W], in, textHeight, lineThickness, flipText = true);
		}
}

module supportTriangleDimensioned() {

	textHeight = 0.5*in;
	lineThickness = textHeight / 7;

	translate([0, 0, -wood_D / 2])
		rotate([90, 0, 0])
			supportTriangle();
			
	translate([-wood_D * 7, 0, 0])
		rotate([0, 0, 90])
			supportTriangle();

	translate([0, -wood_D * 7, 0])
		rotate([0, 0, 0])
			supportTriangle();

	color("Black")
		linear_extrude(1) {

			projectInfoText("Support Triangle", supportTriangle_H, supportTriangle_H * 3 / 4, textHeight);

			translate([-textHeight, supportTriangle_H, 0])
				rotate([0, 0, -90])
				LinearDimension(supportTriangle_H, in, textHeight, lineThickness);

				
			translate([-wood_D * 7, 0, 0]) {

				translate([0, supportTriangle_H / 4, 0]) {
				HoleNote(screwPortHole_R * 2, in, [-2*in, -3.25*in], textHeight, lineThickness, depth = screw_L - wood_D, note = "Typ.");
			}
			
				rotate([0, 0, 90]) {

					CenterPoint([supportTriangle_H / 4, 0], screwPortHole_R,  lineThickness);
					CenterPoint([supportTriangle_H * 3 / 4, 0], screwPortHole_R, lineThickness);
				}
			}

			translate([0, -wood_D * 7, 0]) {

				CenterPoint([supportTriangle_H / 4, 0], screwPortHole_R,  lineThickness);
				CenterPoint([supportTriangle_H * 3 / 4, 0], screwPortHole_R, lineThickness);
				translate([0, wood_D / 2, 0])
					DatumDimension([supportTriangle_H / 4, supportTriangle_H * 3 / 4], in, textHeight, lineThickness);
			}

			translate([0, supportTriangle_H, 0])
				AngleDimension(-90, 45, 2*in, textHeight, lineThickness);

		}

}

module twoByFourLongDimensioned() {

	textHeight = 1.4*in;
	lineThickness = textHeight / 7;

	rotate([0, 90, 0])
		twoByFourLong();

	color("Black")
		linear_extrude(1) {

			projectInfoText("2x4 Long", wood2_H * 8, space_W / 2, textHeight);

			translate()
				rotate([0, 0, 90])
					LinearDimension(space_W, in, textHeight, lineThickness);
		}
}

module twoByFourShortDimensioned() {

	textHeight = 1.4*in;
	lineThickness = textHeight / 7;

	rotate([0, 90, 0])
		twoByFourShort();

	color("Black")
		linear_extrude(1) {

			projectInfoText("2x4 Short", wood2_H * 8, space_D / 2, textHeight);

			translate([-textHeight, space_D - wood2_D, 0])
				rotate([0, 0, -90])
					LinearDimension(space_D - wood2_D, in, textHeight, lineThickness);
		}
}

module workTableDimensioned() {

	textHeight = 1.4*in;
	lineThickness = textHeight / 7;

	WorkTable();

	color("Black")
		translate([ 143.48, 278.74, 785.62 - 10*in])
			rotate([ 73.90, 0.00, 149.60 ])
				linear_extrude(1)
					projectInfoText("Work Table", 0, 0, textHeight);
}














