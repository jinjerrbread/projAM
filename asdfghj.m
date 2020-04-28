% Clear the existing workspace 
clear all; 

% Clear the command window 
clc; 

% Read the input image 
%input = imread('/Users/irinafranciscaion/Desktop/swag.png'); 
input = imread('color.png'); 

% Convert image to greyscale 
input=rgb2gray(input); 

% Resize the image to required size 
input=imresize(input, [512 512]); 

% Message to be embedded 
message='The odd one out between twenty and thirty'; 

% Length of the message where each character is 8 bits 
len = length(message) * 8; 

% Get all the ASCII values of the characters of the message 
ascii_value = uint8(message); 

% Convert the decimal values to binary 
bin_message = transpose(dec2bin(ascii_value, 8)); 

% Get all the binary digits in separate row 
bin_message = bin_message(:); 

% Length of the binary message 
N = length(bin_message); 

% Converting the char array to numeric array 
bin_num_message=str2num(bin_message); 

% Initialize output as input 
output = input; 

% Get height and width for traversing through the image 
height = size(input, 1); 
width = size(input, 2); 

% Counter for number of embedded bits 
embed_counter = 1; 

% Traverse through the image 
for i = 1 : height 
	for j = 1 : width 
		
		% If there are more bits remaining to embed 
		if(embed_counter <= len) 
			
			% Finding Least Significant Bit of the current pixel 
			LSB = mod(double(input(i, j)), 2); 
			
			% Find whether the bit is same or needs to change 
			temp = double(xor(LSB, bin_num_message(embed_counter))); 
			
			% Updating the output to input + temp 
			output(i, j) = input(i, j)+temp; 
			
			% Increment the embed counter 
			embed_counter = embed_counter+1; 
		end
		
	end
end

% Write both the input and output images to local storage 
% Mention the path to a folder here. 
% imwrite(input, '/Users/irinafranciscaion/Desktop/swag.jpg'); 
% imwrite(output, '/Users/irinafranciscaion/Desktop/stegoImage.jpg'); 
% filename = '/Users/irinafranciscaion/Desktop/output_img.csv'; 

imwrite(input, 'color.jpg'); 
imwrite(output, 'stegoImage.jpg'); 
filename = 'output_img.csv'; 

csvwrite(filename, output); 