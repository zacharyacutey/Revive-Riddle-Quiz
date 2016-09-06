@echo off
::The good old memory of Garrett's Riddle Quiz
::Copyright (C) 2015 Garrett Smith

::This program is free software; you can redistribute it and/or
::modify it under the terms of the GNU General Public License
::as published by the Free Software Foundation; either version 2
::of the License, or (at your option) any later version.

::This program is distributed in the hope that it will be useful,
::but WITHOUT ANY WARRANTY; without even the implied warranty of
::MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
::GNU General Public License for more details.

::You should have received a copy of the GNU General Public License
::along with this program; if not, write to the Free Software
::Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
title The Riddle Quiz Version 2.1
color 0A
mode con cols=105 lines=35
echo.
echo.
echo            ```                                                                  ``                 
echo      `-+hs:-::///++++:-.                                             `.-/+++///::--:hy/.           
echo         `:+`       `-+ym/.                `. ``                     -sms/.        -+.              
echo           `/`          `+ddo-              `:/:/`               `/ymy:`          ::                
echo             /            `/mMms:`            -mmmy/`         ./hNMh-            .:                 
echo             :`             .dMMMmo.       -/ymMMMMMd/-`    :yNMMM+              :                  
echo             /  `.--::////:-./MMMMy+-     +osMMNsohho-:o` `/+dMMMm..-:////::--.  .-                 
echo           .o/::-.```..-:+ydmNMMMs  `    -.`mMMy  ``-o-      `NMMMNmhs+:..````-::-o:                
echo         `/s/:`            `-sNMM:  .:-.`  /MMN/`      `-:-`  hMMd+.`            .:+o-              
echo             `-:`             -dMh.  oNNmh+sMMM+`   -odmNm.  :NMo`             .:.`                 
echo               `--          ./osymmhsmMMMN:-dNMNd+-`.oMMMMhsdNhyo+:`         `-.                    
echo                 `:`     `-:-.` `s+:/+oydNmmds+mMMNmmNmhyo+//s+  `.::.      --                      
echo                  `:   .--`    `/```````./mh.  .shMMMN/.``````.:    `.--`  .-                       
echo                   .-`/:-.....`::.```  ```/.    ``NMMMy+` ````-+`......-/: /                        
echo                    o+.`      `/`                 /mMM/-/`     .:`     ``-++                        
echo                    .                            `+MMN. `/-  --`          `.                        
echo                                              `-+hMNm-    :+:-//-`                                  
echo                                           ./ydNMmy:.     `.    `--`                                
echo                                     ``  `:oNMMh/`                 .`                               
echo                                   ./s. -:..NMN/`                   ``                              
echo                                 .:. .:+.   :hNh+.`                                                 
echo                               `:.     .      ./ymy`                                                
echo                              --                `ss                                                 
echo                             -`                os-                                                  
echo                            .                 ..y`.                                                 
echo                                              shNy:                                                 
echo                                               +d.                                                  
echo                                                `        
echo.
echo.
echo                                            Made by SmithDevelopments     
echo.
echo.
echo                                            Loading... Please Wait                                      
timeout /t 3 >nul
mode con cols=132 lines=50



set /p id="Please enter your FIRST name only (glitches when two words are used): "
title Beginning the Tests - %id%
echo Please choose the directory to save your score in. 
echo.
echo This could take several seconds...

:: this portion of the code launches a folder chooser and outputs choice to the console

@echo off
setlocal enabledelayedexpansion

:: Does powershell.exe exist within %PATH%?
for %%I in (`powershell.exe`) do if "%%~$PATH:I" neq "" (
    set chooser=powershell -sta "Add-Type -AssemblyName System.windows.forms|Out-Null;$f=New-Object System.Windows.Forms.FolderBrowserDialog;$f.SelectedPath='%cd%';$f.Description='Please choose a folder.';$f.ShowNewFolderButton=$true;$f.ShowDialog();$f.SelectedPath"
) else (
rem :: If not, compose and link C# application to open folder browser dialog
    set chooser=%temp%\fchooser.exe
    if exist !chooser! del !chooser!
    >"%temp%\c.cs" echo using System;using System.Windows.Forms;
    >>"%temp%\c.cs" echo class dummy{[STAThread]
    >>"%temp%\c.cs" echo public static void Main^(^){
    >>"%temp%\c.cs" echo FolderBrowserDialog f=new FolderBrowserDialog^(^);
    >>"%temp%\c.cs" echo f.SelectedPath=System.Environment.CurrentDirectory;
    >>"%temp%\c.cs" echo f.Description="Please choose a folder.";
    >>"%temp%\c.cs" echo f.ShowNewFolderButton=true;
    >>"%temp%\c.cs" echo if^(f.ShowDialog^(^)==DialogResult.OK^){Console.Write^(f.SelectedPath^);}}}
    for /f "delims=" %%I in ('dir /b /s "%windir%\microsoft.net\*csc.exe"') do (
        if not exist "!chooser!" "%%I" /nologo /out:"!chooser!" "%temp%\c.cs" 2>NUL
    )
    del "%temp%\c.cs"
    if not exist "!chooser!" (
        echo Error: Please install .NET 2.0 or newer, or install PowerShell.
        goto : next
    )
)

:next

:: capture choice to a variable
for /f "delims=" %%I in ('%chooser%') do set "folder=%%I"

echo You chose %folder%

:: Clean up the mess
del "%temp%\fchooser.exe" 2>NUL
timeout /t 2 >nul

set score=1
cls
echo DO NOT PLAY WITH EARBUDS OR HEADPHONES IN. I AM NOT RESPONSIBLE FOR ANY HEARING DAMAGE.
echo.
echo PLAY AT YOUR OWN RISK OF BEING CAUGHT BY A TEACHER.  I AM NOT RESPONSIBLE FOR ANYONE WHO GETS IN TROUBLE!
pause
cls

IF %id%==Sack (
     :sack
     echo MMMMmmmmmmmmmmmmmmmmmmm.................
     echo Try again
     echo press any key to continue to the program!
     pause >nul
     cls
     echo you will not
     echo YES
     echo But seriously, you can press any key to continue now!
     pause >nuls
     cls
     echo haha!!
     timout /t 2
     echo Dude seriously, just press any key to start the program that I made!
     pause >nul
     goto sack
)
IF %id%==Carter (
     echo bruh
     timeout /t 1 >nul
     cls
)

IF %id%==Jake (
     :spam
     start
     goto spam
)

IF %id%==Alissa (
     echo Difficulty increased to Asian Mode
     goto q9
     timeout /t 3 >nul
     cls
)

echo Hello, %id%, this game will ask you questions, and if you get them right you will gain a point,
echo however, if you get a question wrong you lose and will get to enjoy a small suprise...
echo.
echo Also, after you lose, your score will be saved on a text file wherever you set it to save.  If you 
echo do not provide a directory to save the score in, the score will not be saved
echo.  
echo Do not wear ear buds or headphones while playing this game... you also may want to turn the 
echo volume off on your computer.
echo.
echo Please answer in all lower case!
echo.
echo If enough people like the game then I will update the game and fix its bugs... Trust me it has a lot of bugs!
echo.
echo Ready?
echo.
echo Type any key to start the game
pause >nul
cls

echo Do you want to see the loading screen (it's pretty cool but I won't be offended if you choose to skip it)
set /p loadingscreen=Y or N: 

IF %loadingscreen%==N (
cls
goto endloader
)

echo loading 1%
ping localhost -n 1 >nul 
cls 
echo loading 2%
ping localhost -n 1 >nul 
cls 
echo loading 3% 
ping localhost -n 1 >nul 
cls 
echo loading 4% 
ping localhost -n 1 >nul 
cls 
echo loading 5%
ping localhost -n 1 >nul 
cls 
echo loading 6% 
ping localhost -n 1 >nul 
cls 
echo loading 7% 
ping localhost -n 1 >nul 
cls 
echo loading 8% 
ping localhost -n 1 >nul 
cls 
echo loading 9% 
ping localhost -n 1 >nul 
cls 
echo loading 10% 
ping localhost -n 1 >nul 
cls 
echo loading 11% 
ping localhost -n 1 >nul 
cls 
echo loading 12% 
ping localhost -n 1 >nul 
cls 
echo loading 13% 
ping localhost -n 1 >nul 
cls 
echo loading 14% 
ping localhost -n 1 >nul 
cls 
echo loading 15% 
ping localhost -n 1 >nul 
cls 
echo loading 16% 
ping localhost -n 1 >nul 
cls 
echo loading 17% 
ping localhost -n 1 >nul 
cls 
echo loading 18% 
ping localhost -n 1 >nul 
cls 
echo loading 19% 
ping localhost -n 1 >nul 
cls 
echo loading 20% 
ping localhost -n 1 >nul 
cls 
echo loading 21% 
ping localhost -n 1 >nul 
cls 
echo loading 22% 
ping localhost -n 1 >nul 
cls 
echo loading 23% 
ping localhost -n 1 >nul 
cls 
echo loading 24% 
ping localhost -n 1 >nul 
cls 
echo loading 25% 
ping localhost -n 1 >nul 
cls 
echo loading 26% 
ping localhost -n 1 >nul 
cls 
echo loading 27% 
ping localhost -n 1 >nul 
cls 
echo loading 28% 
ping localhost -n 1 >nul 
cls 
echo loading 29% 
ping localhost -n 1 >nul 
cls 
echo loading 30% 
ping localhost -n 1 >nul 
cls 
echo loading 31% 
ping localhost -n 1 >nul 
cls 
echo loading 32% 
ping localhost -n 1 >nul 
cls 
echo loading 33% 
ping localhost -n 1 >nul 
cls 
echo loading 34% 
ping localhost -n 1 >nul 
cls 
echo loading 35% 
ping localhost -n 1 >nul 
cls 
echo loading 36% 
ping localhost -n 1 >nul 
cls 
echo loading 37% 
ping localhost -n 1 >nul 
cls 
echo loading 38% 
ping localhost -n 1 >nul 
cls 
echo loading 39% 
ping localhost -n 1 >nul 
cls 
echo loading 40% 
ping localhost -n 1 >nul 
cls 
echo loading 41% 
ping localhost -n 1 >nul 
cls 
echo loading 42% 
ping localhost -n 1 >nul 
cls 
echo loading 43% 
ping localhost -n 1 >nul 
cls 
echo loading 44% 
ping localhost -n 1 >nul 
cls 
echo loading 45% 
ping localhost -n 1 >nul 
cls 
echo loading 46% 
ping localhost -n 1 >nul 
cls 
echo loading 47% 
ping localhost -n 1 >nul 
cls 
echo loading 48% 
ping localhost -n 1 >nul 
cls 
echo loading 49% 
ping localhost -n 1 >nul 
cls 
echo loading 50% 
ping localhost -n 1 >nul 
cls 
echo loading 51% 
ping localhost -n 1 >nul 
cls 
echo loading 52% 
ping localhost -n 1 >nul 
cls 
echo loading 53% 
ping localhost -n 1 >nul 
cls 
echo loading 54% 
ping localhost -n 1 >nul 
cls 
echo loading 55% 
ping localhost -n 1 >nul 
cls 
echo loading 56% 
ping localhost -n 1 >nul 
cls 
echo loading 57% 
ping localhost -n 1 >nul 
cls 
echo loading 58% 
ping localhost -n 1 >nul 
cls 
echo loading 59% 
ping localhost -n 1 >nul 
cls 
echo loading 60% 
ping localhost -n 1 >nul 
cls 
echo loading 61% 
ping localhost -n 1 >nul 
cls 
echo loading 62% 
ping localhost -n 1 >nul 
cls 
echo loading 63% 
ping localhost -n 1 >nul 
cls 
echo loading 64% 
ping localhost -n 1 >nul 
cls 
echo loading 65% 
ping localhost -n 1 >nul 
cls 
echo loading 66% 
ping localhost -n 1 >nul 
cls 
echo loading 67% 
ping localhost -n 1 >nul 
cls 
echo loading 68% 
ping localhost -n 1 >nul 
cls 
echo loading 69% 
ping localhost -n 1 >nul 
cls 
echo loading 70% 
ping localhost -n 1 >nul 
cls 
echo loading 71% 
ping localhost -n 1 >nul 
cls 
echo loading 72% 
ping localhost -n 1 >nul 
cls 
echo loading 73% 
ping localhost -n 1 >nul 
cls 
echo loading 74% 
ping localhost -n 1 >nul 
cls 
echo loading 75% 
ping localhost -n 1 >nul 
cls 
echo loading 76% 
ping localhost -n 1 >nul 
cls 
echo loading 77% 
ping localhost -n 1 >nul 
cls 
echo loading 78% 
ping localhost -n 1 >nul 
cls 
echo loading 79% 
ping localhost -n 1 >nul 
cls 
echo loading 80% 
ping localhost -n 1 >nul 
cls 
echo loading 81% 
ping localhost -n 1 >nul 
cls 
echo loading 82% 
ping localhost -n 1 >nul 
cls 
echo loading 83% 
ping localhost -n 1 >nul 
cls 
echo loading 84% 
ping localhost -n 1 >nul 
cls 
echo loading 85% 
ping localhost -n 1 >nul 
cls 
echo loading 86% 
ping localhost -n 1 >nul 
cls 
echo loading 87% 
ping localhost -n 1 >nul 
cls 
echo loading 88% 
ping localhost -n 1 >nul 
cls 
echo loading 89% 
ping localhost -n 1 >nul 
cls 
echo loading 90% 
ping localhost -n 1 >nul 
cls 
echo loading 91% 
ping localhost -n 1 >nul 
cls 
echo loading 92% 
ping localhost -n 1 >nul 
cls 
echo loading 93% 
ping localhost -n 1 >nul 
cls 
echo loading 94% 
ping localhost -n 1 >nul 
cls 
echo loading 95% 
ping localhost -n 1 >nul 
cls 
echo loading 96% 
ping localhost -n 1 >nul 
cls 
echo loading 97% 
ping localhost -n 1 >nul 
cls 
echo loading 98% 
ping localhost -n 1 >nul 
cls 
echo loading 99% 
ping localhost -n 1 >nul 
cls 
echo loading 100% 
ping localhost -n 2 >nul 
cls
echo loading complete!
timeout /t 2 >nul
cls

:endloader
:q1
echo Question One: 
echo.
set /p q1=What's 9 + 10? 

IF %q1%== 19 (
     cls
     echo Ok, so you're not stupid.
     echo.
     echo Don't worry though, every question is slightly harder than the last
     set /a score+=1
     echo Your score is now: %score%
     pause
     cls
     goto q2
)
goto gameover

:q2
echo Question Two:
echo.
set /p q2=How many feet are in a mile? 

IF %q2%== 5280 (
     cls
     echo Great, you got another question correct.  Let's see if you can get this next one right.
     set /A score+=1
     echo Your score is now: %score%
     pause
     cls
     goto q3
)
goto gameover

:q3
echo Question Three:
echo.
echo What is the last name of the candidate who won the 1968 Presidential Election? 
echo Remember answer all lower case!
set /p q3= Answer: 

IF %q3%== nixon (
     cls
     echo Impressive, I hope you like riddles because that's what you've got next.
     set /A score+=1
     echo Your score is now: %score%
     pause
     cls
     goto q4
)
goto gameover

:q4
echo Question Four
echo.
echo A spirited jig it dances bright,
echo Banishing all but darkest night.
echo Give it food and it will live;
echo Give it water and it will die
echo.
set /p q4=What am I? 

IF %q4%== fire (
     cls
     echo Nice, the next problem is a another riddle
     set /A score+=1
     echo Your score is now: %score%
     pause
     cls
     goto q5
)
goto gameover

:q5
echo The life I lead is mere hours or less,
echo I serve all my time by being consumed.
echo I am quickest when thin, slowest when fat,
echo And wind is the bane of the gift that I bring.
echo.
set /p q5=What am I? 

IF %q5%== candle (
     cls
     title You've Almost Won %id%
     echo Congrats you've almost made it to the end of the quiz!
     echo You've only got three more problems to go, and from now on points are worth triple their previous value!
     echo.
     echo The next question is a math problem...
     set /a score+=1
     echo Your score is now: %score%
     pause
     cls
     goto q6
)
goto gameover

:q6 
set /p q6=If you add up all the natural numbers (1 + 2 + 3 + 4 + 5...), what does it equal? 

IF %q6%== -1/12 (
     cls
     echo Wow, I didn't expect you to get that one
     echo The next one is very difficult
     set /a score+=3
     echo Your score is now: %score%
     pause
     cls
     goto q7
)
goto gameover

:q7
echo Question 7
echo A fast food restaurant sells chicken in orders of 6, 9, and 20.
echo What is the largest number of pieces of chicken you cannot order from this restaurant.
set /p q7=Only answer the number please. 

IF %q7%== 43 (
     cls
     echo Very impressive, only one more problem to go... and this one's worth 5 points
     echo.
     set /a score+=3
     echo Your score is now: %score%
     pause
     cls
     goto q8
)
goto gameover

:q8
echo You have been given the task of transporting 3,000 apples 1,000 miles from 
echo Appleland to Bananaville. Your truck can carry 1,000 apples at a time. Every 
echo time you travel a mile towards Bananaville you must pay a tax of 1 apple, but
echo you pay nothing whn going in the other direction (towards Appleland).
echo.
echo What is the highest number of apples you can get to Bananaville?
echo.
set /p q8=Only write the number please. 

IF %q8%==833 (
     cls
     title You Win easy mode %id%
     echo Wow you've gotten all these problems correct
     echo Congratulation you Win!
     set /a score+=5
     echo Your score is now: %score%
     pause
     goto winGame
)
goto gameover

:q9 
cls
echo Question 9
echo.
echo It is greater than God and more evil than the devil. The poor have it, the rich need it and if you eat it you'll die. What is it?
set /p q9=Answer: 

IF %q9%==nothing (
     cls
     title HARDCORE MODE
     echo I bet you won't get the next one...
     echo Oh yeah, problems are now worth 10 points each
     set /a score+=10    
     echo Your score is now: %score%
     pause
     cls
     goto q10
)
goto gameover

:q10
cls
echo Question 10
echo.
echo The Fibonacci Sequence is a series of numbers.
set /p q10=What type of series is it? 

IF %q10%==divergent (
     cls
     echo Impressive, another 10 points added to your score.
     set /a score+=10
     echo Your score is now: %score%
     pause
     cls
     goto q11
)
goto gameover

:q11
set /p q11=The sum of the reciprocals of all powers of 2 equals what number? 

IF %q11%==2 (
cls
     echo Congrats, you get another 10 points!
     set /a score+=10
     echo Your score is now: %score%
     pause
     cls
     goto q12
)
goto gameover

:q12
echo Question 12
echo.
set /p q12=The fifth letter in the Modern Greek alphabet is what? 

IF %q12%==epsilon (
     cls
     echo I bet you Googled that... Whatever you get 10 more points
     set /a score+=10
     echo Your score is now: %score%
     pause
     cls
     goto q13
)
goto gameover

:q13
echo Question 13
echo.
echo According to modern science, quantum ________ caused the big bang.
set /p q13=Answer: 

IF %q13%==fluctuations (
     cls
     echo Good job... I still think you googled that!
     echo.
     set /a score+=10
     echo Your score is now: %score%
     pause
     cls
     goto q14
)
goto gameover

:q14
echo Question 14
echo.
echo The anti-particle for an electron is called what?
set /p q14=Answer: 

IF %q14%==positron (
     cls
     echo Another correct answer, and I'm almost out of questions, 
     echo so from now on questions are 20 points each.
     set /a score+=10
     echo Your score is now: %score%
     pause
     cls
     goto q15     
)
goto gameover

:q15
echo Question 15
echo.
echo __________ in biology occurs when two or more clearly different phenotypes exist in the same population of a species.
set /p q15=Answer: 

IF %q15%==polymorphism (
     cls
     echo Ok, I know you googled that!
     set /a score+=20
     echo Your score is now: %score%
     echo.
     echo The next question is the last one.
     pause
     cls
     goto q16
)
goto 

:q16
echo Question 16
echo.
echo The Ultimate Answer to life, the Universe, and Everything is what?
echo.
set /p q16=Answer: 

IF %q16%==42 (
     echo You won HARDCORE mode!!!
     echo.
     pause
     goto win2
)

:gameover
start  /b dont.js
::writes a text file with the points earned on it
cls

break>"%folder%\%id%'s_score.txt"
echo %score% >>%id%'s_score.txt 
echo Thanks for playing, please play again! >>%id%'s_score.txt 
echo Thanks for playing, please play again!
set /p credits=Would you like to see the credits? Y or N: 
pause >nul

IF %credits%==Y (
goto credits
)
:spam
start
goto spam

:winGame
cls
     set /p hardmode=Would you like to continue to hard mode? Y or N: 
     IF %hardmode%==Y (
          echo These problems will challenge even the smartest of people...
          timeout /t 2 >nul
          pause
          goto q9
     )
:win2
echo Thanks for playing, your score has been recorded!
break>"%folder%\%id%'s_score.txt"
echo Your score was: %score% >>%id%'s_score.txt
echo Congratulations on winning, please play again when it is updated! >>%id%'s_score.txt
echo.
set winGame=Would you like to see the credits? Y or N: 
pause

IF %winGame%==Y (
:credits
cls
echo Main developer - Garrett Smith
echo Graphics developer - Garrett Smith
echo Story line director - Garrett Smith
echo Question designer - Garrett Smith
echo Easter Egg developer - Garrett Smith
echo All other major roles - Garrett Smith
echo Question error fix - Zachary Taylor
echo.
echo Thanks for playing! Press any key to close this window.
pause >nul
EXIT
)
EXIT





















