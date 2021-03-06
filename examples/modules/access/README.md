# Deploying Access Template

[![Releases](https://img.shields.io/github/release/f5networks/f5-azure-arm-templates-v2.svg)](https://github.com/f5networks/f5-azure-arm-templates-v2/releases)
[![Issues](https://img.shields.io/github/issues/f5networks/f5-azure-arm-templates-v2.svg)](https://github.com/f5networks/f5-azure-arm-templates-v2/issues)

## Contents

- [Deploying Access Template](#deploying-access-template)
  - [Contents](#contents)
  - [Introduction](#introduction)
  - [Prerequisites](#prerequisites)
  - [Important Configuration Notes](#important-configuration-notes)
  - [Resources Provisioning](#resources-provisioning)
    - [Template Input Parameters](#template-input-parameters)
    - [Template Outputs](#template-outputs)
  - [Resource Creation Flow Chart](#resource-creation-flow-chart)


## Introduction

This solution uses an ARM template to launch a stack for provisioning Access related items. This template can be deployed as a standalone; however, the main intention is to use as a module for provisioning Access related resources:

  - Built-in Role Definition
  - Custom Role Definition
  - Managed Identity
  - Key Vault
  - Secrets


## Prerequisites

  - None. This template does not require provisioning of additional resources.

## Important Configuration Notes

  - This template provisions resources based on conditions. See [Resources Provisioning](#resources-provisioning) for more details on each resource's minimal requirements.
  - A sample template, 'sample_linked.json', is included in the project. Use this example to see how to add a template as a linked template into your templated solution.
 
## Resources Provisioning

  * [Managed Identity](https://docs.microsoft.com/en-us/azure/active-directory/managed-identities-azure-resources/)
    - Requires providing `userAssignedIdentityName` parameter.
    - Used as dependency for provisioning KeyVault and Secrets.
  * [KeyVault](https://docs.microsoft.com/en-us/azure/key-vault/general/basic-concepts)
    - Dependent on Azure Managed Identity.
    - Allows to specify KeyVault Name; otherwise will construct.
  * Secrets
    - Secret which will be stored in Azure KeyVault.
    - Requires providing `secretName` and `secretValue`.
  * [Azure Built-in Roles](https://docs.microsoft.com/en-us/azure/role-based-access-control/built-in-roles):
    - Enabled role types:
      * Reader
      * Contributor
      * Owner
      * User Access Administrator
  * Custom Role Definition
    - Allows to create custom role definition.
    - Requires providing `customRoleName` and `customRoleDescription` parameters for successful provisioning.
    - Takes a few additional parameters (i.e. `customRoleAssignScopes`, `customRoleActions`, and `customRoleNotActions`) intended for customizing rule defintion.



### Template Input Parameters

| Parameter | Required | Description |
| --- | --- | --- |
| builtInRoleType | No | Specifies built-in role type name. Allowed values are 'Owner', 'Contributor', 'UserAccessAdministrator'. |
| customRoleAssignableScopes | No | List of scopes applied to Role. |
| customRoleDescription | No | Description for custom role. |
| customRoleName| No | Provides value for custom role definiton which will be created by the template. |
| customRolePermissions| No | Array of permissions for the custom roleDefinition. |
| keyVaultName | No | Key Vault name. |
| keyVaultPermissionsKeys | No | Array of permissions allowed on KeyVault Secrets for role. |
| keyVaultPermissionsSecrets | No | Array of permissions allowed on KeyVault Secrets for role. |
| secretName | No | Enter the secret name. |
| secretValue | No | Enter the secret value. |
| userAssignedIdentityName | No | User Assigned Identity name. |
| tagValues | No | Default key/value resource tags will be added to the resources in this deployment, if you would like the values to be unique, adjust them as needed for each key. |

### Template Outputs

| Name | Description | Required Resource | Type |
| --- | --- | --- | --- |
| builtInRoleId | Built-in role resource ID | None | String |
| customRoleDefinitionId | Custom role definition resource ID | Custom Role Definition | String |
| keyVaultName | Key Vault name | Key Vault | String |
| secretName | Secret name | Secret | String |
| userAssignedIdentityName | User assigned identity name | User Assigned Identity | String |

## Resource Creation Flow Chart


![Resource Creation Flow Chart](https://github.com/F5Networks/f5-azure-arm-templates-v2/blob/v1.4.0.0/examples/images/azure-access-module.png)
