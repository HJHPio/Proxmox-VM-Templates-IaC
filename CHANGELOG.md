# Changelog

All notable changes to this project will be documented in this file.

## [1.0.0] – 2025-04-26
- Marked the project as completed following extensive testing conducted by external projects (approximately 10 templates generated per week over a two-month period across various setups).
- Updated the roadmap to serve as a list of suggested extension ideas, intended for individual exploration and learning rather than future project development.
- Revised the attribution section to accurately list the tools and technologies used.
- Improved the README file to reflect the current state of the project and enhanced overall documentation consistency.
- Integrated Confizard to enable quickstart deployments.
- Updated the main script (infrastructure/scripts/createCustomizedTemplateVM.sh) to support decompression of .bz2 and .gz archive formats.
- Corrected the handling of image file names in the main script when reusing an existing decompressed image.
- Resolved an issue with the default ADDITIONAL_SSH_CONFIG flag being incorrectly set in advance (previous workaround required manually passing the --ssh-public-keys flag without configuration as the final argument).

## [0.0.1] – 2024-12-06 

### Added

- Initial release (version 0.0.1) of this project. 
