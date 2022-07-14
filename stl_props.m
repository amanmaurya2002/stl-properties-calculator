function main = stl_props(filename)

% cure file location
filename = strcat('stl_files/', filename);
% Get properties
[vertices, num_faces, title] = stlread(filename);
[volume, area] = stlvolume(vertices);

% Print properties
fprintf('\nTitle: %s\n', char(title'));
fprintf('Facets: %d\n', num_faces);
fprintf('Volume: %d cm3\n', volume);
fprintf('Area: %d cm2\n', area);
