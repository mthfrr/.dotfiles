function _tide_item_proxy
    # _tide_print_item proxy $tide_proxy_icon (echo hello | string)
    if set -qx http_proxy
        or set -qx https_proxy
        or set -qx HTTP_PROXY
        or set -qx HTTPS_PROXY
        _tide_print_item proxy $tide_proxy_icon
    end
end
