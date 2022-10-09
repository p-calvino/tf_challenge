# Challenge 2 - Bonus
# For security and monitoring purposes, the client is requesting a dashboard 
# like interface that list all the running virtual machines that exists 
# in their application(private) subnet.

# You have been tasked to create a web server on the public subnet that will 
# provide a list of existing running instances within the private subnet. You 
# can use coding tools like Python(with boto3), bash scripting with awscliv2 or any other tools, 
# to collect the information about the infrastructure.

import boto3
import json
from flask import Flask, render_template
from datetime import datetime

app = Flask("Challenge_2")

client = boto3.client('ec2')
#private_subnet_id = [subnet['SubnetId'] for subnet in subnets_response['Subnets'] if subnet['Tags'] == tag]
#tag = [{"Key" : "Name", "Value" : "Private-1"}]

subnets_response = client.describe_subnets(Filters=[
    {'Name': 'tag:Name', 'Values': ['Private-1']}])

instances_response = client.describe_instances(Filters=[
    {'Name': 'instance-state-name', 'Values': ['running']}, 
    {'Name': 'subnet-id', 'Values': [f'{subnets_response["Subnets"][0]["SubnetId"]}']},
    ]
)

running_instances_names = []

for reservation in instances_response['Reservations']:
    for instance in reservation['Instances']:
        running_instances_names.append([instance['Tags'][0]['Value'], instance['LaunchTime'].strftime("%d/%m/%Y, %H:%M:%S")])

@app.route("/")
def get_running_instances():
    #return instances_response
    return render_template("index.html.tpl", instances_names = running_instances_names)

if __name__ == "__main__":
    app.run(host = "127.0.0.1")