clear all
s_phi = sqrt((0.707)^2+0.5^2);

p1 = errorbar(data(:,1),data(:,2), s_phi, s_phi, data(:,3), data(:,3), "#~>.b");
s1 = errorbar(data(:,1),data(:,6), s_phi, s_phi, data(:,7), data(:,7), "#~>xb");
p2 = errorbar(data(:,1),data(:,4), s_phi, s_phi, data(:,5), data(:,5), "#~>.r");
ylabel('{\it S}_{Probe}-{\it S}_{leer}')
set(p1, 'LineWidth', 2)
set(s1, 'LineWidth', 2)
set(p2, 'LineWidth', 2)
set(s2, 'LineWidth', 2)
%set(leg1,  'FontSize', '5')



P1 = ( data(:,6) - data(:,2) ) ./ ( data(:,6) +  data(:,2));
P2 = ( data(:,8) - data(:,4) ) ./ ( data(:,8) +  data(:,4));

winkel = (30:0.1:150)*pi/180;
winkel2 = (30:0.1:150);
Ray = sin(winkel).^2./(1+cos(winkel).^2);

s_P1 = sqrt( (2*data(:,7).*data(:,2)./( data(:,6) + data(:,2) ).^2 ).^2 +( 2*data(:,3).*data(:,6)./( data(:,6) +  data(:,2)).^2 ).^2 );
s_P2 = sqrt( (2*data(:,9).*data(:,4)./( data(:,8) +  data(:,4) ).^2 ).^2 +( 2*data(:,5).*data(:,8)./( data(:,8) +  data(:,4)).^2 ).^2 );


fig2 = figure ('DefaultAxesFontSize',18);
h1 = errorbar(data(:,1),P1, s_phi, s_phi, s_P1, s_P1, '~>+r');
hold on 
h2 = errorbar(data(:,1),P2, s_phi, s_phi, s_P2, s_P2, '~>+b');
h3 = plot(winkel2, Ray, '--k');

set(h1, 'LineWidth', 2)
set(h2, 'LineWidth', 2)
set(h3, 'LineWidth', 2)
set(fig2, 'Position', [100,100,1200,800])
xlabel('{\it \phi} in °')
ylabel('P')

leg2 = legend( 'Probe 1' , 'Probe 2', 'Rayleighstreuung' );

close all
Matrix = [ P1, s_P1, P2, s_P2 ];

save 'Polarisation.m' Matrix





