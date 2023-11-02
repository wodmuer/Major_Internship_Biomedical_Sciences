// make a calibrated image pixel_width = 2.87/842; pixel_height = 2.86/840
Stack.setXUnit("mm");
Stack.setYUnit("mm");
run("Properties...", "channels=1 slices=1 frames=1 pixel_width=0.0034085510688836107 pixel_height=0.003404761904761905 voxel_depth=NaN");


// create 8-bit image, necessary for Auto Threshold
run("8-bit");
run("Auto Threshold", "method=Default");


run("Set Measurements...", "area_fraction redirect=None decimal=3");
run("ROI Manager...");

// measure area fraction of 8 oval regions in the image
makeOval(104, 122, 170, 176);
roiManager("Add");
makeOval(338, 118, 170, 176);
roiManager("Add");
makeOval(556, 114, 170, 176);
roiManager("Add");
makeOval(216, 330, 170, 176);
roiManager("Add");
makeOval(450, 330, 170, 176);
roiManager("Add");
makeOval(96, 552, 170, 176);
roiManager("Add");
makeOval(350, 556, 170, 176);
roiManager("Add");
makeOval(576, 542, 170, 176);
roiManager("Add");

roiManager("Select", newArray(0,1,2,3,4,5,6,7));
roiManager("Measure");

// to install "Read and Write Excel" plugin to ImageJ --> https://imagej.net/plugins/read-and-write-excel
run("Read and Write Excel");
Table.deleteRows(0, 8);

