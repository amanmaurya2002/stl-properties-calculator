% Sum up area and volume of each triangle and tetrahedron
function [volume,area] = stlvolume(vertices)
  volume = 0;
  area = 0;
  for face = 1:length(vertices)
    v1 = vertices(1:3,face);
    v2 = vertices(4:6,face);
    v3 = vertices(7:9,face);
    volume = volume + tetrahedron_volume(v1,v2,v3);
    area = area + tri_area(v1,v2,v3);
  endfor
