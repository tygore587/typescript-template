# Typescript project template

This project serves as a typescript project template.

# Tools

The following tools are setup here:

- `pnpm` as Package Manager
- Typescript
- `Eslint` for linting
- `Prettier` for formatting
- `Husky`/`linted staged` for pre-commit hooks
- `Jest` as test runner
- [launch.json](./.vscode/launch.json) to run and debug it in vscode without any external library like `tsx` or `ts-node`
- `nodemon` to run with a debugger automatically on restart

`Eslint` and `Prettier` are using the standard rules from `airbnb`.

## Duplicated tsconfigs

There are multiple `tsconfig.json` because `eslint` need to include the test folder which should not be the case while building the project. The solution is to have a [tsconfig.base.json](./tsconfig.base.json) which includes all files used for eslint. And also have a [tsconfig.json](./tsconfig.json) which excludes the folders which should not be build. In the [.eslintrc.cjs](./.eslintrc.cjs) we configure the `tsconfig.base.json`.

# Debug

There are 2 ways to debug.

1. Run the `Launch Program` option if you want to directly debug in vscode and run the compiler before
2. If you want to have a constant watch process first open a terminal and run `pnpm debug`. This will automatically start a watch process with `nodemon` and opens a port for the debugger to connect. Than go and run `Attach nodemon` and chose the first node process.
   This works really great because the debugger stays connected all the time even on restarts. So its easier to debug errors.

# Deployment

Also this project includes a [dockerfile](./Dockerfile) to build the project and run it in docker.
