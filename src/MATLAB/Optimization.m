%% Initialize Structure
%=========================================================================
str =  [];
R = [-0.5,0.5];
for i = 1: n
    xyz = rand(1,3)*range(R)+ min(R);   
    str = [str xyz];    
end

%% Variables declaration
%=========================================================================
len = length(str);

Sum_Grad = zeros(1,len);
variables = str;
oldobj = 0;

%% Calculate Objective function [ requires variables and derivatives]
%=========================================================================

Gradient_Calculator; % returns the cost and derivative(change)

%% updateVariables [ use current coordinate and derivatives] 
%=========================================================================
 for i = 1:len
     Sum_Grad(i) =  Sum_Grad(i) + (change(i)^2);
     denum = smooth_factor + Sum_Grad(i);
     adagrad = (LEARNING_RATE * change(i)./sqrt(denum));
     variables(i) = variables(i) +  adagrad;
 end
%=========================================================================
% visualize structure
convert2xyz;
randcolor = rand(1,3);
plot3(xyz(:,1),xyz(:,2),xyz(:,3),'linewidth',2.5,'color',randcolor);
axis image;
xlim([-10 10]);
ylim([-10 10]);
zlim([-10 10]);
grid on;
pause(0.01);

 %% loop until convergence
%=========================================================================
count =0;
oldobj = cost;
converge = isconvergence(change, cost, NEAR_ZERO);
while(count < MAX_ITERATION && ~converge )
    count = count + 1;    
    % Objective function % returns cost and derivative
    Gradient_Calculator;
    newobj = cost;
    % update variables with gradient
     for i = 1:len
         Sum_Grad(i) =  Sum_Grad(i) + (change(i)^2);
         denum = smooth_factor + Sum_Grad(i);
         adagrad = (LEARNING_RATE * change(i)./sqrt(denum));
         variables(i) = variables(i) +  adagrad;
     end     
    
     converge = isconvergence(change, cost, NEAR_ZERO); % Alternative  converge = abs(newobj - oldobj); 
     fprintf('Iteration %1$d, objective function:%2$.5f\n',count, newobj);
     oldobj = newobj;
     % visualize structure
     convert2xyz;
     plot3(xyz(:,1),xyz(:,2),xyz(:,3),'linewidth',2.5,'color',randcolor);
     axis image;
     title([' Iteration:',num2str(count)]);
     xlim([-10 10]);
     ylim([-10 10]);
     zlim([-10 10]);
     grid on;
     pause(0.01);
end
    
