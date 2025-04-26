# Proxmox VM Templates IaC
This repository demonstrates how to provision VM templates on a Proxmox instance using Infrastructure as Code (IaC).
It currently supports two VM templates optimized for OKD deployments, but it can be easily extended to provision any VM templates available on the Proxmox host.

Parent project: [OwnLab](https://github.com/orgs/HJHPio/projects/2)  
![OwnLabLogo](./IMGs/OwnLab/OwnLab-Logo-1_V2024.11.28.png)

## Quick Setup Guide
### Confizard (Recommended)
Visit the official [Confizard](https://confizard.hjhp.io/?extConfUrl=https://confizard-assets.pages.dev/proxmox-vm-templates-iac) portal to generate an automated deployment script.
(The link is preconfigured with the steps corresponding to this repository, hosted at https://confizard-assets.pages.dev/proxmox-vm-templates-iac. )

### Manual Deployment
1. Navigate to the Terraform directory:  
```sh
cd infrastructure/terraform
```
2. Create a terraform.tfvars file from the provided example and populate the required variables:  
```sh
cp terraform.tfvars.example terraform.tfvars && vi terraform.tfvars
```
3. Initialize and deploy the infrastructure:  
```sh
tofu init
tofu plan -out=init.tfplan
tofu apply "init.tfplan"
```
4. *Additional information:*  
Detailed manual instructions for creating VM templates are available in the [README](./infrastructure/README.md) located within the infrastructure directory.

## Changelog
[CHANGELOG.md](./CHANGELOG.md) file includes project changes in each release.

## Support
Everyone is welcome to submit an issue ticket on either GitHub or GitLab (depending on which platform this mirror of the project is hosted). Submitted issues will be automatically reviewed, and the main developer will be notified.
If you prefer private support (e.g., if you do not wish to share logs publicly), you can contact the project main developer via email at [support@hjhp.io](mailto:support@hjhp.io).

## Security
If you identify any security problems, please contact us immediately with the necessary details via email at [security@hjhp.io](mailto:security@hjhp.io).  
Please note that the email could end up in the spam folder. If you do not receive a timely response, please try emailing again.  
If the detected vulnerability is critical and the response to emails is not fast enough, please create an issue ticket to inform others and mitigate potential risks.
For more information please refer to [SECURITY.md](./SECURITY.md) file.

## Contributing
Everyone is welcome to contribute via GitHub pull requests or GitLab merge requests.
After reviewing and merging into the respective branches (*github-main* / *gitlab-main*), the final version of the software will be merged into the main branch on the private Git instance, and then all existing mirrors will be updated.  
Instructions on how to contribute can be found in [CONTRIBUTING.md](./CONTRIBUTING.md) file.

## Attribution
This project is maintained by its contributors.
The main tools and technologies used are listed in the [ATTRIBUTION-manual.md](./ATTRIBUTION-manual.md) file.
Automatically detected dependencies and their acknowledgments are listed in the [ATTRIBUTION.md](./ATTRIBUTION.md). file.

## License
*TL;DR:* This project is licensed under the MIT License.  
Everyone is welcome to fork and use it for private and commercial purposes.  
Full license can be found in [LICENSE](./LICENSE) file.  

## Project Status and Roadmap
The project is currently considered complete.  
Previous roadmap ideas have been retained as examples for potential individual extensions, and are documented in the [ROADMAP.md](./ROADMAP.md) file.

New feature requests can be submitted through discussions on any of the project's hosted mirrors.
