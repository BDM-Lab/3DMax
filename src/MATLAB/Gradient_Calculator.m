%% Gradient Calculator
% Initialize
cost =0;
structure = variables;
change = zeros(1,len);
val = 0;

% Calculate the chain rule derivative for the gradient calculation
gradient_chain_calc;

%loop through existing data
 for k= 1:length(lstCons)
      i = lstCons(k,1);    j = lstCons(k,2);    IF = lstCons(k,3);  dist = lstCons(k,4);
       if (IF <= 0)
           continue;
       end
       
       if (abs(i - j) == 1 )
			IF = 1.0 * maxIF;
       end
       
      
       
       x1=structure(i*3-2);  x2=structure(j*3-2);
       y1=structure(i*3-1);  y2=structure(j*3-1);
       z1 =structure(i*3);   z2=structure(j*3);
       str_dist = calEuclidianDist(x1,y1,z1,x2,y2,z2 );     
       
       z = str_dist - dist;
       
       % the remaining part of dv_d(x,y,z)
       
       tmp =   dl_dw * dw_dv * 2 * (z/str_dist);
       
       % objective function       
        val = val  + (z^2);        
        
         
       change(i*3-2) = change(i*3-2) + (tmp * (structure(i*3-2) - structure(j*3-2)));
       change(i*3-1) = change(i*3-1) + (tmp * (structure(i*3-1) - structure(j*3-1)));
       change(i*3) = change(i*3) + (tmp * (structure(i*3) - structure(j*3)));
       
       change(j*3-2) = change(j*3-2) + (tmp * (structure(j*3-2) - structure(i*3-2)));
       change(j*3-1) = change(j*3-1) + (tmp * (structure(j*3-1) - structure(i*3-1)));
       change(j*3) = change(j*3) + (tmp * (structure(j*3) - structure(i*3)));
       
 end
 
 % cost
 cost = -(n/2) - (n*log(sqrt(val/n)));