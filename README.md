# 12mm Hex Nut Wheel Adaptor

<h1 align="center">
	<img width="853" src="https://github.com/dnkorte/12mm_hex_wheel_adaptor/blob/main/images/wheels.jpg" alt="Picture of wheels and adaptors"><br>Sample Wheels and adaptors
</h1>


The RC (Radio Control) cars and truck hobbiest market has made be-zillions of tires/wheels available in various sizes, styles, and materials.  Just go to Amazon or wherever your favorite hobby store to find a huge variety.  The industry has a pretty standard mounting configuration which is based on a 12mm hex nut.  The wheels have a "socket" to hold the 12mm nut, and most RC vehicles have axles (or axle adaptors) that will fit to those nuts.  Typically the wheels attach to the 12mm nut by means of a screw at wheel center.

This project creates 3d-printable hub adaptors that mate those 12mm hex nuts to typical motor shafts used in hobby robotics -- 4mm, 5mm, and 6mm round shafts, as well as the common TT motor flattened shaft.

They are created in OpenSCAD, which is a text-based CAD tool that runs on Windows, Linux, and MAC (download it from https://openscad.org/ if you don't have it already).  Put the file provided here in a folder on your computer, then open it in OpenSCAD.  Note that this tool is setup to use OpenSCAD's "customizer" feature to select the part you want, but this tool is hidden by default.  To show the customizer, just go to OpenSCAD's "View" menu and uncheck the "Hide Customizer" checkbox.

Once the customizer is visible you will see some dropdowns available (probably on the right side of your screen).  Select the "part" you want to create from the "part" dropdown (you can select the 4mm, 5mm, 6mm, or TT shaft version).  You may also select a "hub length" parameter that defines how long the adaptor is (wide tires will need longer adaptors than skinny tires), and the location for the "grub screws" that will help attach the adaptor to your motor shaft.

Whenever you change any of the dropdowns, it will redraw the image on screen.  When you have the adaptor as you wish it, click F6 or "Design/Render" on the menubar to make a finished render of the model, then select "File/Export" to save an .stl file for your printer.

The adaptor has a central hole at the "nut" end that is co-axial to the motor shaft -- this hole accepts an M3 screw to attach the adaptor to the wheel.  All screw holes are designed to be self-tapping for M3 bolts.

If your printer tolerances are different than mine you may adjust the size of the screw holes or the shaft clearance holes by editing the project_12mm_hex_wheel_adaptors.scad file.  The relevant lines are 72 - 74; parameters are screwhole_radius_M30_passthru, screwhole_radius_M30_selftap, and axle_clearance_gap.

The image below shows the OpenSCAD screen.  Note the Customizer menu on the right side.

<h3 align="center">
	<img width="480" src="https://github.com/dnkorte/12mm_hex_wheel_adaptor/blob/main/images/openscad_screen.jpg" alt="Picture of wheels and adaptors"><br>OpenSCAD screen
</h3>

The image below shows a wheel mounted on a motor shaft.
<h3 align="center">
	<img width="480" src="https://github.com/dnkorte/12mm_hex_wheel_adaptor/blob/main/images/mount_hub_to_wheel.jpg" alt="Picture of wheels and adaptors"><br>Wheel mounted on adaptor
</h3>

A couple pre-built .stl files are included in the .stl folder here. Note that the hubs are best printed in the vertical orientation with nut end down.  They should be printed fairly slowly for best results.  
