if status is-interactive
    # Fish
    set -g fish_greeting ""

    set -xg EDITOR helix

    # Commands to run in interactive sessions can go here
    alias l="ls -lh"
    alias la="ls -lha"
    alias hx=helix
    if command -v 7zz >/dev/null
        alias 7z=7zz
    end
    if command -v batcat >/dev/null
        alias bat=batcat
    end

    # Path
    for i in ~/.local/bin
        if not contains $i $PATH
            fish_add_path $i
        end
    end


    # Tide
    set -U tide_proxy_color $_tide_color_light_blue
    set -U tide_proxy_bg_color normal
    set -U tide_proxy_icon '🌐'

    set -U tide_right_prompt_items status cmd_duration context jobs direnv node python rustc java php pulumi ruby go gcloud kubectl distrobox toolbox terraform aws nix_shell crystal elixir zig proxy time
end
