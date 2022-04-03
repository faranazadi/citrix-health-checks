function Get-CitrixDeliveryGroups {
    
    <#
    .SYNOPSIS
    Retrieves a list of all Delivery Groups of a single Citrix Virtual Apps and Desktops Delivery Controller.
    
    .DESCRIPTION
    This cmdlet returns a custom object with names and IDs of all Delivery Groups of the specified Delivery
    Controller.
    
    .LINK
    https://github.com/karjona/citrix-odata
    
    .PARAMETER DeliveryController
    Specifies a single Citrix Virtual Apps and Desktops Delivery Controller to collect data from.
    
    .PARAMETER Credential
    Specifies a user account that has permission to send the request. A minimum of read-only administrator
    permissions on Citrix Virtual Apps and Desktops are required to collect this data.
    
    Enter a PSCredential object, such as one generated by the Get-Credential cmdlet.
    
    .COMPONENT
    citrix-odata
    #>
    
    
    [CmdletBinding()]
    [OutputType('PSCustomObject')]
    
    param(
    [Parameter(Mandatory=$true)]
    [String]
    $DeliveryController,
    
    [Parameter()]
    [PSCredential]
    $Credential
    )
    
    process {
        try {
            $Query = '$select=Id,Name'
            $InvokeCitrixMonitorServiceQueryParams = @{
                DeliveryController = $DeliveryController
                Endpoint = 'DesktopGroups'
                Query = $Query
                ErrorAction = 'Stop'
            }
            if ($Credential) {
                $InvokeCitrixMonitorServiceQueryParams.Add("Credential", $Credential)
            }
            
            Write-Progress -Id 1 -Activity "Retrieving Delivery Groups for $DeliveryController"
            $DeliveryGroups = Invoke-CitrixMonitorServiceQuery @InvokeCitrixMonitorServiceQueryParams
        } catch {
            $ConnectionError = $_
            throw $ConnectionError
        } finally {
            Write-Progress -Id 1 -Activity "Retrieving Delivery Groups for $DeliveryController" -Completed
        }
        $DeliveryGroups
    }
}