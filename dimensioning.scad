include<MCAD/fonts.scad>;
include<units.scad>;


module text(string, textHeight, center=true) {

	font=8bit_polyfont();

	// Find one letter matches from 2nd column (index 1)
	indicies=search(string,font[2],1,1);
	// Letter spacing, x direction.
	x_shift=font[0][0];
	y_shift=font[0][1];
	//echo(theseIndicies);

	textScaler = textHeight / y_shift;
	textWidth = len(indicies)* x_shift * textScaler;

	x = center? 0 : textWidth / 2;

	translate([x, 0, 0])
		scale(textScaler)
			for(i=[0:len(indicies)-1]) translate([i*x_shift-len(indicies)	*x_shift/2,0]) {
				polygon(points=font[2][indicies[i]][6][0],paths=font[2][indicies[i]][6][1]);
			}
			
}

module getTextLength(text, textHeight) {

	font=8bit_polyfont();

	// Find one letter matches from 2nd column (index 1)
	indicies=search(text,font[2],1,1);
	// Letter spacing, x direction.
	x_shift=font[0][0];
	y_shift=font[0][1];
	//echo(theseIndicies);

	textScaler = textHeight / y_shift;
	textWidth = len(indicies)* x_shift * textScaler;
}


module LinearDimension(distance, units, textHeight, lineThickness, offsetIn=0, extention=0, direction=-1, flipText=false) {

	unitsString =
		(units == mm)? "mm": (
		(units == cm)? "cm": (
		(units == m)? "m": (
		(units == in)? "in": (
		(units == ft)? "ft": (
		(units == yd)? "yd": units)))));

	
	distanceScaled = (str(units) == units)? distance : distance / units;
	text=str("( ", distanceScaled, " ", unitsString, " )");

	
	font=8bit_polyfont();

	// Find one letter matches from 2nd column (index 1)
	indicies=search(text,font[2],1,1);
	// Letter spacing, x direction.
	x_shift=font[0][0];
	y_shift=font[0][1];
	//echo(theseIndicies);

	textScaler = textHeight / y_shift;
	textWidth = len(indicies)* x_shift * textScaler;

	offset = (textWidth >= distance && offsetIn == 0)? (direction * (distance / 2 + textWidth / 1.5)): (offsetIn);

	translate([distance / 2 + offset, flipText? textHeight : 0, 0])
		rotate([0, 0, flipText? 180 : 0])
			scale(textScaler)
				for(i=[0:len(indicies)-1]) translate([i*x_shift-len(indicies)	*x_shift/2,0]) {
					polygon(points=font[2][indicies[i]][6][0],paths=font[2][indicies[i]][6][1]);
				}


	translate([0, textHeight / 2 - lineThickness/2])
		square([((distance / 2 + offset) - textWidth / 2), lineThickness]);

	translate([distance / 2 + offset + textWidth / 2, textHeight / 2 - lineThickness/2])
		square([distance - (distance / 2 + offset + textWidth / 2), lineThickness]);

	y = (extention < 0)? extention : 0;

	translate([- lineThickness/2, y])
		square([lineThickness, textHeight + abs(extention)]);

	translate([distance - lineThickness/2, y])
		square([lineThickness, textHeight + abs(extention)]);
}

module AngleDimension(startAngle, angleMeasure, radius, textHeight, lineThickness) {

	text = str(abs(angleMeasure), "*");

	font=8bit_polyfont();

	// Find one letter matches from 2nd column (index 1)
	indicies=search(text,font[2],1,1);
	// Letter spacing, x direction.
	x_shift=font[0][0];
	y_shift=font[0][1];
	//echo(theseIndicies);

	y = (radius * sin(startAngle + angleMeasure / 2)) / sin(90);
	x = (startAngle > 45 || startAngle < -135)? -(sqrt(pow(radius, 2) - pow(y, 2))) : (sqrt(pow(radius, 2) - pow(y, 2)));


	textScaler = textHeight / y_shift;
	textWidth = len(indicies)* x_shift * textScaler;


	translate([-x, -y, 0])
		scale(textScaler)
			for(i=[0:len(indicies)-1]) translate([i*x_shift-len(indicies)	*x_shift/2,0]) {
				polygon(points=font[2][indicies[i]][6][0],paths=font[2][indicies[i]][6][1]);
			}

	rotate([0, 0, startAngle])
		translate([-radius, -lineThickness/2, 0])
			square([radius, lineThickness]);

	rotate([0, 0, startAngle + angleMeasure])
		translate([-radius, -lineThickness/2, 0])
			square([radius, lineThickness]);

//	difference() {
//	
//		circle(radius);
//		circle(radius - lineThickness);
//	}
}

module Anotation(textPos, string, textHeight, lineThickness) {

	font=8bit_polyfont();

	// Find one letter matches from 2nd column (index 1)
	indicies=search(str(string, "  "),font[2],1,1);
	// Letter spacing, x direction.
	x_shift=font[0][0];
	y_shift=font[0][1];
	//echo(theseIndicies);

	textScaler = textHeight / y_shift;
	textWidth = len(indicies)* x_shift * textScaler;
	
	lineEnd = textPos[0] + textWidth / 2 < 0? [textPos[0] + textWidth, textPos[1]] : textPos;

	length = sqrt(pow(lineEnd[0], 2) + pow(lineEnd[1], 2));
	rotation = asin((lineEnd[1] * sin(90)) / (length));

	translate([textPos[0], textPos[1] - textHeight / 2, 0]) {
		if(textPos[0] + textWidth / 2 >= 0) {
			text(str("< ", string), textHeight, false);
		}
		if(textPos[0] + textWidth / 2 < 0) {
			text(str(string, " >"), textHeight, false);
		}
	}

	scale([lineEnd[0] < 0? -1 : 1, 1, 1])
		rotate([0, 0, rotation])
			translate([0, -lineThickness / 2, 0])
				square([length, lineThickness]);
	
}

module DatumDimension(dimensions, units, textHeight, lineThickness, direction=1, flipText=false) {

	for(offset = [1 : len(dimensions)]) {
		translate([0, direction * textHeight * (offset - 1), 0])
			LinearDimension(dimensions[offset - 1], units, textHeight, lineThickness, extention = -direction * textHeight * (offset - 1), direction = -1, flipText = flipText);
	}
}

module HoleNote(diameter, units, textPos, textHeight, lineThickness, depth=0, note="") {

	unitsString =
		(units == mm)? "mm": (
		(units == cm)? "cm": (
		(units == m)? "m": (
		(units == in)? "in": (
		(units == ft)? "ft": (
		(units == yd)? "yd": units)))));

	
	diameter = (str(units) == units)? diameter : diameter / units;
	depth = (str(units) == units)? depth : depth / units;

	notef = note != ""? str(", ", note) : "";

	if(depth != 0) {
		Anotation(textPos, str("DIAM: ", diameter, " ", unitsString, ", DPTH: ", depth, " ", unitsString, notef), textHeight, lineThickness);
	}
	if(depth == 0) {
		Anotation(textPos, str("DIAM: ", diameter, " ", unitsString, ", THRU", notef), textHeight, lineThickness);
	}
}

module CenterPoint(point, radius, lineThickness) {

	translate(point) {

		translate([-radius / 2, -lineThickness / 2])
			square([radius, lineThickness]);

		rotate([0, 0, 90])
			translate([-radius / 2, -lineThickness / 2])
				square([radius, lineThickness]);

		for(i = [0 : 90 : 270]) {

			rotate([0, 0, i])
				translate([radius, -lineThickness / 2])
					square([radius, lineThickness]);
		}
	}
}

























