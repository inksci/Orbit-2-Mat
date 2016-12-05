clear;close all;clc
exec;
work;

addpath(genpath(pwd))
disp('============  由r2,v2计算轨道根数（此处使用开源代码）   ================')
[el, E, f]=RV2El(r2,v2,mu);
disp('============  依次为：长半轴长、轨道倾角、升交点赤径、近拱点纬度幅角、偏心率、平近点角   ================')
el(1), el(2:6)