import yaml
import ast
import argparse



parser = argparse.ArgumentParser(description='manual to this script')
parser.add_argument('--set_ip_master', type=str)
parser.add_argument('--set_ip_worker', type=str)
args = parser.parse_args()

if args.set_ip_master is not None:
    ip_master = ast.literal_eval(args.set_ip_master)
    with open(r'../ansible/playbooks/inventory.yaml', 'w') as file:
        yaml.dump(ip_master, file)
else:
    pass
if args.set_ip_worker is not None:
    ip_worker = ast.literal_eval(args.set_ip_worker)
    with open(r'../ansible/playbooks/inventory.yaml', 'a+') as file:
        yaml.dump(ip_worker, file)
else:
    pass
