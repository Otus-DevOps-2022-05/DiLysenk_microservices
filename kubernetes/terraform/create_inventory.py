from time import sleep

import yaml
import ast
import argparse

parser = argparse.ArgumentParser(description='manual to this script')
parser.add_argument('--set_ip_master', type=str)
parser.add_argument('--set_ip_worker', type=str)
parser.add_argument('--set_ip', type=str)
args = parser.parse_args()


def edit_inventory(argument):
    if argument is None:
        return

    elif args.set_ip:
        ip_worker = ast.literal_eval(argument)
        host_name = [name for name in ip_worker.keys()][0]
        for i in range(3):
            try:
                with open("../ansible/playbooks/inventory.yml") as yaml_dict:
                    dict_from_yaml = yaml.safe_load(yaml_dict)
            except FileNotFoundError:
                sleep(5 * i)
            else:
                break
        with open(r"../ansible/playbooks/inventory.yml", 'w') as file:
            dict_from_yaml["all"]["hosts"][host_name] = {"ansible_host": ip_worker[host_name]}
            yaml.dump(dict_from_yaml, file)
        with open(r"../ansible/playbooks/hosts_variables.yml", 'a+') as file:
            yaml.dump({host_name: ip_worker[host_name]}, file)



    elif args.set_ip_master:
        ip_master = ast.literal_eval(argument)
        host_name = [name for name in ip_master.keys()][0]
        dict_ip = {"all": {"hosts": {host_name: {"ansible_host": ip_master[host_name]}}}}
        with open(r'../ansible/playbooks/inventory.yml', 'w') as file:
            yaml.dump(dict_ip, file)
        with open(r'../ansible/playbooks/hosts_variables.yml', 'w') as file:
            yaml.dump({host_name: ip_master[host_name]}, file)
    elif args.set_ip_worker:
        ip_worker = ast.literal_eval(argument)
        host_name = [name for name in ip_worker.keys()][0]
        for i in range(3):
            try:
                with open("../ansible/playbooks/inventory.yml") as yaml_dict:
                    dict_from_yaml = yaml.safe_load(yaml_dict)
            except FileNotFoundError:
                sleep(5 * i)
            else:
                break
        with open(r"../ansible/playbooks/inventory.yml", 'w') as file:
            dict_from_yaml["all"]["hosts"][host_name] = {"ansible_host": ip_worker[host_name]}
            yaml.dump(dict_from_yaml, file)
        with open(r"../ansible/playbooks/hosts_variables.yml", 'a+') as file:
            yaml.dump({host_name: ip_worker[host_name]}, file)


edit_inventory(args.set_ip_master)
edit_inventory(args.set_ip_worker)
sleep(1)
