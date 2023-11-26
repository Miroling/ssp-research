envsubst < .devcontainer/nginx.conf > .devcontainer/nginx.tmp.conf
sudo nginx -c /workspaces/ssp-research/.devcontainer/nginx.tmp.conf