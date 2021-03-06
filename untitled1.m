function varargout = untitled1(varargin)
% UNTITLED1 MATLAB code for untitled1.fig
%      UNTITLED1, by itself, creates a new UNTITLED1 or raises the existing
%      singleton*.
%
%      H = UNTITLED1 returns the handle to a new UNTITLED1 or the handle to
%      the existing singleton*.
%
%      UNTITLED1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED1.M with the given input arguments.
%
%      UNTITLED1('Property','Value',...) creates a new UNTITLED1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled1

% Last Modified by GUIDE v2.5 25-Apr-2020 16:17:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled1_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled1_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before untitled1 is made visible.
function untitled1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled1 (see VARARGIN)

% Choose default command line output for untitled1
handles.output = hObject;

ah=axes('unit','normalized','position',[0 0 1 1]);
bg=imread('/Users/irinafranciscaion/Desktop/wallies.jpg'); imagesc(bg);
%set(ah,'handlesvisibility','off','visible','off')
handles.output = hObject;

a=ones(300,512); % a-matrice de 300x512 cu valori de 1
axes(handles.axes1); %selctare axe ce contin tag ul axes1
imshow(a); %display matrice pe axele selectate
axes(handles.axes2); 
imshow(a);
axes(handles.axes3); 
imshow(a);
axes(handles.axes4); 
imshow(a);

set(handles.edit3,'String','Encrypted Message');
set(handles.edit5,'String','Decrypted Message');

set(handles.edit6,'String','13');

set(handles.edit7,'String','Encrypted Message');
set(handles.edit8,'String','Decrypted Message');

set(handles.edit9,'String','Encrypted Message');
set(handles.edit10,'String','Decrypted Message');

set(handles.edit11,'String','Encrypted Message');

set(handles.edit12,'String','?????');

set(handles.edit14,'String','Decrypted Message');


%%%%wav de referinta
[handles.file1,fs] = audioread ('/Users/irinafranciscaion/Desktop/irina.wav')
axes(handles.axes2);
dt = 1/fs;
    t = 0:dt:(length(handles.file1)*dt)-dt;
    plot(t,handles.file1); %xlabel('Seconds'); ylabel('Amplitude');


% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%% gender voice recognition
fs=8000;
nbits=16;
nchannels=1;
duration=6;
handles.arObj=audiorecorder(fs, nbits, nchannels);
recordblocking(handles.arObj, duration);
handles.y=getaudiodata(handles.arObj);
ms2 = fs/500;

ms20 = fs/50;

r = xcorr(handles.y, ms20, 'coeff');

d = (-ms20:ms20)/fs;

%plot(d, r);

%title('Autocorrelation');

%xlabel('Delay (s)');

%ylabel('Correlation coeff.');

r = r(ms20 + 1 : 2*ms20+1);

[rmax, tx] = max(r(ms2:ms20));

 Fx = fs/(ms2+tx-1);

 %%?-recognizing voice?

Fth= 160; %% threshold frequency is 160 Hz, you can change this frequency too

if Fx> Fth

    set(handles.edit1,'String','Hello,I see you are a Miss. I will call you Darlene.');
    set(handles.edit16,'String','DARLENE');
    myicon = imread('FSOCIETY.png');
    h2=msgbox('We will jump directly to Level 2, we don?t obey the rules','CLUE 1','custom',myicon);
    %myicon = imread('fsociety.jpg');
    h1=msgbox('Operation Completed, Darlene. You will be given an image, I want you to look closely and remember, there is more than meets the eye','Success','custom',myicon);
    
else

    set(handles.edit1,'String','Hello, I see I am talking to a Mr. I will call you Elliot.');
    set(handles.edit16,'string','ELLIOT');
    myicon = imread('FSOCIETY.png');
    %myicon = imread('fsociety.jpg');
    h4=msgbox('We will jump directly to Level 2, we dont obey the rules','CLUE 1','custom',myicon);
    h3=msgbox('Operation Completed, Elliot. You will be given an image, I want you to look closely and remember, there is more than meets the eye','Success','custom',myicon);
end
guidata(hObject, handles);



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double





% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%%%%xorrr%%%
handles.input=get(handles.edit3,'String')
handles.key=get(handles.edit2,'String')
intermed=dec2bin(double(handles.input))
disp(dec2bin(double(char(handles.key))))
interm_key=dec2bin(double(char(handles.key)))
    if(length(handles.input)>length(handles.key))
        x=length(handles.input)-length(handles.key)+1
        interm_key=repmat(interm_key,x,1)
        interm_key=interm_key(1:length(handles.input),:)
    end
    [m,n]=size(intermed)
    for i=1:m
        for j=1:7
        if(intermed(i,j) ~= interm_key(i,j))
            cipher(i,j)=0;
        else
            cipher(i,j)=1;
        end
            
        end
    end
    
    for i=1:length(handles.input)
    interm_cipher(i)=bin2dec(num2str(cipher(i,:)));
    end
    handles.ex=char(interm_cipher)
    disp(handles.ex)
    set(handles.edit5,'String',handles.ex)
    guidata(hObject, handles);

    


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%%%%xorrr%%%
handles.input=get(handles.edit3,'String')
handles.key=get(handles.edit2,'String')
intermed=dec2bin(double(handles.input))
disp(dec2bin(double(char(handles.key))))
interm_key=dec2bin(double(char(handles.key)))
    if(length(handles.input)>length(handles.key))
        x=length(handles.input)-length(handles.key)+1
        interm_key=repmat(interm_key,x,1)
        interm_key=interm_key(1:length(handles.input),:)
    end
    [m,n]=size(intermed)
    for i=1:m
        for j=1:7
        if(intermed(i,j) ~= interm_key(i,j))
            cipher(i,j)=0;
        else
            cipher(i,j)=1;
        end
            
        end
    end
    
    for i=1:length(handles.input)
    interm_cipher(i)=bin2dec(num2str(cipher(i,:)));
    end
    handles.ex=char(interm_cipher)
    disp(handles.ex)
    set(handles.edit5,'String',handles.ex)
    guidata(hObject, handles);



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit10,'String',matlab.net.base64encode(get(handles.edit9,'String')))
guidata(hObject, handles);


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit10,'String',matlab.net.base64decode(get(handles.edit9,'String')))
guidata(hObject, handles);


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%%%%%%rot13
handles.plainmessage=get(handles.edit7,'String')
for i=1:length(handles.plainmessage)
    if(handles.plainmessage(i) >= 97 && handles.plainmessage(i) <= 122)
        if(handles.plainmessage(i) > 96 && handles.plainmessage(i) < 110)
            handles.ciphermessage(i)=handles.plainmessage(i) + 13;
        else
            handles.ciphermessage(i)=handles.plainmessage(i) - 13;
        end
    else
        if(handles.plainmessage(i) >= 65 && handles.plainmessage(i) <= 90)
            if(handles.plainmessage(i) > 64 && handles.plainmessage(i) < 78)
                handles.ciphermessage(i)=handles.plainmessage(i) + 13;
            else
                handles.ciphermessage(i)=handles.plainmessage(i) - 13;
            end
        end
      
       
    end
    if ((handles.plainmessage(i) > 31 && handles.plainmessage(i) < 65) || (handles.plainmessage(i) > 90 && handles.plainmessage(i) < 97) )
        
    handles.ciphermessage(i)=handles.plainmessage(i);
    end
end
handles.ciphermessage=char(handles.ciphermessage);
set(handles.edit8,'String',handles.ciphermessage);
guidata(hObject, handles);


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.ciphermessage=get(handles.edit7,'String')
for i=1:length(handles.ciphermessage)
    if(handles.ciphermessage(i) >= 97 && handles.ciphermessage(i) <= 122)
        if(handles.ciphermessage(i) >96 && handles.ciphermessage(i) < 110)
        handles.plainmessage(i)=handles.ciphermessage(i) + 13;
    else
        handles.plainmessage(i)=handles.ciphermessage(i) - 13;
        
        end
    else
        if(handles.ciphermessage(i) >= 65 && handles.ciphermessage(i) <= 90)
            if(handles.ciphermessage(i) > 64 && handles.ciphermessage(i) < 78)
                handles.plainmessage(i)=handles.ciphermessage(i) + 13;
            else
                handles.plainmessage(i)=handles.ciphermessage(i) - 13;
            end
        end
    
        
    end
    if ((handles.ciphermessage(i) > 31 && handles.ciphermessage(i) < 65) || (handles.ciphermessage(i) > 90 && handles.ciphermessage(i) < 97) )
        
    handles.plainmessage(i)=handles.ciphermessage(i);
    end
end
handles.plainmessage=char(handles.plainmessage)    
set(handles.edit8,'String',handles.plainmessage);

myicon = imread('FSOCIETY.png');
 h8=msgbox('Odd things are worth listening to','CLUE3','custom',myicon)
 h7=msgbox('Congrats, you earned another point','Succes','custom',myicon);
guidata(hObject, handles);




function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%%%%imgstego
% Clear the existing workspace 
%clear all; 

% Clear the command window 
%clc; 

% Getting the input image 
handles.filename = 'output_img.csv'; 
handles.input_image = csvread(handles.filename); 

% Get height and width for traversing through the image 
height = size(handles.input_image, 1); 
width = size(handles.input_image, 2); 

% Number of characters of the hidden text 
chars = 41; 
%chars= length(get(handles.

% Number of bits in the message 
message_length = chars * 8; 

% counter to keep track of number of bits extracted 
counter = 1; 

% Traverse through the image 
for i = 1 : height 
	for j = 1 : width 
		
		% If more bits remain to be extracted 
		if (counter <= message_length) 
			
			% Store the LSB of the pixel in extracted_bits 
			extracted_bits(counter, 1) = mod(double(handles.input_image(i, j)), 2); 
			
			% Increment the counter 
			counter = counter + 1; 
		end
	end
end

% Powers of 2 to get the ASCII value from binary 
binValues = [ 128 64 32 16 8 4 2 1 ]; 

% Get all the bits in 8 columned table 
% Each row is the bits of the character 
% in the hidden text 
binMatrix = reshape(extracted_bits, 8, (message_length/8)); 

% Convert the extracted bits to characters 
% by multiplying with powers of 2 
handles.textString = char(binValues*binMatrix); 

% Print the hidden text 
disp(handles.textString); 
set(handles.edit11,'String',handles.textString);
   
 myicon = imread('FSOCIETY.png');
 h6=msgbox('Remember, here 13 is a lucky number','CLUE2','custom',myicon);
 h5=msgbox('Congratulations, you have finished the level and earned a point','Success','custom',myicon);
 
    
guidata(hObject, handles);



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1)
imshow('stegoImage.jpg','parent',handles.axes1);
axes(handles.axes5)
imshow('soc1.jpg','parent',handles.axes5);
myicon = imread('FSOCIETY.png');
h8=msgbox('They look alike right?But one hides a secret','CLUE','custom',myicon);

guidata(hObject,handles)


% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[handles.file2,fs] = audioread('/Users/irinafranciscaion/Desktop/faa.wav');
axes(handles.axes3);
dt = 1/fs;
    t = 0:dt:(length(handles.file2)*dt)-dt;
    plot(t,handles.file2)

% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%%%%%%%%soundfcn%%%%%
fontSize=20;
fontSize1=14;
[y1,fs1]=audioread('/Users/irinafranciscaion/Desktop/irina.wav');
[y2,fs2]=audioread('/Users/irinafranciscaion/Desktop/faa.wav');

yn1=y1/max(abs(y1));
yn2=y2/max(abs(y2));

sound1=yn1;
sound2=yn2;

N=length(sound1);
ls=size(sound1);
nbits=2^(length(sound1));
t1=(0:1:length(sound1)-1)/fs1;
fx=fs1*(0:N/2-1)/N;
T1=1/fs1;

N2=length(sound2);
ls2=size(sound2);
t2=(0:1:length(sound2)-1)/fs2;
fx2=fs2*(0:N2/2-1)/N2;
T2=1/fs2;

voice1=y1(fs1*1 : fs1*5);
voice2=y2(fs2*1 : fs2*5);

N2x=length(voice2);
N1x=length(voice1);

t1x=(0:1:length(voice1)-1)/fs1;
t2x=(0:1:length(voice2)-1)/fs2;

f2x=fs2*(0:N2x/2-1)/N2x;
f1x=fs1*(0:N1x/2-1)/N1x;

NFFT1x=2^nextpow2(N1x);
Y1x=fft(voice1, NFFT1x)/N1x;
f1xx=(fs1/2*linspace(0,1,NFFT1x/2+1))';
STFFT1x=(2*abs(Y1x(1:NFFT1x/2+1)));

NFFT2x=2^nextpow2(N2x);
Y2x=fft(voice2, NFFT2x)/N2x;
f2xx=(fs2/2*linspace(0,1,NFFT2x/2+1))';
STFFT2x=(2*abs(Y2x(1:NFFT2x/2+1)));

% figure;subplot(3,2,1);plot(t1x,voice1);
% str1=sprintf('Plot Sound1 with sampling rate = %d Hz and number sample = %d',fs1,N1x);
% title(str1);
% xlabel('time(sec)');ylabel('relative signal strength'); grid on;
% 
% subplot(3,2,2); plot(t2x,voice2);
% str2=sprintf('Plot Sound1 with sampling rate = %d Hz and number sample = %d',fs2,N2x);
% title(str2); xlabel('time(sec)','Fontsize',fontSize); ylabel('relative signal strength','Fontsize',fontSize); grid on;
% 
% subplot(3,2,3); plot(f1xx, STFFT1x); title('Singel-sided Power spectrum for Sound 1 with same length','Fontsize',fontSize1);
% ylabel('Magnitude [dB]', 'Fontsize', fontSize); xlabel('frequency [Hz]','Fontsize',fontSize); grid on;
% 
% subplot(3,2,4); plot(f2xx, STFFT2x); title('Single-sided Power spectrum for Sound 2 with same length','Fontsize',fontSize1);
% ylabel('Magnitude [dB]', 'Fontsize', fontSize); xlabel('frequency [Hz]','Fontsize',fontSize); grid on;


[C1,lag1]=xcorr(abs((fft(voice1))),abs((fft(voice2)) ));
figure, plot(lag1/fs1,C1);
ylabel('Amplitude'); grid on;
title('Cross=correlation between Sound 1 and sound 2 files')

D=voice1-voice2;
MSE=mean(D.^2);
msgbox(strcat('MSE values is= ' ,mat2str(MSE)));
if MSE ==0;
    msgbox('no error.Signals are the same.Now check your next clue');
    disp('Signals are the same');
    set(handles.edit12,'String', 'WOOO YASS');
    
else
    disp('Signals are not the same');
    msgbox('Test error. More luck next time');
    set(handles.edit12,'String', 'no boii');
    
end
guidata(hObject, handles);


function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton22.
function pushbutton22_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton23.
function pushbutton23_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit15_Callback(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit15 as text
%        str2double(get(hObject,'String')) returns contents of edit15 as a double


% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit16_Callback(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit16 as text
%        str2double(get(hObject,'String')) returns contents of edit16 as a double


% --- Executes during object creation, after setting all properties.
function edit16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton24.
function pushbutton24_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1)
imshow('/Users/irinafranciscaion/Desktop/stegoImage.jpg','parent',handles.axes1);
guidata(hObject,handles)
