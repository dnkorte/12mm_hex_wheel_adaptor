/*
 * Module: project_12mm_hex_wheel_adaptors.scad
 * this generates an adaptor the connects standard RC wheel 12mm hex nut
 *   wheels to standard robotics motor hubs  
 *
 *   NOTE that hub adaptors should be printed slowly -- about 50% normal print speed 
 *
 * Author(s): Don Korte 
 *
 * github: https://github.com/dnkorte/
 *  
 * MIT License
 * 
 * Copyright (c) 2022 Don Korte
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */


/* [What PART do you want to model?] */
part = "12mm_4mm_adaptor";  // [ "12mm_6mm_adaptor", "12mm_5mm_adaptor", "12mm_4mm_adaptor", "12mm_TT_adaptor" ]

/* [Length of motor shaft] */
// length of "round" part of adaptor that surrounds axle
hub_len = 15;   // [12, 15, 18, 20 ]

/* [Grub Screw Locations] */
// distance of "first" grub screw from end of adaptor
grubscrew_dist_from_end = 3;    // [ 3, 4, 5, 6 ]
// distance between grub screws
grubscrew_separation = 6;       // [ 5, 6, 7, 8 ] 

draw_part();

module draw_part() {
    $fn = 24;

    if (part == "12mm_6mm_adaptor") {
        draw_12mm_6mm_adaptor();
    }
    if (part == "12mm_5mm_adaptor") {
        draw_12mm_5mm_adaptor();
    }
    if (part == "12mm_4mm_adaptor") {
        draw_12mm_4mm_adaptor();
    }
    if (part == "12mm_TT_adaptor") {
        draw_12mm_TT_adaptor();
    }
}
/*
 * hub adaptor parameters that are not displayed in OpenScad Customizer
 */

// standard parameters for all parts
screwhole_radius_M30_passthru = 2;  
screwhole_radius_M30_selftap = 1.45;
axle_clearance_gap = 0.6;   // allowance for 3d printer "slop" + slide fit


// parameters for the 12mm nut
screwhole_dia_wheel_attachment_screw = (screwhole_radius_M30_selftap * 2);
width_across_flats = 11.6;
nut_thick = 4;



module draw_12mm_6mm_adaptor() {
    motor_shaft_dia = 6 + axle_clearance_gap;
    hub_dia = motor_shaft_dia + 5.5;

    g1 = hub_len - grubscrew_dist_from_end;
    g2 = hub_len - grubscrew_dist_from_end - grubscrew_separation;

    make_hex_nut(width_across_flats, nut_thick, screwhole_dia_wheel_attachment_screw);
    
    translate([ 0, 0, nut_thick ]) difference() {
        union() {
            cylinder(d=hub_dia, h=hub_len);
            translate([ 0, -(hub_dia+3)/2, g1 ]) rotate([  -90, 0, 0  ])  cylinder( d=5, h=hub_dia+3);
            translate([ 0, -(hub_dia+3)/2, g2 ]) rotate([  -90, 0, 0  ])  cylinder( d=5, h=hub_dia+3);
        }
        translate([ 0, 0, -0.1 ]) cylinder(d=motor_shaft_dia, h=hub_len + 0.2);
        translate([ 0, -((hub_dia+3)/2)-0.1, g1 ]) rotate([  -90, 0, 0  ])  cylinder( r= screwhole_radius_M30_selftap, h=hub_dia+3.2);
        translate([ 0, -((hub_dia+3)/2)-0.1, g2 ]) rotate([  -90, 0, 0  ])  cylinder( r= screwhole_radius_M30_selftap, h=hub_dia+3.2);
    } 
}


module draw_12mm_5mm_adaptor() {
    motor_shaft_dia = 5 + axle_clearance_gap;
    hub_dia = motor_shaft_dia + 5.5;

    g1 = hub_len - grubscrew_dist_from_end;
    g2 = hub_len - grubscrew_dist_from_end - grubscrew_separation;


    make_hex_nut(width_across_flats, nut_thick, screwhole_dia_wheel_attachment_screw);
    
    translate([ 0, 0, nut_thick ]) difference() {
        union() {
            cylinder(d=hub_dia, h=hub_len);
            translate([ 0, -(hub_dia+3)/2, g1 ]) rotate([  -90, 0, 0  ])  cylinder( d=5, h=hub_dia+3);
            translate([ 0, -(hub_dia+3)/2, g2 ]) rotate([  -90, 0, 0  ])  cylinder( d=5, h=hub_dia+3);
        }
        translate([ 0, 0, -0.1 ]) cylinder(d=motor_shaft_dia, h=hub_len + 0.2);
        translate([ 0, -((hub_dia+3)/2)-0.1, g1 ]) rotate([  -90, 0, 0  ])  cylinder( r= screwhole_radius_M30_selftap, h=hub_dia+3.2);
        translate([ 0, -((hub_dia+3)/2)-0.1, g2 ]) rotate([  -90, 0, 0  ])  cylinder( r= screwhole_radius_M30_selftap, h=hub_dia+3.2);
    } 
}

module draw_12mm_4mm_adaptor() {
    motor_shaft_dia = 4 + axle_clearance_gap;
    hub_dia = motor_shaft_dia + 5.5;

    g1 = hub_len - grubscrew_dist_from_end;
    g2 = hub_len - grubscrew_dist_from_end - grubscrew_separation;


    make_hex_nut(width_across_flats, nut_thick, screwhole_dia_wheel_attachment_screw);
    
    translate([ 0, 0, nut_thick ]) difference() {
        union() {
            cylinder(d=hub_dia, h=hub_len);
            translate([ 0, -(hub_dia+3)/2, g1 ]) rotate([  -90, 0, 0  ])  cylinder( d=5, h=hub_dia+3);
            translate([ 0, -(hub_dia+3)/2, g2 ]) rotate([  -90, 0, 0  ])  cylinder( d=5, h=hub_dia+3);
        }
        translate([ 0, 0, -0.1 ]) cylinder(d=motor_shaft_dia, h=hub_len + 0.2);
        translate([ 0, -((hub_dia+3)/2)-0.1, g1 ]) rotate([  -90, 0, 0  ])  cylinder( r= screwhole_radius_M30_selftap, h=hub_dia+3.2);
        translate([ 0, -((hub_dia+3)/2)-0.1, g2 ]) rotate([  -90, 0, 0  ])  cylinder( r= screwhole_radius_M30_selftap, h=hub_dia+3.2);
    } 
}

module draw_12mm_TT_adaptor() {
    TT_shaft_dia = 5.3 + axle_clearance_gap;
    TT_shaft_flatwidth = 3.8 + axle_clearance_gap;
    hub_dia = 12;

    g1 = hub_len - grubscrew_dist_from_end;
    g2 = hub_len - grubscrew_dist_from_end - grubscrew_separation;

    make_hex_nut(width_across_flats, nut_thick, screwhole_dia_wheel_attachment_screw);
    
    translate([ 0, 0, nut_thick ]) difference() {
        union() {
            cylinder(d=hub_dia, h=hub_len);
            translate([ 0, -(hub_dia+3)/2, g1 ]) rotate([  -90, 0, 0  ])  cylinder( d=5, h=hub_dia+3);
            translate([ 0, -(hub_dia+3)/2, g2 ]) rotate([  -90, 0, 0  ])  cylinder( d=5, h=hub_dia+3);
        }
        translate([ 0, 0, -0.1 ]) shaft_flat(TT_shaft_dia, TT_shaft_flatwidth, hub_len + 0.2, orientation="wide");

        translate([ 0, -((hub_dia+3)/2)-0.1, g1 ]) rotate([  -90, 0, 0  ])  cylinder( r= screwhole_radius_M30_selftap, h=hub_dia+3.2);
        translate([ 0, -((hub_dia+3)/2)-0.1, g2 ]) rotate([  -90, 0, 0  ])  cylinder( r= screwhole_radius_M30_selftap, h=hub_dia+3.2);
    } 
}


/*
 * module prism generates a basic "wedge" shape that can be used vertically to make support-less
 * 3d-printable shelves; this is defined in openSCAD documetation at:
 *      https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Primitive_Solids
 */

module prism(l, w, h){
   polyhedron(
           points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [l,w,h]],
           faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
           );
}

/*
 * ***************************************************************************
 * module shaft_flat() makes a flattened shaft
 * this is a round cylinder, with flats on 2 sides (ie for a TT motor)
 *  
 * this is generated in xy plane, centered at origin, pointed "up" (towards + Z)
 * it should be "added" to design, there are no holes needed at placement level
 *
 * for TT motor, assume actual 5.3 diameter, with flatwidth 3.8mm;  but leave clearance gap too
 *
 * parameters:
 *      diameter    diameter of round part of shaft, in mm
 *      flatwidth   dimension across flat part in mm (flat-to-flat)
 *      length      length (or height) of shaft
 *      orientation "tall" or "wide" 
 *          (for tall, initial flats are on left/right (+/- x sides))
 * ***************************************************************************
 */
module shaft_flat(diameter, flatwidth, length, orientation="tall") {
    remove_from_each_side = (diameter - flatwidth) / 2;

    if (orientation == "tall") {
        difference() {
            cylinder(r=(diameter/2), h=length);
            translate([ -(diameter/2), -(diameter/2), -0.1 ]) 
                cube([ remove_from_each_side, diameter, length+0.2 ]);
            translate([ (diameter/2)-remove_from_each_side, -(diameter/2), -0.1 ]) 
                cube([ remove_from_each_side, diameter, length+0.2 ]);
        }
    } else {
        rotate([ 0, 0, -90 ]) difference() {
            cylinder(r=(diameter/2), h=length);
            translate([ -(diameter/2), -(diameter/2), -0.1 ]) 
                cube([ remove_from_each_side, diameter, length+0.2 ]);
            translate([ (diameter/2)-remove_from_each_side, -(diameter/2), -0.1 ]) 
                cube([ remove_from_each_side, diameter, length+0.2 ]);
        }
    }
}

/*
 * hex nut generator, from
 * https://github.com/chrisspen/openscad-extra
 */


module make_hex_nut(w, h, d=0){
    // d = inner diameter
    // w = width across the flats
    // h = height or thickness
    s = w/sqrt(3);
    $fn = 100;
    
    translate([ 0, 0, h/2 ]) difference(){
        union(){
            for(i=[0:1:2]){
                rotate([0,0,120*i])
                cube([w, s, h], center=true);
            }
        }
        if(d){
            cylinder(d=d, h=h+1, center=true);
        }
    }
}