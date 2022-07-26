function result = compare_polydata(poly1,poly2)
% Compare two polydata reading result and return a result
% Usage:
%   result = compare_polydata(poly1, poly2)
% Parameter Structure (for both poly1 and poly2):
%   poly.hdr                   Header information
%   poly.points                N x 3 array of point coordinates
%   poly.cells.(name)          cell array of polygons, lines, etc
%   poly.point_data            Point data arrays, following format:
%   poly.point_data(i).name    Array name
%   poly.point_data(i).type    VTK type (normals,  vectors, field)
%   poly.point_data(i).data    N x K array of values
%   poly.cell_data             Cell data arrays, following format:
%   poly.cell_data(i).name     Array name
%   poly.cell_data(i).type     VTK type (normals,  vectors, field)
%   poly.cell_data(i).data     N x K array of values
% result Structure:
%   result.isEqual             Boolean
%   result.breakingItems       String Array indicating which part is
%                              causing unequal result.

result.isEqual = false;
result.breakingItems = [];

% Compare hdr
if (~isequal(poly1.hdr, poly2.hdr))
    result.breakingItems = [result.breakingItems "hdr"];
end

% Compare Points
if (~isequal(poly1.points, poly2.points))
    result.breakingItems = [result.breakingItems "points"];
end

% Compare Cells
if (~isequal(poly1.cells, poly2.cells))
    result.breakingItems = [result.breakingItems "cells"];
end

% Compare point_data
if (isfield(poly1, "point_data") && ~isequal(poly1.point_data, poly2.point_data))
    result.breakingItems = [result.breakingItems "point_data"];
end

% Compare cell_data
if (isfield(poly1, "cell_data") && ~isequal(poly1.cell_data, poly2.cell_data))
    result.breakingItems = [result.breakingItems "cell_data"];
end

if (isempty(result.breakingItems))
    result.isEqual = true;
end

end