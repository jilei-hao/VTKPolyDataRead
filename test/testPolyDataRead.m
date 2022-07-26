% Test vtk_polydata_read.m
addpath("../");

poly0 = vtk_polydata_read("./data/cube42.vtk");


%% Test 1: Line Break contains Carriage Return
poly1 = vtk_polydata_read("./data/cube42_CRLF.vtk");
result = compare_polydata(poly0, poly1);
assert(result.isEqual, "Result does not equal to expected. Breaking Items: " ...
    + result.breakingItems);


%% Test 2: Offset-Connectivity in version >= 5.1 (Polygons)
poly1 = vtk_polydata_read("./data/cube51.vtk");
result = compare_polydata(poly0, poly1);
assert(result.isEqual, "Result does not equal to expected. Breaking Items: " ...
    + result.breakingItems);

%% Test 3: Offset-Connectivity in version >= 5.1 (Vertices)
vert42 = vtk_polydata_read("./data/vert42.vtk");
vert51 = vtk_polydata_read("./data/vert51.vtk");
result = compare_polydata(vert42, vert51);
assert(result.isEqual, "Result does not equal to expected. Breaking Items: " ...
    + result.breakingItems);