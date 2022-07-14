% calculate area of a triangle given coordites of vertices in 3d space
function area = tri_area(v1,v2,v3)
  
  % Reference: https://en.wikipedia.org/wiki/Triangle#Using_coordinates
  a = det([v1(1) v2(1) v3(1); v1(2) v2(2) v3(2); 1 1 1])^2;
  b = det([v1(2) v2(2) v3(2); v1(3) v2(3) v3(3); 1 1 1])^2;
  c = det([v1(3) v2(3) v3(3); v1(1) v2(1) v3(1); 1 1 1])^2;
  area = (1/2)*sqrt(a+b+c);