function human
clc;

num=[0,1,2,3,4,5,6,7,8,9];
positionNum = randperm(10); 
RightNum=zeros(1,4);

while(1)
    if positionNum(1)==1
    positionNum = randperm(10);     
    else 
        break;
    end
        
end
for i=1:4
  
RightNum(i)=num(positionNum(i));
end    
fprintf('%d',RightNum);

Round = 0;

while(1)

    Round = Round + 1;

    disp(['The' num2str(Round) 'time(s)']);

    InputStr = input('Please enter  four different numbers, do not enter four same numbers!!!!:','s');

    GuessNum = zeros(1,4);

    for i = 1:4

        GuessNum(i) = str2double(InputStr(i));

    end

    AS = 0;

    BS = 0;

    for i = 1:4

        apple = find(GuessNum == RightNum(i));

        if(apple == i) 

            AS = AS + 1;

        elseif (apple ~= i) 
            BS = BS + 1;

        end

    end

    disp([num2str(AS) 'A' num2str(BS) 'B']);

    if AS == 4 

        disp('congratulations,you found the right answer!!!!!!!!<3<3<3');

        break;
    end
end
end