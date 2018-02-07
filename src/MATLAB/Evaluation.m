% calculate rmse    
SUM = 0.0;

 Len = n * (n - 1) / 2; 
 Dist = zeros(1,Len);
 WishDist = zeros(1,Len);
 count =1;
 
 for k= 1:length(lstCons)
       i = lstCons(k,1);    j = lstCons(k,2);   IF = lstCons(k,3); dist = lstCons(k,4);
       % structure distance   
       x1=structure(i*3-2);  x2=structure(j*3-2);
       y1=structure(i*3-1);  y2=structure(j*3-1);
       z1 =structure(i*3);   z2=structure(j*3);
       str_dist = calEuclidianDist(x1,y1,z1,x2,y2,z2 );
       SUM = SUM + ((str_dist - dist)^2);
       
       % calculate spearman_correlation and Pearson correlation
       if (i~=j && IF > 0 && count<=Len  )     
         Dist(count) = str_dist;
         WishDist(count)= dist;
         count = count + 1;
       end
       
 end
 
 SUM = SUM./length(lstCons);    
 rmse = sqrt(SUM);
          

[SpearmanRHO,PVAL] = corr(Dist',WishDist','Type','Spearman');
fprintf('\nSpearman correlation = %f\n',SpearmanRHO);

%The Pearson correlation rho
[PearsonRHO,PVAL] = corr(Dist',WishDist','Type','Pearson');
fprintf('Pearson correlation = %f\n',PearsonRHO);
  
 
 
 

  