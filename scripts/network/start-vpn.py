#!/bin/python
import subprocess
import json
import argparse
import pexpect

USERNAME = 'username'
PASSWORD = 'password'

def connect(cred_json, ovpn_path):
    if(".json" not in cred_json or ".ovpn" not in ovpn_path):
        raise ValueError("Error: Unsupported file format")
    try:
        creds = json.load( open(cred_json) )
        child = pexpect.spawn( "sudo openvpn " +  ovpn_path )
        child.expect("Enter Auth Username: ")
        child.sendline(str(creds[USERNAME]))
        child.expect("Enter Auth Password: ")
        child.sendline(str(creds[PASSWORD]))
        child.interact()

        print child.before  
    except Exception as e:
        print "Error:", "Error reading file", cred_json, "\n" + str(e)
         

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("credentials", type=str, help="user and password file")
    parser.add_argument("ovpn_path", type=str, help="path to OVPN file")
    args = parser.parse_args()

    connect(args.credentials, args.ovpn_path)

if __name__ == '__main__':
    main()



