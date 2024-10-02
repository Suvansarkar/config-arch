# if status is-login
# 	exec Hyprland
# end

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# alias batcon "echo '\_SB.PCI0.LPC0.EC0.VPC0.SBMC 0x03' > /proc/acpi/call"
# alias batcoff "su && echo '\_SB.PCI0.LPC0.EC0.VPC0.SBMC 0x05' > /proc/acpi/call"
# alias batcstat "echo '\_SB.PCI0.LPC0.EC0.BTSM' > /proc/acpi/call && (cat /proc/acpi/call; printf '\n')"
alias hyprconf="nvim ~/.config/hypr/hyprland.conf"
alias sem4="cd ~/stuff/Semester\ 4"
alias ls="exa -l --icons"
alias icat="kitten icat"

export EDITOR="nvim"

set fish_greeting
neofetch
starship init fish | source
