Write-Host "File name: $fileName"
# Load the necessary assembly
Add-Type -AssemblyName System.Windows.Forms

# Create an OpenFileDialog object
$FileBrowser = New-Object System.Windows.Forms.OpenFileDialog

# Set properties (optional)
$FileBrowser.InitialDirectory = [Environment]::GetFolderPath('Desktop')
$FileBrowser.Filter = "All files (*.*)|*.*"
$FileBrowser.Title = "Select a file"

# Show the dialog and get the result
$null = $FileBrowser.ShowDialog()

# Get the selected file path
$SelectedFilePath = $FileBrowser.FileName
$MediaPlayer = [Windows.Media.Playback.MediaPlayer, Windows.Media, ContentType = WindowsRuntime]::New()
$MediaPlayer.Source = [Windows.Media.Core.MediaSource]::CreateFromUri($SelectedFilePath)
$MediaPlayer.Play()
echo $SelectedFilePath
Pause