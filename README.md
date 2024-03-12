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

`Eslint` and `Prettier` are using the standard rules from `airbnb`.

## Duplicated tsconfigs

There are multiple `tsconfig.json` because `eslint` need to include the test folder which should not be the case while building the project. The solution is to have a [tsconfig.base.json](./tsconfig.base.json) which includes all files used for eslint. And also have a [tsconfig.json](./tsconfig.json) which excludes the folders which should not be build. In the [.eslintrc.cjs](./.eslintrc.cjs) we configure the `tsconfig.base.json`.

# Deployment

Also this project includes a [dockerfile](./Dockerfile) to build the project and run it in docker.
