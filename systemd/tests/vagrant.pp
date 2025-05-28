node default {
  include ::systemd

  systemd::override { 'elasticsearch.service.d':
    content => '[Service]
LimitMEMLOCK=infinity'
  }

  systemd::unit { 'bitbucket.service':
    content => '[Unit]
Description=Atlassian Bitbucket
After=network.target

[Service]
Type=forking
ExecStart=/opt/atlassian/bitbucket/latest/bin/start-bitbucket.sh
ExecStop=/opt/atlassian/bitbucket/latest/bin/stop-bitbucket.sh
User=deploy

[Install]
WantedBy=multi-user.target'
  }

}