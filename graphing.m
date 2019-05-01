x_axis = [25, 50, 100, 150, 200, 250, 300];
a1 = plot(x_axis,Book1(1,:),'-x')
M1 = "K = 200"
hold on
a2 = plot(x_axis,Book1(2,:),'-x')
M2 = "K = 300"
a3 = plot(x_axis,Book1(3,:),'-x')
M3 = "K = 400"
a4 = plot(x_axis,Book1(4,:),'-x')
M4 = "K = 500"
a5 = plot(x_axis,Book1(5,:),'-x')
M5 = "K = 600"
hold off
legend([a1,a2, a3, a4, a5], [M1, M2, M3, M4, M5]);
print('4b','-depsc')
title('Sliding Window Accuracy')
