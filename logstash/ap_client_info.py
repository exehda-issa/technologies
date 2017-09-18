#!/usr/bin/python

import subprocess
import os
import json
from sys import stdout, exit, exc_info

winst_servers = ['$IP_LIST']

data_json = []
output = ''

for winst_server in winst_servers:
        ret_ap = subprocess.check_output(["ssh", "-o PreferredAuthentications=publickey", "-p 20000", "user@" + winst_server, "cat /root/winst/ap_serv | awk -F';' '{print $2}'"])
        ap_servers = ret_ap.splitlines()
        for ap_server in ap_servers:
                ap_ip = ap_server
                with open(os.devnull, 'w') as devnull:
			try:
	                        ret = subprocess.check_output(["ssh", "-o PreferredAuthentications=publickey", "-p 20000", "user@" + winst_server, "sshpass -p 'password' ssh -o ConnectTimeout=10 -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no vendor_login@" + ap_ip + " \"wstalist; mca-status\""], stderr=devnull)
			except:
				e = exc_info()[0]
				data = {}
				data["ap_ip"] = ap_ip
				data["exception"] = str(e)
				data["except_reason"] = "Access Point probably down."
				stdout.write(json.dumps(data) + '\n')
		ret_wstalist, ret_status = ret.rsplit("]", 1)
		ret_wstalist =  ret_wstalist + "]"
                ret_wstalist = "".join( ret_wstalist.splitlines())
                ret_wstalist = ret_wstalist.replace("\t", "")
                ret_json = json.loads(ret_wstalist)

		ret_status = ret_status.splitlines()
		status_header = ret_status[1].split(",")
		data = {}
		for item in status_header:
			name, value = item.split("=")
			data[name] = value
		for item in ret_status[3:]:
			name, value = item.split("=")
			data[name] = value
                for item in ret_json:
                        item["ap_essid"] = data["essid"]
                        item["ap_ip"] = ap_ip
                        output = output + json.dumps(item) + '\n'
		output = output + json.dumps(data) + '\n'
			
stdout.write(output)
stdout.flush()
exit(0)

