#Echo off
$host.ui.RawUI.ForegroundColor="Green";
$host.ui.RawUI.BackgroundColor="Black";
$cd=Get-Location;
$host.ui.RawUI.WindowTitle="The Riddle Quiz Version 2.1";
#Do some fancy stuff that I am too lazy to do
Start-Sleep 3;
Write-Host "Please enter your FIRST name only (glitches when two words are used):";
$id=Read-Host "";
$host.ui.RawUI.WindowTitle="Beginning the Tests - $id";
Write-Host "Please choose the directory to save your score in.";
Write-Host "";
Write-Host "This could take several seconds...";
Add-Type -AssemblyName System.windows.forms|Out-Null;
$f=New-Object System.Windows.Forms.FolderBrowserDialog;
$f.SelectedPath=$cd;
$f.Description="Please choose a folder.";
$f.ShowNewFolderButton=$true;
$f.ShowDialog();
$chooser=$f.SelectedPath;
Write-Host "You chose $chooser";
#del fchooser
Start-Sleep 2;
$score=1;
Clear-Host;
Write-Host "DO NOT PLAY WITH EARBUDS OR HEADPHONES IN. I AM NOT RESPONSIBLE FOR ANY HEARING DAMAGE.";
Write-Host "";
Write-Host "PLAY AT YOUR OWN RISK OF BEING CAUGHT BY A TEACHER. I AM NOT RESPONSIBLE FOR ANYONE WHO GETS IN TROUBLE!";
Pause;
Clear-Host;
if($id -eq "Sack")
{
  while($true)
  {
    Write-Host "MMMMmmmmmmmmmmmmmmmmmmm.................";
    Write-Host "Try again";
    Write-Host "press enter to continue to the program!";
    Pause > $null;
    Clear-Host;
    Write-Host "you will not";
    Write-Host "YES";
    Write-Host "But seriously, you can press enter to continue now!";
    Pause > $null;
    Clear-Host;
    Write-Host "haha!!";
    Start-Sleep 2;
    Write-Host "Dude seriously, just press enter to start the program that I made!";
    Pause > $null;
  }
}
