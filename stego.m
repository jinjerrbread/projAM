% Generate the stego image
cover = imread('mr.jpg');
[ stegoz ] = steg_encode(cover, 123, 'Hello World!');
imwrite(stegoz, 'stego.png');

% Extract the secret message
stegod = imread('stego.png');
[ message1 ] = steg_decode(stego, 123);

% Extract the secret message from the altered stego image
%stego = imread('examples/stego_modified.png');
%[ message2 ] = steg_decode(stego, 123);