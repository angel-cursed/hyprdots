
#!/usr/bin/env python3

import pynvim
import os
import sys
import re

# Usage:
# Pipe the command to switch themes to this script
#
# For example, in file `~/.config/hypr/keybindings.conf`
# Before:
# bind = $mainMod+Shift, T, exec, pkill -x rofi || $scrPath/themeselect.sh # launch theme select menu
# After:
# bind = $mainMod+Shift, T, exec, pkill -x rofi || $scrPath/themeselect.sh | python3 $HOME/.config/hypr/scripts/change_nvim_colorscheme.py # launch theme select menu
#
# Note:
# Check the code below to see what needs to be modified


def get_coloscheme():
    """
    Function to get the neovim colorscheme name from the HyDE config file
    """
    # The neovim theme corresponding to the Hyde theme
    # Does not fully correspond
    # You can change or add your favorite themes
    nvim_colorscheme = {
        "Catppuccin Mocha": "rose-pine-main",
        "Catppuccin Latte": "catppuccin-latte",
        "Rosé Pine": "catppuccin",
        "Tokyo Night": "tokyonight-night",
        "Material Sakura": "rose-pine-dawn",
        "Gruvbox Retro": "gruvbox-material",
        "Nordic Blue": "nordfox",
        "Graphite Mono": "kanagawa-wave",
        "Synth Wave": "synthwave84",
        "Decay Green": "everforest",
        "Edge Runner": "ayu",
        "Frosted Glass": "onenord-light",
    }

    config_path = os.path.join(os.getenv("HOME"), ".config", "hyde", "hyde.conf")
    config = {}

    with open(config_path, "r") as file:
        for line in file:
            line = line.strip()

            if line.startswith("#") or not line:
                continue

        if "=" in line:
            key, value = line.split("=", 1)
            config[key.strip()] = value.strip().strip('"')

    match = config.get("hydeTheme")

    if match:
        return nvim_colorscheme.get(match, "catppuccin")
    else:
        raise ValueError("Error: No theme found in the HyDE output.")


def replace_coloscheme(file_path, colorscheme):
    """
    Function to change the colorscheme setting line in the given file_path with given colorscheme.
    As I use Lazyvim, to Save my theme configuration permanently, I only need to change:
    {
        "LazyVim/LazyVim",
        opts = {
                colorscheme = "rose-pine-main",
        },
    },
    """
    # Read the contents of the file
    with open(file_path, "r") as file:
        lines = file.readlines()

    # Replace the target line with the new line
    for i in range(len(lines)):
        if "vim.cmd.colorscheme" in lines[i]:
            lines[i] = f'vim.cmd.colorscheme "{colorscheme}"'
            break  # Stop after the first replacement

    # Write the modified lines back to the file
    with open(file_path, "w") as file:
        file.writelines(lines)


def send_command(address, command):
    """
    Function to send a command to a Neovim instance
    """
    nvim = pynvim.attach("socket", path=address)
    nvim.command(command)


def get_nvim_addresses():
    """
    Get all Neovim instances socket address in a certain path.
    All my neovim socket address is in /run/user/1000.
    Run `:echo v:servername` in neovim to see yours.
    """
    base_path = "/run/user/1000"
    # List all entries in the directory and filter for those starting with 'nvim'
    return [
        os.path.join(base_path, entry)
        for entry in os.listdir(base_path)
        if entry.startswith("nvim")
    ]


def send_command_all(command):
    """
    Function to send command to all Neovim instances
    """
    addresses = get_nvim_addresses()
    for address in addresses:
        try:
            send_command(address, command)
        except Exception as e:
            print(f"Error communicating with {address}: {e}")


def main():
    colorscheme = get_coloscheme()
    replace_coloscheme(
        os.path.join(os.getenv("HOME"), ".config", "nvim", "init.lua"), colorscheme
    )
    send_command_all(f"colorscheme {colorscheme}")


if __name__ == "__main__":
    main()
