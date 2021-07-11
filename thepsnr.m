ref = imread('Rit.png');
A = imread('Final_output.png');

peaksnr = psnr(A, ref);
meanse = immse(A, ref);

fprintf('\n The Peak-SNR value is %0.4f', peaksnr);
fprintf('\n The MSE value is %0.4f', meanse);