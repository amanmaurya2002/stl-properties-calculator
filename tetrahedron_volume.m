% Calculate volume of a tetrahedron given coordites of vertices, where one of the vertices lies on origin
function volume = tetrahedron_volume(v1, v2, v3)
  % Reference: https://stackoverflow.com/q/1406029
  v321 = v3(1) * v2(2) * v1(3);
  v231 = v2(1) * v3(2) * v1(3);
  v312 = v3(1) * v1(2) * v2(3);
  v132 = v1(1) * v3(2) * v2(3);
  v213 = v2(1) * v1(2) * v3(3);
  v123 = v1(1) * v2(2) * v3(3);
  volume = (1 / 6) * (-v321 + v231 + v312 - v132 - v213 + v123);