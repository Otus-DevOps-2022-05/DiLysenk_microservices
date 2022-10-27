from time import sleep

import yaml
import ast
import argparse

parser = argparse.ArgumentParser(description='manual to this script')
parser.add_argument('--set_ip_master', type=str)
parser.add_argument('--set_ip_worker', type=str)
args = parser.parse_args()


def edit_inventory(argument):
    if argument is None:
        return
    elif args.set_ip_master:
        ip_master = ast.literal_eval(argument)
        host_name = [name for name in ip_master.keys()][0]
        dict_ip = {"all": {"hosts": {host_name: {"ansible_host": ip_master[host_name]}}}}
        with open(r'../ansible/playbooks/inventory.yml', 'w') as file:
            yaml.dump(dict_ip, file)
    elif args.set_ip_worker:
        ip_worker = ast.literal_eval(argument)
        host_name = [name for name in ip_worker.keys()][0]
        with open("../ansible/playbooks/inventory.yml") as yaml_dict:
            dict_from_yaml = yaml.safe_load(yaml_dict)
        with open(r"../ansible/playbooks/inventory.yml", 'w') as file:
            dict_from_yaml["all"]["hosts"][host_name] = {"ansible_host": ip_worker[host_name]}
            yaml.dump(dict_from_yaml, file)


edit_inventory(args.set_ip_master)
edit_inventory(args.set_ip_worker)
sleep(1)
