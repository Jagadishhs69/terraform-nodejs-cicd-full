#!/bin/bash
yum update -y
yum install -y docker amazon-cloudwatch-agent
systemctl start docker
systemctl enable docker
mkdir -p /opt/aws/amazon-cloudwatch-agent/etc/
cat <<EOF > /opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json
{
  "logs": {
    "logs_collected": {
      "files": {
        "collect_list": [
          {
            "file_path": "/var/log/messages",
            "log_group_name": "ec2-instance-logs",
            "log_stream_name": "{instance_id}"
          }
        ]
      }
    }
  }
}
EOF
/opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl   -a fetch-config -m ec2 -c file:/opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json -s
