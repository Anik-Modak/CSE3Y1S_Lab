
ara = [1,2,3;4,5,6;7,8,9];
ara2 = [7,8,9;4,5,6;1,2,3];

%ara2 = input(prompt);

ans = zeros(3,3);

%disp(ara*ara2);

for i = 1:3
    for j = 1:3
        ans(i,j) = ara(i,j) + ara2(i,j);
    end
end

disp("Mtrix after sum");
disp(ans);

mult = zeros(3,3);    

for i = 1:3
    for j =     1:3
        for k = 1:3
            mult(i,j) = mult(i,j) + ara(i,k)*ara2(k,j);
        end
    end
end
           
disp("Multiplicatin :")
disp(mult)


