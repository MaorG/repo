function [fitresult, gof] = createFit(XX, YY, ZZ, fitEq)
%CREATEFIT(XX,YY,ZZ)
%  Create a fit.
%
%  Data for 'eee' fit:
%      X Input : XX
%      Y Input : YY
%      Z Output: ZZ
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 19-Dec-2015 14:54:13


%% Fit: 'eee'.
[xData, yData, zData] = prepareSurfaceData( XX, YY, ZZ );

% Set up fittype and options.
ft = fittype( fitEq, 'independent', {'x', 'y'}, 'dependent', 'z' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0.162611735194631 0.118997681558377 0.498364051982143 0.959743958516081 0.340385726666133];

% Fit model to data.
[fitresult, gof] = fit( [xData, yData], zData, ft, opts );

% Plot fit with data.
figure( 'Name', 'eee' );
h = plot( fitresult, [xData, yData], zData );
legend( h, 'eee', 'ZZ vs. XX, YY', 'Location', 'NorthEast' );
% Label axes
xlabel XX
ylabel YY
zlabel ZZ
grid on
view( -54.5, 16.0 );


