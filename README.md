# Dev setup

Set up development environment on clean Windows 10/11.

## Description

`setup.ps1` script will perform following jobs.

- Install `Chocolatey`
- Install `git`, `python`, `awscli`, `vscode` using `choco`
- Add AWSCLI auto completion function to `$PROFILE`
- (Optional) Install vscode [extensions](#vscode-extensions)

If you want to install vscode extensions, uncomment lines at the bottom.

## Usage
Run following command.

```ps1
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force

./setup.ps1
```

## vscode extensions

- [redhat.vscode-yaml](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-yaml)
- [ms-python.python](https://marketplace.visualstudio.com/items?itemName=ms-python.python)
- [boto3typed.boto3-ide](https://marketplace.visualstudio.com/items?itemName=Boto3typed.boto3-ide)
- [kddejong.vscode-cfn-lint](https://marketplace.visualstudio.com/items?itemName=kddejong.vscode-cfn-lint)
