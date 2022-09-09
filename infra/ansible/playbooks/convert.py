import yaml
import json
import subprocess


subprocess.call('yc compute instance get docker-host > vm_1.yml')

with open('vm_1.yml', 'r') as file:
    configuration = yaml.safe_load(file)

ip = configuration.get("network_interfaces")[0].get('primary_v4_address').get('one_to_one_nat').get('address')
name = configuration.get("name")

h = { # results of inventory script as above go here
    # ...
    "_meta": {
        "hostvars": {
            name: {
                name : ip
            },
        }
    }
}

with open('inventory.json', 'w') as json_file:
    json.dump(h, json_file)

output = json.dumps(json.load(open('inventory.json')), indent=2)
