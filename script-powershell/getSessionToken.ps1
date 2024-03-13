Param (
  [Parameter(Mandatory=$true)][string]$ArnRole,
  [Parameter(Mandatory=$true)][string]$NameSession,
  [Parameter(Mandatory=$true)][string]$SerialNumber,
  [Parameter(Mandatory=$true)][string]$TokenCode,
  [Parameter(Mandatory=$false)][string]$Region
)


$aws = Get-Command aws
if( $? ) {
    
    $responseAws = aws sts assume-role --role-arn $ArnRole --role-session-name $NameSession --serial-number $SerialNumber --token-code $TokenCode
    
    if( $? ) {
        $json = $responseAws | ConvertFrom-Json

        $Env:AWS_ACCESS_KEY_ID=$json.Credentials.AccessKeyId
        $Env:AWS_SECRET_ACCESS_KEY=$json.Credentials.SecretAccessKey
        $Env:AWS_SESSION_TOKEN=$json.Credentials.SessionToken

        Write-Output "AWS_ACCCESS_KEY_ID=$($json.Credentials.AccessKeyId)"
        Write-Output "AWS_SECRET_ACCESS_KEY=$($json.Credentials.SecretAccessKey)"
        Write-Output "AWS_SESSION_TOKEN=$($json.Credentials.SessionToken)"
        if( $Region.Length -gt 0 ){
            $Env:AWS_DEFAULT_REGION=$Region
            Write-Output "AWS_DEFAULT_REGION=$($Region)"
        }
    }
}