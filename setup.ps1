# Install chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Install git, python, awscli, vscode
choco install git --params "'/GitAndUnixToolsOnPath /DefaultBranchName:main /WindowsTerminal'" -y --force
choco install python awscli -y
choco install vscode -y

# AWS CLI auto completion
echo @'
Register-ArgumentCompleter -Native -CommandName aws -ScriptBlock {
    param($commandName, $wordToComplete, $cursorPosition)
        $env:COMP_LINE=$wordToComplete
        if ($env:COMP_LINE.Length -lt $cursorPosition){
            $env:COMP_LINE=$env:COMP_LINE + " "
        }
        $env:COMP_POINT=$cursorPosition
        aws_completer.exe | ForEach-Object {
            [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
        }
        Remove-Item Env:\COMP_LINE     
        Remove-Item Env:\COMP_POINT  
}
'@ >> $PROFILE

# Reload PATH env variable
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine")

# # Install vscode extensions
# code --install-extension redhat.vscode-yaml `
#     --install-extension ms-python.python `
#     --install-extension boto3typed.boto3-ide `
#     --install-extension kddejong.vscode-cfn-lint
# python -m pip install cfn-lint
