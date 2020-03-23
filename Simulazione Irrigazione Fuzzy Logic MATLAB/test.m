% function test()

x = zeros();
y = zeros();

figure
hax2=axes

figure;
plot(1:10, ones(1, 10));


for i = 1 : 1 : 100
    x(i) = i;
    y(i) = rand();
    plot(hax2, x, y);
    xlim(hax2, [0, 100]);
    pause(1);
end