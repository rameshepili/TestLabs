# Specify the resource group and VM name
$resourceGroupName = "TestLabs"
$vmName = "web-tier-vm-1"

$ScriptString = "curl -H Metadata:true 'http://169.254.169.254/metadata/instance?api-version=2021-12-13&format=json' | python -m json.tool"

# Invoke the command on the VM
$metadataResponse = Invoke-AzVMRunCommand -ResourceGroupName $resourceGroupName -VMName $vmName -CommandId RunShellScript -ScriptString $ScriptString

