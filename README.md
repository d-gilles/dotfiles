# David's Configuration Repository

This repository serves as the foundation for my development environment. It encompasses a series of configuration files, scripts, and vital tool setups crucial for orchestrating a new machine in accordance with my preferences.

In addition to these config files, you can find a terrafrom configuration for GCP in the ```setup_remote_mashine/``` folder. This can be used to set up a remote VM as a development environment on Google Cloud Plattform.

## Prerequisites
Before you proceed with the setup and installation of this configuration repository, ensure that you meet the following prerequisites:

Operating System: This setup is tailored for Ubuntu-based systems. Using a different distribution or operating system might require adjustments.

Git: Ensure you have Git installed to clone the repository and handle version control. If you dont have it:
```
sudo apt update
sudo apt install git -y
```

## Installation

1. Clone the repo: `git clone https://github.com/d-gilles/dotfiles.git`
2. cd into the folder `cd dotfiles`
3. Run `sh setup.sh`
4. check if pyenv is installed propper
5. Run `zsh setup2.sh`

Enjoy 🙂

## Credit
This configuration repository draws inspiration from and is based on the [dotfiles repo](https://github.com/lewagon/dotfiles) by Le Wagon. A heartfelt thank you to the Le Wagon team for laying the groundwork and sharing their invaluable configurations. It has significantly streamlined the setup process and continues to serve as a solid foundation for personal customizations.
The main changes I made were:
1. Cleaning up a lot of stuff I don't need because I'm not a webdev and don't use a Mac.
2. Customizing the terminal theme for python/pyenv/git
3. Automating the whole setup process to just clone the repo and execute one script.
4. Adding some tools and aliases that I like to use.
5. Setting up the Terraform configuration.


## **Contents & Descriptions**

1. **setup.sh**:
    - A shell script tailored to initiate and orchestrate the comprehensive setup of a development environment on an Ubuntu-based system.
    - **Key Features**:
        - **Kickstarts the Configuration**: Initiates the setup by calling **`config.sh`**, **`python.sh`**, **`env.sh`**, and **`setup2.sh`** in sequence.
        - **Centralizes the Setup Flow**: Ensures a seamless and step-by-step setup, avoiding missing out on any essential component or step.
    - **Usage**:
        - Initiate this script after setting up a fresh Ubuntu-based system. It is the entry point to the entire process, ensuring that all required tools and configurations are systematically installed and set up.
2. **config.sh**:
    - A Zsh shell script that focuses on updating system packages and setting up essential development tools.
    - **Key Features**:
        - **Package Updates**: Updates the package repositories to ensure all installations and upgrades fetch the latest versions.
        - **Basic Installs**:
            - **Zsh**: An interactive shell known for its features and plugins.
            - **Oh My Zsh**: A community-driven framework to manage Zsh configuration.
        - **Additional Commands**:
            - **Tree**: A command to visualize directory structure.
            - **GitHub CLI (`gh`)**: GitHub's official command line tool.
        - **Docker Installation**:
            - Sets up the Docker repository and installs Docker Engine.
            - Verifies Docker's installation by running a **`hello-world`** container.
3. **python.sh**:
    - A Zsh shell script dedicated to Python-related installations and configurations.
    - **Key Features**:
        - **Pyenv & Virtualenv**: Manages multiple Python versions and environments to avoid version conflicts.
        - **Python 3.10.6 Installation**: Ensures the desired Python version is installed and set up correctly.
4. **env.sh**:
    - A Zsh shell script that establishes the Python virtual environment, ensuring projects remain isolated.
    - **Key Features**:
        - **Virtual Environment Creation**: Sets up a Python 3.10.6 virtual environment named "sandbox".
        - **Environment Activation Check**: Informs the user if the virtual environment needs manual activation.
5. **setup2.sh**:
    - A Zsh script that handles additional setups, including software installations and VS Code extensions.
    - **Key Features**:
        - **Software Installations**: Executes **`other_install.sh`** for a series of tool installations.
        - **VS Code Extensions**: Executes **`vs-code-extentions.sh`** to load desired extensions into VS Code.
6. **.zshrc**:
    - Configuration for the Zsh shell.
    - It uses the `LENICO` theme and outlines a selection of Zsh plugins.
    - Sets Python environments and custom settings.

7. **.zprofile**:
    - Contains initialization scripts for Zsh login shells.
    - Mainly for setting up `pyenv`.

8. **.gitconfig**:
    - Configurations for Git, setting colors, editor choices, and a range of useful Git aliases.

9. **aliases**:
    - Short commands for common operations like getting external IP, HTTP serving, and Git shortcuts.

10. **config**:
    - SSH configuration file detailing global and host-specific SSH settings.

11. **linux.txt**:
    - A list of python default packages installed on my machine.
    - use `pip install -r linux.txt` to install all of them

12. **settings.json** & **keybindings.json**:
    - Visual Studio Code configuration files.

13. **config-terminal**:
    - Configuration for the Windows Terminal.


## Contribution:
If you're keen on making direct enhancements, simply fork the repo, make your changes, and submit a pull request.

## Feedback:
For feedback or ideas, please open an issue in the GitHub repository. Every piece of feedback, whether it's a new idea or a potential enhancement, helps us evolve and refine the repository.

Thank you for helping us make this project even better!
