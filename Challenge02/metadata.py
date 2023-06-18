import json
from azure.identity import DefaultAzureCredential
from azure.mgmt.compute import ComputeManagementClient

def get_instance_metadata():
    # Create Azure credentials
    credential = DefaultAzureCredential()

    # Create a Compute Management client
    subscription_id = "4b942759-0148-4d4c-9ddc-2de3295d6f2d"
    compute_client = ComputeManagementClient(credential, subscription_id)

    # Get the instance metadata
    metadata = compute_client.virtual_machines.get(
        "TestLabs",
        "web-tier-vm-1"
    )

    return metadata.as_dict()

# Get instance metadata
instance_metadata = get_instance_metadata()

# Convert to JSON
json_output = json.dumps(instance_metadata, indent=4)

# Print the JSON output
print(json_output)
