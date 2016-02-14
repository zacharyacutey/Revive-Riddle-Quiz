#Echo off
$cd=Get-Location;
$host.ui.RawUI.WindowTitle="The Riddle Quiz Version 2.1";
function Echo-Host
{
  Write-Host $args[0] -foreground "green" -background "black";
}
#Do some fancy stuff that I am too lazy to do
Start-Sleep 3;
Echo-Host "Please enter your FIRST name only (glitches when two words are used):";
$id=Read-Host "";
$host.ui.RawUI.WindowTitle="Beginning the Tests - $id";
Echo-Host "Please choose the directory to save your score in.";
Echo-Host "";
Echo-Host "This could take several seconds...";
Add-Type -AssemblyName System.windows.forms|Out-Null;
$f=New-Object System.Windows.Forms.FolderBrowserDialog;
$f.SelectedPath=$cd;
$f.Description="Please choose a folder.";
$f.ShowNewFolderButton=$true;
$f.ShowDialog();
$chooser=$f.SelectedPath;
Echo-Host "You chose $chooser";
#del fchooser
Start-Sleep 2;
$score=1;
Clear-Host;
Echo-Host "DO NOT PLAY WITH EARBUDS OR HEADPHONES IN. I AM NOT RESPONSIBLE FOR ANY HEARING DAMAGE.";
Echo-Host "";
Echo-Host "PLAY AT YOUR OWN RISK OF BEING CAUGHT BY A TEACHER. I AM NOT RESPONSIBLE FOR ANYONE WHO GETS IN TROUBLE!";
Pause;
Clear-Host;
if($id -eq "Sack")
{
  while($true)
  {
    Echo-Host "MMMMmmmmmmmmmmmmmmmmmmm.................";
    Echo-Host "Try again";
    Echo-Host "press enter to continue to the program!";
    Pause | Out-Null;
    Clear-Host;
    Echo-Host "you will not";
    Echo-Host "YES";
    Echo-Host "But seriously, you can press enter to continue now!";
    Pause | Out-Null;
    Clear-Host;
    Echo-Host "haha!!";
    Start-Sleep 2;
    Echo-Host "Dude seriously, just press enter to start the program that I made!";
    Pause | Out-Null;
  }
}
    
  }
