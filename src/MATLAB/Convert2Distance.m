AVG_DIST = 10.0 ; % an arbitrary distance

%% Find the average IF	
    avgIF = 0.0;
    for i= 1:length(lstCons)
       avgIF =avgIF + lstCons(i,3);
    end
    avgIF = avgIF./length(lstCons);    
    
   maxIF = 0.0;
 %% scale average distance to AVG_DIST
 avgDist = 0.0;
 avgAdjIF = 0.0;
 avgAdjCount = 0;
 totalIF = 0;
  for i= 1:length(lstCons)
       x = lstCons(i,1);       y = lstCons(i,2);      IF = lstCons(i,3);
      lstCons(i,3) = IF./avgIF;   % normallize IF by avgIF
      IF = lstCons(i,3);
      dist = 1./( IF^CONVERT_FACTOR);
      avgDist = avgDist + dist;
      
      totalIF = totalIF +  IF;
      
      if ( IF > maxIF)
			maxIF = lstCons(i,3);
      end
      
      % Find the adjacent position IF
      if ( abs(x-y)==1)
          avgAdjCount= avgAdjCount+1;
          avgAdjIF =  avgAdjIF + IF;
      end
      
  end
 
avgDist = avgDist./length(lstCons);
avgAdjIF =avgAdjIF./avgAdjCount;

maxIF = min(avgAdjIF,maxIF);

%% Add adjacent if none exist
i = 1;
 while (i < n)     
     f = find(lstCons(:,1)== i & lstCons(:,2)== i+1);
     if (isempty(f))
         x = i; y = i+1; IF = avgAdjIF;
         newCons = [x y IF];
         lstCons = [lstCons ; newCons];
     else
          IF = lstCons(f,3);
          if (IF < avgAdjIF )
              lstCons(f,3) = avgAdjIF;
          end
     end
     i = i + 1;
 end
 fprintf('Added missing adjacent constraint...\n');
 
 
  %%  
   fprintf('Number of constraints: = %d\n', length(lstCons));
    maxD = 0;
    for i= 1:length(lstCons)
        IF = lstCons(i,3);
        dist = AVG_DIST./ ((IF^CONVERT_FACTOR)* avgDist);
        lstCons(i,4) = dist;
        if (dist > maxD)
            maxD = dist;
        end
    end
    fprintf('Max distance is: = %f\n', maxD); 
    
		