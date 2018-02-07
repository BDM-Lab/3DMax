v = 0;
 for k= 1:length(lstCons)
       i = lstCons(k,1);    j = lstCons(k,2);    IF = lstCons(k,3);  dist = lstCons(k,4);
       if (IF <= 0)
           continue;
       end
       % structure distance   
       x1=structure(i*3-2);  x2=structure(j*3-2);
       y1=structure(i*3-1);  y2=structure(j*3-1);
       z1 =structure(i*3);   z2=structure(j*3);
       str_dist = calEuclidianDist(x1,y1,z1,x2,y2,z2 );      
       % dist = IF distance 
       z = ((str_dist-dist)^2);
       v = v + z;
 end


  %% Calculate w
  %------------------------------------------------------------------------
  w = sqrt(v/n);
  %=========================
  % Find dl_dw
  %=========================
  dl_dw = -n/w;
  %=========================
  % Find dw_dv
  %=========================
  dw_dv = 1/(2*sqrt(n*v));
 