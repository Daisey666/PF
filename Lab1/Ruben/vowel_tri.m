%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%          Instituto Superior Técnico          % 
%                                              %
%              Speech Processing               %
%                                              %
%                Laboratório - 1               %
%                                              %
%                  Grupo 8                     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all; close all;clc

%% Aluno - José    Diogo - 75255
%           F1       F2
%    a    894.37   1445.51
%    E    487.83   2283.46
%    i    261.22   2519.87
%    O    577.60   999.40
%    u    310.20   788.42
%    6    637.77   1591.57
%    e    461.78   1959.82
%    o    456.89   851.67
%    @    446.21   1801.59

F1 = [894.37 487.83 261.22 577.60 310.20 637.77 461.78 456.89 446.21];
F2 = [1445.51 2283.46 2519.87 999.40 788.42 1591.57 1959.82 851.67 1801.59];

figure;
axis([200 1000 650 2900]);
grid on, hold on,
plot(F1(1,:),F2(1,:), 'b.', 'markersize', 10);

%labelling
vowels = {'a','E','i','O','u','6','e','o','@'};
colors = ['bo'; 'g.' ;'go' ;'c.'; 'co' ;'r.'; 'k.'; 'b.' ;'m.'];
legenda = {'a = (894.37,1445.51)','E = (487.83,2283.46)','i = (261.22,2519.87)','O = (577.60,999.40)','u = (310.20,788.42)','6 = (637.77,1591.57)','e = (461.78,1959.82)','o = (456.89,851.67)','@ = (446.21,1801.59)'};
for i = 1 : numel(F1)
    plot(F1(i),F2(i),colors(i,:), 'markersize', 10);
    text(F1(i)*1.03, F2(i)*1.03, vowels(i));
    legend(legenda)
end

drawline([F1(1) F2(1)] ,[F1(5) F2(5)],'green')
drawline([F1(1) F2(1)] ,[F1(3) F2(3)],'green')
drawline([F1(3) F2(3)] ,[F1(5) F2(5)],'green')

title('Vowels Triangle - {\color{darkgreen}José Diogo}');
xlabel('F1 (Hz)');
ylabel('F2 (Hz)');

%% Aluno - Rúben   Tadeia - 75268
%           F1       F2
%    a    922.68   1392.86
%    E    522.61   2356.33
%    i    353.32   2744.19
%    O    653.50   919.40
%    u    339.48   727.68
%    6    683.58   1623.62
%    e    384.29   2466.26
%    o    400.14   761.36
%    @    363.29   1907.51

F1 = [922.68 522.61 353.32 653.50 339.48 683.58 384.29 400.14 363.29];
F2 = [1392.86 2356.33 2744.19 919.40 727.68 1623.62 2466.26 761.36 1907.51];

figure;
axis([200 1000 650 2900]);
grid on, hold on,

%labelling
vowels = {'a','E','i','O','u','6','e','o','@'};
colors = ['bo'; 'g.' ;'go' ;'c.'; 'co' ;'r.'; 'k.'; 'b.' ;'m.'];
legenda = {'a = (894.37,1445.51)','E = (487.83,2283.46)','i = (261.22,2519.87)','O = (577.60,999.40)','u = (310.20,788.42)','6 = (637.77,1591.57)','e = (461.78,1959.82)','o = (456.89,851.67)','@ = (446.21,1801.59)'};
for i = 1 : numel(F1)
    plot(F1(i),F2(i),colors(i,:), 'markersize', 10);
    text(F1(i)*1.03, F2(i)*1.03, vowels(i));
    legend(legenda)
end

drawline([F1(1) F2(1)] ,[F1(5) F2(5)],'blue')
drawline([F1(1) F2(1)] ,[F1(3) F2(3)],'blue')
drawline([F1(3) F2(3)] ,[F1(5) F2(5)],'blue')


title('Vowels Triangle - {\color{blue}Rúben Tadeia}');
xlabel('F1 (Hz)');
ylabel('F2 (Hz)');


%% Funções Auxiliares

function [] = drawline(p1, p2 ,color)
theta = atan2( p2(2) - p1(2), p2(1) - p1(1));
r = sqrt( (p2(1) - p1(1))^2 + (p2(2) - p1(2))^2);
line = 0:0.01: r;
x = p1(1) + line*cos(theta);
y = p1(2) + line*sin(theta);
plot(x, y , color)
end
