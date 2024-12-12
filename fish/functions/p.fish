function p -d "Prefix command with environnement variables" --wraps="env {http_proxy,https_proxy,HTTP_PROXY,HTTPS_PROXY}=$PROXY_CONF {no_proxy,NO_PROXY}=$NOPROXY_CONF "
    env {http_proxy,https_proxy,HTTP_PROXY,HTTPS_PROXY}=$PROXY_CONF {no_proxy,NO_PROXY}=$NOPROXY_CONF $argv
end
