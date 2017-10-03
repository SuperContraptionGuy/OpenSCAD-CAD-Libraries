include<units.scad>;

wood_D = 1/2*in;

wood2_D = (1 + 1/2)*in;
wood2_H = (3 + 1/2)*in;

screwPortHole_R = 3 / 32*in;
screw_L = 1*in + 1 / 4*in;

space_W = 4*ft + 10*in;
space_D = 3*ft;

table_D = 1*ft + 3*in;
table_H = 3*ft + 6*in;

supportTriangle_H = table_D * 2 / 3 - wood_D;
supportRectangle_W = wood_D * 3;

support1Spacing = space_W / 4;
support2Spacing = space_W * 3 / 4;
support3Spacing = support1Spacing;
support4Spacing = space_D * 3 / 4;

twoByFour1_L = space_W;
twoByFour2_L = space_D - wood2_D;

tableConnector_W = supportRectangle_W;
tableConnector_L = tableConnector_W * 2;
tableConnector1Spacing = sqrt(pow(table_D, 2) + pow(table_D, 2)) / 4;
tableConnector2Spacing = tableConnector1Spacing * 3;
