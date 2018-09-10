function createfigure(cdata1)
%CREATEFIGURE(CDATA1)
%  CDATA1:  image cdata

%  由 MATLAB 于 22-Dec-2017 10:51:12 自动生成

% 创建 figure
figure('OuterPosition',[754 274 576 514]);

% 创建 axes
axes1 = axes;
hold(axes1,'on');

% 创建 image
image(cdata1,'CDataMapping','scaled');

% 取消以下行的注释以保留坐标轴的 X 范围
% xlim(axes1,[0.5 625.5]);
box(axes1,'on');
axis(axes1,'ij');
% 设置其余坐标轴属性
set(axes1,'DataAspectRatio',[1 1 1],'Layer','top','PlotBoxAspectRatio',...
    [434 342.3 1.57741935483871]);
