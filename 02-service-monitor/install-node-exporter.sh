wget https://github.com/prometheus/node_exporter/releases/download/v0.17.0/node_exporter-0.17.0.linux-amd64.tar.gz

tar xvfz node_exporter-0.17.0.linux-amd64.tar.gz
sudo cp node_exporter-0.17.0.linux-amd64/node_exporter /usr/bin/node_exporter

touch /etc/sysconfig/node_exporter

cat > /etc/systemd/system/node_exporter.service << EOF
[Unit]
Description=Node Exporter

[Service]
User=root
EnvironmentFile=/etc/sysconfig/node_exporter
ExecStart=/usr/bin/node_exporter $OPTIONS

[Install]
WantedBy=multi-user.target
EOF

sudo ufw allow 9100

sudo systemctl daemon-reload
sudo systemctl enable node_exporter
sudo systemctl start node_exporter