# accounts-new-movement

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
