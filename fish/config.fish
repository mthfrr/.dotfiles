if status is-interactive
    # Fish
    set -eg fish_greeting

    # Commands to run in interactive sessions can go here
    alias hx=helix
    if command -v batcat >/dev/null
        alias bat=batcat
    end

    # Tide
    set -U tide_proxy_color $_tide_color_light_blue
    set -U tide_proxy_bg_color normal
    set -U tide_proxy_icon '🌐'

    set -U tide_right_prompt_items status cmd_duration context jobs direnv node python rustc java php pulumi ruby go gcloud kubectl distrobox toolbox terraform aws nix_shell crystal elixir zig proxy time
end
