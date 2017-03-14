$host.UI.RawUI.WindowTitle="The Riddle Quiz Version 2.1.1";
$host.UI.RawUI.ForegroundColor="Green";
$host.UI.RawUI.BackgroundColor="Black";
function bpause
{
    Write-Host "Press any key to continue...";
    $null = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown");
}
function jpause
{
    $null = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown");
}
function read
{
    Write-Host $args[0] -NoNewline;
    PSConsoleHostReadline;
}
function q1
{
    Write-Host "Question One:";
    Write-Host "";
    $q1 = read "What's 9 + 10? ";
    if ( $q1 -ceq "19" )
    {
        Clear-Host;
        Write-Host "Ok, so you're not stupid.";
        Write-Host "";
        Write-Host "Don't worry though, every question is slightly harder than the last";
        $global:score += 1;
        Write-Host "Your score is now: $score";
        bpause;
        Clear-Host;
        q2;
    }
    else
    {
        gameover;
    }
}
function q2
{
    Write-Host "Question Two:";
    Write-Host "";
    $q2 = read "How many feet are in a mile? ";
    if ( $q2 -ceq "5280" )
    {
        Clear-Host;
        Write-Host "Great, you got another question correct. Let's see if you can get this next one right.";
        $global:score += 1;
        Write-Host "Your score is now: $score";
        bpause;
        Clear-Host;
        q3;
    }
    else
    {
        gameover;
    }
}
function q3
{
    Write-Host "Question Three:";
    Write-Host "";
    Write-Host "What is the last name of the candidate who won the 1968 Presidential Election?";
    Write-Host "Remember answer in all lower case!";
    $q3 = read "Answer: ";
    if ( $q3 -ceq "nixon" )
    {
        Clear-Host;
        Write-Host "Impressive, I hope you like riddles because that's what you've got next.";
        $global:score += 1;
        Write-Host "Your score is now: $score";
        bpause;
        Clear-Host;
        q4;
    }
    else
    {
        gameover;
    }
}
function q4
{
    Write-Host "Question Four";
    Write-Host "";
    Write-Host "A spirited jig it dances bright,";
    Write-Host "Banishing all but darkest night.";
    Write-Host "Give it food and it will live;";
    Write-Host "Give it water and it will die";
    Write-Host "";
    $q4 = read "What am I? ";
    if ( $q4 -ceq "fire" )
    {
        Clear-Host;
        Write-Host "Nice, the next problem is a another riddle";
        $global:score += 1;
        Write-Host "Your score is now: $score";
        bpause;
        Clear-Host;
        q5;
    }
    else
    {
        gameover;
    }
}
function q5
{
    Write-Host "The life I lead is mere hours or less,";
    Write-Host "I serve all my time by being consumed.";
    Write-Host "I am quickest when thin, slowest when fat,";
    Write-Host "And wind is the bane of the gift that I bring.";
    Write-Host "";
    $q5 = read "What am I? ";
    if ( $q5 -ceq "candle" )
    {
        Clear-Host;
        $host.UI.RawUI.WindowTitle="You've Almost Won $id";
        Write-Host "Congrats you've almost made it to the end of the quiz!";
        Write-Host "You've only got three more problems to go, and from now on points are worth triple their previous value!";
        Write-Host "";
        Write-Host "The next question is a math problem...";
        $global:score += 1;
        Write-Host "Your score is now: $score";
        bpause;
        Clear-Host;
        q6;
    }
    else
    {
        gameover;
    }
}
function q6
{
    $q6 = read "If you add up all the natural numbers (1 + 2 + 3 + 4 + 5...), what does it equal? ";
    if ( $q6 -ceq "-1/12" )
    {
        Clear-Host;
        Write-Host "Wow, I didn't expect you to get that one";
        Write-Host "The next one is very difficult";
        $global:score += 3;
        Write-Host "Your score is now: $score";
        bpause;
        Clear-Host;
        q7;
    }
    else
    {
        gameover;
    }
}
function q7
{
    Write-Host "A fast food restaurannt sells chicken in orders of 6, 9, and 20.";
    Write-Host "What is the largest number of pieces of chicken you cannot order from this restaurant.";
    $q7 = read "Only answer the number please. ";
    if ( $q7 -ceq "43" )
    {
        Clear-Host;
        Write-Host "Very impressive, only one more problem to go... and this one's worth 5 points";
        Write-Host "";
        $global:score += 3;
        Write-Host "Your score is now: $score";
        bpause;
        Clear-Host;
        q8;
    }
    else
    {
        gameover;
    }
}
function q8
{
    Write-Host "You have been given the task of transporting 3,000 apples 1,000 miles from ";
    Write-Host "Appleland to Bananaville. Your truck can carry 1,000 apples at a time. Every ";
    Write-Host "time you travel a mile towards Bananaville you must pay a tax of 1 apple, but";
    Write-Host "you pay nothing when going in the other direction (towards Appleland).";
    Write-Host "";
    Write-Host "What is the highest number of apples you can get to Bananaville?";
    Write-Host "";
    $q8 = read "Only write the number please. ";
    if ( $q8 -ceq "833" )
    {
        Clear-Host;
        $host.UI.RawUI.WindowTitle = "You Win easy mode $id";
        Write-Host "Wow you've gotten all these problems correct";
        Write-Host "Congratulation you Win!";
        $global:score += 5;
        Write-Host "Your score is now: $score";
        bpause;
        winGame;
    }
    else
    {
        gameover;
    }
}
function winGame
{
    Clear-Host;
    $hardmode = read "Would you like to continue to hard mode? Y or N: ";
    if ( $hardmode -ceq "Y" )
    {
        Write-Host "These problems will challenge even the smartest of people...";
        Start-Sleep 2;
        bpause;
        q9;
    }
    win2;
}
function win2
{
    Write-Host "Thanks for playing, your score has been recorded!";
    Write-Out "" > "$chooser\$id's_score.txt";
    Write-Out "Your score was $score " >> "$chooser\$id's_score.txt";
    Write-Out "Congratulations on winning, please play again when it is updated! " >> "$chooser\$id's_score.txt";
    Write-Host "";
    $winGame = read "Would you like to see the credits? Y or N: ";
    if ( $winGame -ceq "Y" )
    {
        credits;
    }
}
function credits
{
    Clear-Host;
    Write-Host "Main developer - Garrett Smith";
    Write-Host "Graphics developer - Garrett Smith";
    Write-Host "Story line director - Garrett Smith";
    Write-Host "Question designer - Garrett Smith";
    Write-Host "Easter Egg developer - Garrett Smith";
    Write-Host "Question error fix - Zachary Taylor";
    Write-Host "Translation from Batch to Powershell - Zachary Taylor";
    Write-Host "All other major roles - Garrett Smith";
    Write-Host "";
    Write-Host "Thanks for playing! Press any key to close this window.";
    jpause;
    taskkill /f /im "powershell.exe";
}
function q9
{
    Clear-Host;
    Write-Host "Question 9";
    Write-Host "";
    Write-Host "It is greater than God and more evil than the devil. The poor have it, the rich need it and if you eat it you'll die. What is it?";
    $q9 = read "Answer: ";
    if ( $q9 -ceq "nothing" )
    {
        Clear-Host;
        $host.UI.RawUI.WindowTitle = "HARDCORE MODE";
        Write-Host "I bet you won't get the next one..."l
        Write-Host "Oh yeah, your problems are now worth 10 points each";
        $global:score += 10;
        Write-Host "Your score is now: $score";
        bpause;
        Clear-Host;
        q10;
    }
    else
    {
        gameover;
    }
}
function q10
{
    Write-Host "Question 10";
    Write-Host "";
    Write-Host "The Fibonacci Sequence is a series of numbers.";
    $q10 = read "What type of series is it? ";
    if ( $q10 -ceq "divergent" )
    {
        Clear-Host;
        Write-Host "Impressive, another 10 points added to your score.";
        $global:score += 10;
        Write-Host "Your score is now: $score";
        bpause;
        Clear-Host;
        q11;
    }
    else
    {
        gameover;
    }
}
function q11
{
    $q11 = read "The sum of the reciprocals of all powers of 2 equals what number? ";
    if ( $q11 -ceq "2" )
    {
        Clear-Host;
        Write-Host "Congrats, you get another 10 points!";
        $global:score += 10;
        Write-Host "Your score is now: $score";
        bpause;
        Clear-Host;
        q12;
    }
    else
    {
        gameover;
    }
}
function q12
{
    Write-Host "Question 12";
    Write-Host "";
    $q12 = read "The fifth letter in the Modern Greek alphabet is what? ";
    if ( $q12 -ceq "epsilon" )
    {
        Clear-Host;
        Write-Host "I bet you Googled that... Whatever you get 10 more points";
        $global:score += 10;
        Write-Host "Your score is now: $score";
        bpause;
        Clear-Host;
        q13;
    }
    else
    {
        gameover;
    }
}
function q13
{
    Write-Host "Question 13";
    Write-Host "";
    Write-Host "According to modern science, quantum ________ caused the big bang.";
    $q13 = read "Answer: ";
    if ( $q13 -ceq "fluctuations" )
    {
        Clear-Host;
        Write-Host "Good job... I still think you googled that!";
        Write-Host "";
        $global:score += 10;
        Write-Host "Your score is now: $score";
        bpause;
        Clear-Host;
        q14;
    }
    else
    {
        gameover;
    }
}
function q14
{
    Write-Host "Question 14";
    Write-Host "";
    Write-Host "The anti-particle for an electron is called what?";
    $q14 = read "Answer: ";
    if ( $q14 -ceq "positron" )
    {
        Clear-Host;
        Write-Host "Another correct answer, and I'm almost out of questions, ";
        Write-Host "so from now on questions are 20 points each.";
        $global:score += 10;
        Write-Host "Your score is now: $score";
        bpause;
        Clear-Host;
        q15;
    }
    else
    {
        gameover;
    }
}
function q15
{
    Write-Host "Question 15";
    Write-Host "";
    Write-Host "__________ in biology occurs when two or more clearly different phenotypes exist in the same population of a species.";
    $q15 = read "Answer: ";
    if ( $q15 -ceq "polymorphism" )
    {
        Clear-Host;
        Write-Host "Ok, I know you googled that!";
        $global:score += 20;
        Write-Host "Your score is now: $score";
        Write-Host "";
        Write-Host "The next question is the last one.";
        bpause;
        Clear-Host;
        q16;
    }
    else
    {
        gameover;
    }
}
function q16
{
    Write-Host "Question 16";
    Write-Host "";
    Write-Host "The Ultimate Answer to life, the Universe, and Everything is what?";
    Write-Host "";
    $q16 = read "Answer: ";
    if ( $q16 -ceq "42" )
    {
        Write-Host "You won HARDCORE mode!!!";
        Write-Host "";
        bpause;
        win2;
    }
    else
    {
        gameover;
    }
}
function gameover
{
	cd C:\;
    Clear-Host;
    Write-Output 'var WshShell = WScript.CreateObject("WScript.Shell");' > C:\Users\$env:UserName\spam.js;
    Write-Output "for(var i=0;i<100;i++)WshShell.SendKeys(String.fromCharCode(0xAF));" >> C:\Users\$env:UserName\spam.js;
    WScript /e:jscript C:\Users\$env:UserName\spam.js;
    For($i = 0; $i -ne 30; $i += 1)
    {
	    Start-Process "chrome.exe" "https://www.youtube.com/watch?v=nQTLU271DFE&autoplay=0";
    }
    Write-Output "" > "$chooser\$id's_score.txt";
    Write-Output "$score " >> "$chooser\$id's_score.txt";
    Write-Output "Thanks for playing, please play again! " >> "$chooser\$id's_score.txt";
    Write-Host "Thanks for playing, please play again! ";
    $credits = read "Would you like to see the credits? Y or N: ";
    jpause;
    if ( $credits -ceq "Y" )
    {
        credits;
    }
	taskkill /f /im "powershell.exe";
}
mode con cols=105 lines=35;
Clear-Host;
Write-Host "";
Write-Host "";
Write-Host "           ``````                                                                  ````                 ";
Write-Host "     ``-+hs:-::///++++:-.                                             ``.-/+++///::--:hy/.           ";
Write-Host "        ``:+``       ``-+ym/.                ``. ````                     -sms/.        -+.              ";
Write-Host "          ``/``          ``+ddo-              ``:/:/``               ``/ymy:``          ::                ";
Write-Host "            /            ``/mMms:``            -mmmy/``         ./hNMh-            .:                 ";
Write-Host "            :``             .dMMMmo.       -/ymMMMMMd/-``    :yNMMM+              :                  ";
Write-Host "            /  ``.--::////:-./MMMMy+-     +osMMNsohho-:o`` ``/+dMMMm..-:////::--.  .-                 ";
Write-Host "          .o/::-.``````..-:+ydmNMMMs  ``    -.``mMMy  ````-o-      ``NMMMNmhs+:..````````-::-o:                ";
Write-Host "        ``/s/:``            ``-sNMM:  .:-.``  /MMN/``      ``-:-``  hMMd+.``            .:+o-              ";
Write-Host "            ``-:``             -dMh.  oNNmh+sMMM+``   -odmNm.  :NMo``             .:.``                 ";
Write-Host "              ``--          ./osymmhsmMMMN:-dNMNd+-``.oMMMMhsdNhyo+:`         ``-.                     ";
Write-Host "                ``:``     ``-:-.`` ``s+:/+oydNmmds+mMMNmmNmhyo+//s+  ``.::.      --                      ";
Write-Host "                 ``:   .--`    ``/``````````````./mh.  .shMMMN/.````````````.:    ``.--``  .-                        ";
Write-Host "                  .-``/:-.....``::.``````  ``````/.    ````NMMMy+` `````````-+``......-/: /                         ";
Write-Host "                   o+.``      ``/``                 /mMM/-/``     .:``     ````-++                        ";
Write-Host "                   .                            ``+MMN. ``/-  --``          ``.                        ";
Write-Host "                                             ``-+hMNm-    :+:-//-``                                  ";
Write-Host "                                          ./ydNMmy:.     ``.    ``--``                                ";
Write-Host "                                    ````  ``:oNMMh/``                 .``                               ";
Write-Host "                                  ./s. -:..NMN/``                   ````                              ";
Write-Host "                                .:. .:+.   :hNh+.``                                                 ";
Write-Host "                              ``:.     .      ./ymy``                                                ";
Write-Host "                             --                ``ss                                                 ";
Write-Host "                            -``                os-                                                  ";
Write-Host "                           .                 ..y``.                                                 ";
Write-Host "                                             shNy:                                                 ";
Write-Host "                                              +d.                                                  ";
Write-Host "                                               ``                                                   ";
Write-Host "";
Write-Host "";
Write-Host "                                           Made by SmithDevelopments     ";
Write-Host "";
Write-Host "";
Write-Host "                                           Loading... Please Wait                                      ";
Start-Sleep 3;
mode con cols=132 lines=50;
$id = read "Please enter your FIRST name only (glitches when two words are used): ";
$host.UI.RawUI.WindowTitle = "Beginning the Tests - $id";
Write-Host "Please choose the directory to save your score in. ";
Write-Host "";
Write-Host "This could take several seconds...";
Add-Type -AssemblyName System.windows.forms;
$f = New-Object System.Windows.Forms.FolderBrowserDialog;
$f.SelectedPath = Get-Location;
$f.Description = 'Please choose a folder.';
$f.ShowNewFolderButton = $true;
$f.showDialog();
$chooser = $f.selectedPath;
Write-Host "You chose $chooser"
$global:score = 1;
Clear-Host;
Write-Host "DO NOT PLAY WITH EARBUDS OR HEADPHONES IN. I AM NOT RESPONSIBLE FOR ANY HEARING DAMAGE.";
Write-Host "";
Write-Host "PLAY AT YOUR OWN RISK OF BEING CAUGHT BY A TEACHER.  I AM NOT RESPONSIBLE FOR ANYONE WHO GETS IN TROUBLE!";
bpause;
Clear-Host;
if ( $id -ceq "Sack" )
{
    while( $true )
    {
        Write-Host "MMMMmmmmmmmmmmmmmmmmmmm.................";
        Write-Host "Try again";
        Write-Host "press any key to continue to the program!";
        jpause;
        Clear-Host;
        Write-Host "you will not";
        Write-Host "YES";
        Write-Host "But seriously, you can press any key to continue now!";
        jpause;
        Clear-Host;
        Write-Host "haha!!";
        Start-Sleep 2;
        Write-Host "Dude seriously, just press any key to start the program that I made!";
        jpause;
    }
}
if ( $id -ceq "Carter" )
{
    Write-Host "bruh";
    Start-Sleep 1;
    Clear-Host;
}
if ( $id -ceq "Jake" )
{
    Start-Process "chrome.exe" "www.goole.com";
    taskkill /f /im "powershell.exe";
}
if ( $id -ceq "Alissa" )
{
    Write-Host "Difficulty increased to Asian Mode";
    Start-Sleep 3;
    q9;
    Clear-Host;
}
Write-Host "Hello, $id, this game will ask you questions, and if you get them right you will gain a point,";
Write-Host "however, if you get a question wrong you lose and will get to enjoy a small suprise...";
Write-Host "";
Write-Host "Also, after you lose, your score will be saved on a text file wherever you set it to save.  If you ";
Write-Host "do not provide a directory to save the score in, the score will not be saved";
Write-Host "";
Write-Host "Do not wear ear buds or headphones while playing this game... you also may want to turn the ";
Write-Host "volume off on your computer.";
Write-Host "";
Write-Host "Please answer in all lower case!";
Write-Host "";
Write-Host "If enough people like the game then I will update the game and fix its bugs... Trust me it has a lot of bugs!";
Write-Host "";
Write-Host "Ready?";
Write-Host "";
Write-Host "Type any key to start the game";
jpause;
Clear-Host;
Write-Host "Do you want to see the loading screen (it's pretty cool but I won't be offended if you choose to skip it)";
$loadingscreen = read "Y or N: ";
if ( $loadingscreen -cne "N" )
{
    for($i=1;$i -ne 101;$i++)
    {
        Write-Host "$i%";
        $null=ping localhost -n 1;
        Clear-Host;
    }
    Clear-Host;
    Write-Host "loading complete!";
    Start-Sleep 2;
    Clear-Host;
}
q1;
