# function to toggle on/off proxy
function proxy -d "Toggle proxy environnement variables"
    if set -qx http_proxy
        or set -qx https_proxy
        or set -qx HTTP_PROXY
        or set -qx HTTPS_PROXY
        set -eg {http_proxy,https_proxy,HTTP_PROXY,HTTPS_PROXY,no_proxy,NO_PROXY}
    else
        for var in http_proxy https_proxy HTTP_PROXY HTTPS_PROXY
            set -xg $var $PROXY_CONF
        end
        for var in {no_proxy,NO_PROXY}
            set -xg $var $NOPROXY_CONF
        end
        echo "Proxy through $PROXY_CONF (ignore $NOPROXY_CONF)"
    end
end
