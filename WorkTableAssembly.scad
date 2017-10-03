include<WorkTable.scad>;
include<dimensioning.scad>;
include<WorkTableDimensions.scad>;


textHeight = 1*in;
lineThickness = textHeight / 7;

WorkTable();


color("Black") {

	//Long Table Name
	translate([table_D / 2, space_W / 2, table_H])
		rotate([0, 90, 0])
			rotate([0, 0, 90])
				linear_extrude(1)
					Anotation([5*in, 5*in], "Long Table", textHeight, lineThickness);

	//short Table name
	translate([space_D / 2, table_D / 2, table_H])
		rotate([-90, 0, 0])
			rotate([0, 0, 180])
				linear_extrude(1)
					Anotation([-5*in, 5*in], "Short Table", textHeight, lineThickness);

	//tableConnector name
	translate([sqrt(pow(tableConnector2Spacing, 2) / 2), sqrt(pow(tableConnector2Spacing, 2) / 2), table_H - wood_D * 2])
		rotate([0, 90, 0])
			rotate([0, 0, 90])
				linear_extrude(1)
					Anotation([5*in, -5*in], "Table Connector", textHeight, lineThickness);
	
	//TableConnector Spacings
	translate([0, 0, table_H - wood_D * 2 - supportTriangle_H - textHeight])
		rotate([0, 90, -45])
			rotate([0, 0, 90])
				linear_extrude(1)
					LinearDimension(tableConnector1Spacing - tableConnector_W / 2, in, textHeight, lineThickness, extention = supportTriangle_H + wood_D/*, offset = -10*in*/);

	translate([0, 0, table_H - wood_D * 2 - supportTriangle_H - textHeight * 2])
		rotate([0, 90, -45])
			rotate([0, 0, 90])
				linear_extrude(1)
					LinearDimension(tableConnector2Spacing - tableConnector_W / 2, in, textHeight, lineThickness, extention = supportTriangle_H + wood_D + textHeight/*, offset = -16*in*/);

	translate([0, 0, table_H - wood_D * 2 - supportTriangle_H])
		rotate([0, 180, 180])
			linear_extrude(1)
				AngleDimension(270, 45, 5*in, textHeight, lineThickness);

	//support Top name
	translate([support4Spacing + supportRectangle_W / 2, wood2_D + wood_D + supportTriangle_H / 2, table_H - wood_D * 1.5])
		rotate([-90, 0, 0])
			rotate([0, 0, 180])
				linear_extrude(1)
					Anotation([-17*in, -7*in], "Support Top", textHeight, lineThickness);

	//support back name
	translate([support4Spacing + supportRectangle_W / 2, wood2_D + wood_D / 2, table_H - wood_D * 2 - supportTriangle_H / 2])
		rotate([-90, 0, 0])
			rotate([0, 0, 180])
				linear_extrude(1)
					Anotation([-5*in, -7*in], "Support Back", textHeight, lineThickness);

	//Support Triangle name
	translate([support4Spacing, supportTriangle_H / 2 + wood_D + wood2_D, table_H - wood_D * 2 - supportTriangle_H / 2])
		rotate([0, 90, 0])
			rotate([0, 0, 90])
				linear_extrude(1)
					Anotation([5*in, -10*in], "Support Triangle", textHeight, lineThickness);

	//supportRectangle to triangle relationship
	translate([wood2_D + wood_D, support2Spacing - supportRectangle_W / 2, table_H - wood_D * 2 - supportTriangle_H - textHeight])
		rotate([0, 90, 0])
			rotate([0, 0, 90])
				linear_extrude(1)
					LinearDimension(supportRectangle_W - wood_D * 2, in, textHeight, lineThickness/*, offset = 7*in*/);

	//supportTriangle Spacings

	//	long side
	translate([wood2_D, 0, table_H - wood_D * 2 - supportTriangle_H - textHeight * 3])
		rotate([0, 90, 0])
			rotate([0, 0, 90])
				linear_extrude(1)
					LinearDimension(support1Spacing - supportRectangle_W / 2, in, textHeight, lineThickness, extention = textHeight * 2);

	translate([wood2_D, 0, table_H - wood_D * 2 - supportTriangle_H - textHeight * 4])
		rotate([0, 90, 0])
			rotate([0, 0, 90])
				linear_extrude(1)
					LinearDimension(support2Spacing - supportRectangle_W / 2, in, textHeight, lineThickness, extention = textHeight * 3);

	//	short side
	translate([(support3Spacing - wood2_D - supportRectangle_W / 2) + wood2_D, 0, table_H - wood_D * 2 - supportTriangle_H - textHeight * 3])
		rotate([-90, 0, 0])
			rotate([0, 0, 180])
				linear_extrude(1)
					LinearDimension(support3Spacing - wood2_D - supportRectangle_W / 2, in, textHeight, lineThickness, extention = textHeight * 2);

	translate([(support4Spacing - wood2_D - supportRectangle_W / 2) + wood2_D, 0, table_H - wood_D * 2 - supportTriangle_H - textHeight * 4])
		rotate([-90, 0, 0])
			rotate([0, 0, 180])
				linear_extrude(1)
					LinearDimension(support4Spacing - wood2_D - supportRectangle_W / 2, in, textHeight, lineThickness, extention = textHeight * 3);

	//2x4 long name
	translate([wood2_D / 2, space_W, table_H - wood_D - wood2_H / 2])
		rotate([0, 90, 0])
			rotate([0, 0, 90])
				linear_extrude(1)
					Anotation([5*in, -5*in], "2x4 Long", textHeight, lineThickness);

	//2x4 short name
	translate([space_D, wood2_D / 2, table_H - wood_D - wood2_H / 2])
		rotate([-90, 0, 0])
			rotate([0, 0, 180])
				linear_extrude(1)
					Anotation([-13*in, -5*in], "2x4 Short", textHeight, lineThickness);

	//from short to long 2x4
	translate([0, space_W, table_H - wood_D - wood2_H])
		rotate([-90, 0, 0])
			rotate([0, 90, 0])
				rotate([0, 0, 90])
					linear_extrude(1)
						LinearDimension(supportTriangle_H - (wood2_H - wood_D), in, textHeight, lineThickness/*, offset = supportTriangle_H*/);




}
