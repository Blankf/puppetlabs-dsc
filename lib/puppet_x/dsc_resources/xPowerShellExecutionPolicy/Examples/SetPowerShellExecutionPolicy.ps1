#--------------------------------------------------------------------------------- 

Configuration SetPowerShellExecutionPolicy
{
    Param
    (
        #Target nodes to apply the configuration  
        [String[]]$NodeName = $env:COMPUTERNAME,
        
        #Changes the user preference for the Windows PowerShell execution policy.
        [Parameter(Mandatory)]
        [ValidateSet("Bypass","Restricted","AllSigned","RemoteSigned","Unrestricted")]
        [String]$SetExecutionPolicy
    )
    Import-DSCResource -ModuleName xPowerShellExecutionPolicy

    Node $NodeName
    {
        xPowerShellExecutionPolicy ExecutionPolicy
        {
            ExecutionPolicy = $SetExecutionPolicy
        }
    }
}

SetPowerShellExecutionPolicy -NodeName "localhost" -SetExecutionPolicy "bypass"
Start-DscConfiguration -Path .\SetPowerShellExecutionPolicy  -Wait -Force -Verbose