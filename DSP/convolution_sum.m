
x=[3 2 1 2];
h=[1 2 1 2];

n = length(x) + length(h)-1;

x=[x zeros(1,n-length(x))];
h=[h zeros(1,n-length(h))];
y=zeros(1,n);

for i=1 : n
    for j=1 : i
        y(i) = y(i) + x(j) * h(i-j+1);
    end
end

disp(y);
prompt = 'Enter your index: ';
index = input(prompt);
disp(y(index+2));

    


