thickness           = 1.5;
innerDiameter       = 44.2;
outerDiameter       = 54.0;

manifoldCorrection  = 0.01;
$fn                 = 80;

difference()
{
    cylinder(d = outerDiameter, h = thickness);
    translate( [0, 0, -manifoldCorrection] )
        cylinder(d = innerDiameter, h = thickness + manifoldCorrection * 2);
}