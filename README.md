# *** prowler-aws-security-hub ***

Administración de usuario aws cli para usar STS y asumir un rol temporal para trabajar desde línea de comandos.

Creación de usuarios y roles
- Creación de usuario aws-cli. Agregar policy administrada por el cliente <policy_admin_client_aws_cli.json>
- Creación de ACCESS KEY y SECRET_ACCESS_KEY.
- Creación de rol RoleAssumePermissions. Agregar permisos que queremos obtener durante la sesión temporal.
- Agregar al rol, relación de confianza <policy_trust_relation.json>

Ejecutar scripts de script-powershell/*.ps1

### Security HUB
- Activar Security HUB 
- Activar Integración con Prowler

### AWS CLOUDFORMATION
aws cloudformation create-stack --stack-name Verificacion-ENS-con-Prowler --template-body file://codebuild-prowlerv3-audit-account-cfn.yaml --capabilities CAPABILITY_IAM

https://github.com/prowler-cloud/prowler/tree/master/contrib/codebuild
https://www.ccn-cert.cni.es/es/800-guia-esquema-nacional-de-seguridad/6990-ccn-stic-887b-guia-rapida-de-prowler-1/file.html
