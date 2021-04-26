(
 curl -fsSL "https://code-server.dev/install.sh" | sh
 sudo systemctl enable --now code-server@$USER
 sudo chown -R vagrant:vagrant "/usr/lib/code-server"
 mkdir ~/.vscode-server
 ln -s "/usr/lib/code-server" "/home/vagrant/.vscode-server"

 code-server --extensions-dir "/usr/lib/code-server/extensions" \
    --install-extension "maelvalais.autoconf" \
    --install-extension "ms-vscode.cpptools"
)
