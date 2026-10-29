clearvars
close all

nodes = [0,0;1,0;1,1;2,0]; numNodes = size(nodes,1);
elem = [1,2,3;3,2,4]; numElem = size(elem,1); numLocalNods = size(elem,2);

xmin = -0.25; xmax = 2.25; ymin = -0.25; ymax = 1.25;

% Plot the nodes and elements
fig = figure();
hold on;
axis equal;
xlim([xmin,xmax]); ylim([ymin,ymax]);
grid on

for e = 1:numElem
    vertexs = nodes(elem(e,:),:);
    xB = sum(vertexs(:,1))/3;
    yB = sum(vertexs(:,2))/3;
    vertexs = [vertexs; nodes(elem(e,1),:)];
    % Draw the edges of the elements
    plot(vertexs(:,1), vertexs(:,2), 'o-', 'LineWidth', 2,...
        'color','black','MarkerFaceColor','white', 'MarkerSize',30);
    elemLabel = ['$\Omega^{',int2str(e),'}$']
    text(xB,yB,elemLabel,'interpreter','LaTeX','FontSize',28,...
        'VerticalAlignment','middle','HorizontalAlignment','center')
    for i=1:numLocalNods
        nod = elem(e,i);
        text(nodes(nod,1), nodes(nod,2), num2str(nod),...
            'VerticalAlignment','middle','HorizontalAlignment',...
            'center','FontSize',18);
    end
end

%Labels for local nodes
%Elem 1
text(0.1,0.05,'$1$','interpreter','LaTeX','FontSize',14,'Color','red')
text(0.9,0.05,'$2$','interpreter','LaTeX','FontSize',14,'Color','red')
text(0.95,0.9,'$3$','interpreter','LaTeX','FontSize',14,'Color','red')
%Elem 2
text(1.03,0.9,'$1$','interpreter','LaTeX','FontSize',14,'Color','red')
text(1.05,0.05,'$2$','interpreter','LaTeX','FontSize',14,'Color','red')
text(1.85,0.05,'$3$','interpreter','LaTeX','FontSize',14,'Color','red')

hold off

% Set title and labels for the plot
%title('Mesh Visualization');
xlabel({'$x$',['Figure 1. Mesh of $\Omega$ ',...
    'corresponding to {\bf nodes } = [0,0;1,0;1,1;2,0] and ',...
    ' {\bf elem} = [1,2,3;3,2,4].']},...
    'Interpreter','LaTeX','FontSize',24);
ylabel('$y$','Interpreter','LaTeX','FontSize',24);

%Export to png
exportgraphics(fig,"../figures/fig-prob-2-mesh.png")

