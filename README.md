# accounts-new-movement

[![Quality gate](https://sonarcloud.io/api/project_badges/quality_gate?project=bastianX6_accounts-new-movement)](https://sonarcloud.io/dashboard?id=bastianX6_accounts-new-movement)
[![Build Status](https://app.bitrise.io/app/3f4492fef4a3f5d7/status.svg?token=IN8CNY9l3mTK2-cm3AQ6IQ)](https://app.bitrise.io/app/3f4492fef4a3f5d7)

This package contains all logic needed to:
- Add a new movement (income or expenditure).
- Edit a movement.
- Delete a movement.

It is used by [accounts](https://github.com/bastianX6/accounts) app.

# Targets
- `NewMovementCommon`: Contains the base code used by "OS specific" targets (like `NewMovement_iOS`).
- `NewMovement_iOS`: Contains the views and data structures to add, edit and delete a movement in iOS devices.

# Dependencies
- [DataManagement](https://github.com/bastianX6/accounts-data-management)
- [AccountsUI](https://github.com/bastianX6/accounts-ui)
- [DependencyResolver](https://github.com/bastianX6/accounts-dependency-resolver)
