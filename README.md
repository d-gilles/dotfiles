# David's Configuration Repository

This repository serves as the foundation for my development environment. It encompasses a series of configuration files, scripts, and vital tool setups crucial for orchestrating a new machine in accordance with my preferences.

In addition to these config files, you can find a terrafrom configuration for GCP in the ```setup_remote_mashine/``` folder. This can be used to set up a remote VM as a development environment on Google Cloud Plattform.

## Contents & Descriptions

1. **start.sh**:
    - A bash shell script tailored to set up a comprehensive development environment on an Ubuntu-based system.
    - **Key Features**:
        - **Package Updates**: The script begins by updating the package repositories to ensure all installations and upgrades fetch the latest versions.
        - **Basic Installs**:
            - **Zsh**: A powerful shell that offers various interactive features and plugins.
            - **Pip**: Python's package installer.
            - **Pyenv/Virtualenv**: Tools for managing multiple Python environments. Helpful to avoid version conflicts between projects.
            - **Oh My Zsh**: A community-driven framework to manage Zsh configuration, with lots of useful functions, helpers, plugins, and themes.
        - **Additional Commands**:
            - **Tree**: A recursive directory listing command that produces a depth-indented listing of files.
            - **GitHub CLI (`gh`)**: GitHub's official command line tool.
        - **Docker Installation**:
            - Sets up the Docker repository and installs Docker Engine.
            - A `hello-world` Docker container is run to ensure Docker is installed and functioning correctly.
    - **Usage**:
        - Run this script after setting up a fresh Ubuntu-based system to configure a robust development environment. It ensures the system is populated with necessary tools and configurations essential for development, especially for projects involving Python and Docker.


2. **install.sh**:
    - A Zsh shell script designed to seamlessly set up David's development environment across different machines.
    - **Key Features**:
        - **Backup Existing Configs**: Renames the target configuration files (like `.zshrc`, `.gitconfig`, etc.) by appending a `.backup` extension if they already exist and are not symlinks. This ensures that existing configurations are not lost during the installation.
        - **Symlink Creation**: Links the configuration files from this repository to their respective standard locations in the home directory. This allows for easy updates and maintenance as changes to the repository files reflect immediately on the system.
        - **Plugin Installation**: Automatically fetches and installs essential Zsh plugins, like `zsh-syntax-highlighting`, enhancing the shell's capabilities.
        - **VS Code Setup**: Configures Visual Studio Code with the provided settings and keybindings by linking the `settings.json` and `keybindings.json` to their required locations.
    - To use, execute the script after cloning the repository. It'll orchestrate the aforementioned tasks and set up the system based on David's preferences.

3. **.zshrc**:
    - Configuration for the Zsh shell.
    - It uses the `LENICO` theme and outlines a selection of Zsh plugins.
    - Sets Python environments and custom settings.

4. **.zprofile**:
    - Contains initialization scripts for Zsh login shells.
    - Mainly for setting up `pyenv`.

5. **.gitconfig**:
    - Configurations for Git, setting colors, editor choices, and a range of useful Git aliases.

6. **aliases**:
    - Short commands for common operations like getting external IP, HTTP serving, and Git shortcuts.

7. **config**:
    - SSH configuration file detailing global and host-specific SSH settings.

8. **linux.txt**:
    - A list of python default packages installed on my machine.
    - use `pip install -r linux.txt` to install all of them

9. **settings.json** & **keybindings.json**:
    - Visual Studio Code configuration files.

10. **config-terminal**:
    - Configuration for the Windows Terminal.

11. **Prompts.txt**:
    - Curated prompts for ChatGPT. like the one I used to create the basic of this README.

## Prerequisites
Before you proceed with the setup and installation of this configuration repository, ensure that you meet the following prerequisites:

Operating System: This setup is tailored for Ubuntu-based systems. Using a different distribution or operating system might require adjustments.

Git: Ensure you have Git installed to clone the repository and handle version control.

Installation:
```
sudo apt update
sudo apt install git -y
```


## Installation

1. Clone the repo: `git clone https://github.com/d-gilles/dotfiles.git`
2. Run `bash ./dotfiles/start.sh`
3. Run `bash ./dotfiles/install.sh`

Enjoy 🙂

## Credit
This configuration repository draws inspiration from and is based on the dotfiles repo by Le Wagon. A heartfelt thank you to the Le Wagon team for laying the groundwork and sharing their invaluable configurations. It has significantly streamlined the setup process and continues to serve as a solid foundation for personal customizations.


## Contribution:
If you're keen on making direct enhancements, simply fork the repo, make your changes, and submit a pull request.

## Feedback:
For feedback or ideas, please open an issue in the GitHub repository. Every piece of feedback, whether it's a new idea or a potential enhancement, helps us evolve and refine the repository.

Thank you for helping us make this project even better!
