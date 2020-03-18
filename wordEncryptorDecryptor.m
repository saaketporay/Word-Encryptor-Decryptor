clc;clear;

%user changable
encryptionMatrix = [1,2,-2; -2,3,1; 3,-1,2];
decryptionMatrix = [11,22,14; 7,9,21; 17,0,3];

%prompts the user to select an option
prompt1 = "Type 'e' for Encryption or 'd' for Decryption: ";
answer = input(prompt1,'s');

%%encryption
if answer == "e"
    prompt2 = 'Enter text to be encrypted: ';
    x = input(prompt2,'s');
    len = length(x);
    
    if mod(len,3) == 1 %if not divisible by 3
        x=strcat(x,'X');
        x=strcat(x,'X');
    end
    if mod(len,3) == 2 %if not divisible by 3
        x=strcat(x,'X');
    end

    len = length(x); %stores length 
    enc = double (x); %converts chars to numbers

    for i=1:len %converts numbers in matrix to table 2 values
        enc(i)=enc(i)-65;
    end

    numberMatrix = len/3; %stores how many matrices there are

    enc3 = reshape(enc,[3,numberMatrix]); %reshapes the matrix to 3 row by numberMatrix columns

    enc4=[]; %blank enc4 matrix

    for k=1: numberMatrix %puts multiplied matrix in enc4
        enc4(:,k)= encryptionMatrix(:,:)*enc3(:,k);
    end

    modVector = mod(enc4,26); %takes mod 26 of enc4

    [rowSize,colSize] = size(modVector); %finds row and column size

    modReshaped = reshape(modVector,[1,colSize*rowSize]); %reshapes the matrix to a single row

    for x=1:colSize*rowSize %converts numbers in matrix to table 2 values
        modReshaped(x)= modReshaped(x)+65;
    end

    scrambled = char(modReshaped); %stores encrypted message

    fprintf("The scrambled message is: ") %prints message
    disp(scrambled);

end
%%end of encryption

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%decryption
if answer == "d"
    prompt3 = 'Enter text to be decrypted: ';
    y = input(prompt3,'s');
    
    len2 = length(y); %stores length
    dec = double(y); %converts chars to numbers
    
    for c=1:len2 %converts numbers in matrix to table 2 values
        dec(c)=dec(c)-65;
    end
    
    numMat = len2/3; %stores how many matrices there are
    
    dec3 = reshape(dec,[3,numMat]); %reshapes the matrix to 3 row by numMat columns
    
    dec4=[]; %blank dec4 matrix
    
    for v=1:numMat %puts multiplied matrix in dec4
        dec4(:,v)=decryptionMatrix(:,:)*dec3(:,v);
    end
    
    modVector = mod(dec4,26); %takes mod 26 of dec4

    [rowSize,colSize] = size(modVector); %finds row and column size

    modReshaped = reshape(modVector,[1,colSize*rowSize]); %reshapes the matrix to a single row

    for x=1:colSize*rowSize %converts numbers in matrix to table 2 values
        modReshaped(x)= modReshaped(x)+65;
    end

    unscrambled = char(modReshaped); %stores decrypted message

    fprintf("The unscrambled message is: ") %prints message
    disp(unscrambled);
end
%%end of decryption