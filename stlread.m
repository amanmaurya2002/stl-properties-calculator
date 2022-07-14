function [vertices, num_faces, title] = stlread(filename)
% This function reads an STL file in binary format into matrixes vertices and faces.
% Refrence: https://en.wikipedia.org/wiki/STL_(file_format)#Binary_STL

% Process arguments 
if nargout > 3
    error('Too many output arguments');
end

% Open the file, assumes STL Binary format. 
if ( fid = fopen(filename, 'r') ) == -1;
    error('File could not be opened, check name or path.')
end

% Read in header 
title = fread(fid, 80, 'uchar=>schar'); % Read file title
num_faces = fread(fid, 1, 'int32'); % Read number of Facets

% Preallocate memory to save running time 
vertices = zeros( 3 * num_faces, 3 );
faces    = zeros(     num_faces, 3 );

% Read in packed data for each face 
coord_sz = 12;
color_sz = 2;
block_sz = 50;

% get the start of where the face data is in the file
fid_face_data_start = ftell( fid );

% Read norm of the face [1*coord_sz] 
start_offset = 0; % at fid_face_data_start + 0

start_offset = start_offset + 1*coord_sz;
% Read all 3 vertices of each face [3*coord_sz] 
% Each column is the 3 vertices with 3 coords each for each face
% face_vertices =
%       f1_v_1x  f2_v_1x ... fN_v_1x
%       f1_v_1y  f2_v_1y ... fN_v_1y
%       f1_v_1z  f2_v_1z ... fN_v_1z
%       f1_v_2x  f2_v_2x ... fN_v_2x
%       f1_v_2y  f2_v_2y ... fN_v_2y
%       f1_v_2z  f2_v_2z ... fN_v_2z
%       f1_v_3x  f2_v_3x ... fN_v_3x
%       f1_v_3y  f2_v_3y ... fN_v_3y
%       f1_v_3z  f2_v_3z ... fN_v_3z
fseek( fid, fid_face_data_start + start_offset );
vertices = fread( fid, [3*3, num_faces], '9*float32', block_sz - 3*coord_sz );

fclose(fid);