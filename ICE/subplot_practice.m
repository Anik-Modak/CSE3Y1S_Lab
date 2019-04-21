function  out_img  = histEqualization( in_img)
%gammaCurve function: generating a new image out_img after applying
% histogram equalization on it
%  -Usage-
%	 out = histEqualization(in)
%
%  -Inputs-
%	 in_img: original grayscale image (uint8)
%
%  -Outputs-
%	 out_img: Adjusted grayscale image after applying histogram equalization(uint8)
%number of levels
L=256;
%check if the image is gray or not
if(size(in_img,3)>1)
    in_img=rgb2gray(in_img);
    %inform the user
    display('The image is converted to grayscale image');
    %show the grayscale version of the image
    figure;
    imshow(in_img);
    title('Original Image (Grayscale)');
end
%build up the lookup table s
%s=(L-1)*CDF(p)
%[counts,bins]=imhist(in_img); %calc histogram of the given image
%or we can get it without using imhist
counts=zeros(256,1);
for i=0:255
    counts(i+1)=sum(sum(in_img==i));
end
%calc PDF of the image
p=counts/(size(in_img,1)*size(in_img,2));
%calc s=(L-1)*CDF(p)
s=(L-1)*cumsum(p);
%round the float into the nearest integare
s=round(s);
%Map the value of s to corresponding pixels in the image
out_img=uint8(zeros(size(in_img)));
for k=1:size(s,1)
    out_img(in_img==k-1)=s(k);
end
end