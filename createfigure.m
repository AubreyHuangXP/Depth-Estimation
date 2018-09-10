function createfigure(cdata1)
%CREATEFIGURE(CDATA1)
%  CDATA1:  image cdata

%  �� MATLAB �� 22-Dec-2017 10:51:12 �Զ�����

% ���� figure
figure('OuterPosition',[754 274 576 514]);

% ���� axes
axes1 = axes;
hold(axes1,'on');

% ���� image
image(cdata1,'CDataMapping','scaled');

% ȡ�������е�ע���Ա���������� X ��Χ
% xlim(axes1,[0.5 625.5]);
box(axes1,'on');
axis(axes1,'ij');
% ������������������
set(axes1,'DataAspectRatio',[1 1 1],'Layer','top','PlotBoxAspectRatio',...
    [434 342.3 1.57741935483871]);
