# Nemea VS Code
This folder contains basic development environment for remove development using visual studio code. The virtual machine during provisioning clones nemea repository and compiles it for basic development.

## Requirements
* **Visual studio code from official microsoft repository.** Otherwise the Remote - SSH plugin is unavailable from market place.
* Extensions for vscode are locateted inside virtual machine.
* Configuration and tasks for vscode are copied **once** at vagrant provisioning inside the cloned nemea repository inside the virtual machine.
* Working installation of **vagrant**

## Instalation
        vagrant up
        vagrant ssh-config

Copy the ssh settings inside you .sshd config. Inside vscode `Ctrl+Shift+P Remote-SSH: Open Configuration File`
Replace the default name with appropriate name.

## Visual studio code connect
Inside vscode `Ctrl+Shift+P Remote-SSH: Connect to Host`
Select from list the name of the ssh-config configured earlier.

## Visual studio code
The visual studio code project comes with prepared tasks for configuring and building the nemea project.
* `Ctrl+P task configure`
* `Ctrl+Shift+B` or `Ctrl+P task make`
* `Ctrl+P task test`
* `Ctrl+P task clean`
* `Ctrl+P task distclean`

These task can be configured from repository files inside `.vscode`. There is also preconfigured cpp settings acording nemea C and C++ standards with enabled tracing for proper autocompletion using `intercept-build` generating `compile-commands.json`. 


## Filesystem
The user is operating under `vargant` user with standard home `/home/vagrant`. The nemea repository is situated inside the `/home/vagrant/nemea-repo`.

## Python development
Python libraries are install inside virtual environment located `/home/vagrant/nemea/venv` pytrap.


## CLion support
Unfortunatly i don't like CLion so i have not added support for JetbrainsIDE. The jetbrains remote development supports mainly cmake and i'm not sure if it can easily support autotools project. [CLion remote development](https://www.jetbrains.com/help/clion/remote-projects-support.html)