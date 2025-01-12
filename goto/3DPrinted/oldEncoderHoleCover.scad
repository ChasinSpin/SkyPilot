$fn = 80;

lozenge(33, 14.5, 2.0);
translate( [0, 0, 2.0] )
    lozenge(29.4, 9.2, 3);



module lozenge(length, width, height)
{
    hull()
    {
        translate( [-(length-width)/2, 0, 0] )
            cylinder(d=width, h=height);
        translate( [(length-width)/2, 0, 0] )
            cylinder(d=width, h=height);
    }
}