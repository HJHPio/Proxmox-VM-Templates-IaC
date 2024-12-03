Parent project: [OwnLab](https://github.com/orgs/HJHPio/projects/2)  
![OwnLabLogo](./IMGs/OwnLab/OwnLab-Logo-1_V2024.11.28.png)
# Proxmox VM Templates IaC
This repository is designed to provision VM templates for a Proxmox instance using code.
Currently, it supports only two VM templates at a time, specifically tailored for OKD deployments. Future plans include support for provisioning all VM templates available in a Proxmox instance.

## Quick Setup Guide
<!-- TODO: Update this with Confizard integration and utility container for Terraform automation -->
1. Navigate to the Terraform directory: 
```sh
cd infrastructure/terraform
```
2. Create a terraform.tfvars file from the example and populate the required variables:
```sh
cp terraform.tfvars.example terraform.tfvars && vi terraform.tfvars
```
3. Initialize and set up the infrastructure:
```sh
tofu init
tofu plan -out=init.tfplan
tofu apply "init.tfplan"
```
4. *Additional info:*  
Detailed manual examples for using the script to create VM templates can be found in the [README](./infrastructure/README.md) located within the infrastructure directory.

## Roadmap
[ROADMAP.md](./ROADMAP.md) file includes upcoming features and future plans.

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

## Project status
The project is in its initial state.  
The scope and targets may change after discussions in issues.
