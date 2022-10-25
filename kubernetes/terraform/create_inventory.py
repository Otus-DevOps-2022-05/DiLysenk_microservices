import yaml
import ast
import argparse

parser = argparse.ArgumentParser(description='manual to this script')
parser.add_argument('--set_ip_master', type=str)
parser.add_argument('--set_ip_worker', type=str)
args = parser.parse_args()

# if args.set_ip_master is not None:
#     ip_master = ast.literal_eval(args.set_ip_master)
#     host_name = [name for name in ip_master.keys()][0]
#     dict_ip = {"all":{"hosts": {host_name: {"ansible_host": ip_master[host_name]}}}}
#     with open(r'../ansible/playbooks/inventory.yaml', 'w') as file:
#         yaml.dump(dict_ip, file)
# else:
#     pass

def edit_inventory(argument, param):
    if argument is None:
        return
    else:
        ip_master = ast.literal_eval(argument)
        host_name = [name for name in ip_master.keys()][0]
        dict_ip = {"all": {"hosts": {host_name: {"ansible_host": ip_master[host_name]}}}}
        with open(r'../ansible/playbooks/inventory.yaml', param) as file:
            yaml.dump(dict_ip, file)

edit_inventory(args.set_ip_master, 'w')
edit_inventory(args.set_ip_worker, 'a+')