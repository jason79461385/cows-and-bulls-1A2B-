function BullsAndCowsPlayer
% Plays the game Bulls and Cows as the player
 
    % Generate list of all possible numbers
    nDigits = 4;
    lowVal = 1;
    highVal = 9;
    combs = nchoosek(lowVal:highVal, nDigits);%йте|н╙
    nCombs = size(combs, 1);
    nPermsPerComb = factorial(nDigits);
    gList = zeros(nCombs.*nPermsPerComb, nDigits);
    for k = 1:nCombs
        gList(nPermsPerComb*(k-1)+1:nPermsPerComb*k, :) = perms(combs(k, :));
    end
    nBulls = 0;
    nGuesses = 0;
    while nBulls < 4 && ~isempty(gList)
        nList = size(gList, 1);
        g = gList(randi(nList), :);     
        fprintf('My guess: %s?\n', sprintf('%d', g));
        
        nBulls = input('How many As? ');
        if nBulls < 4
            nCows = input('How many Bs? ');
            del = false(nList, 1);
            for k = 1:nList
                del(k) = any([nBulls nCows] ~= CountBullsCows(g, gList(k, :)));
            end
            gList(del, :) = [];
        end
        nGuesses = nGuesses+1;
    end
    if isempty(gList)
        fprintf('That''s the answer! You messed up your scoring.\n')
    else
        fprintf('Yay, I won! Only took %d guesses.\n', nGuesses)
    end
end
 
function score = CountBullsCows(guess, correct)
% Checks the guessed array of digits against the correct array to find the score
% Assumes arrays of same length and valid numbers
    bulls = guess == correct;
    cows = ismember(guess(~bulls), correct);
    score = [sum(bulls) sum(cows)];
end