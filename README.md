## Introduction

Reproduction for https://github.com/prisma/prisma/issues/3866


## Steps

1. Clone this repo and replace credentials in prisma/.env
2. Import the `schema.sql` file
3. Run `prisma generate` to generate the character_set_client
4. Run `yarn start` to execute

## Version Information

```
@prisma/cli          : 2.9.0-dev.49
@prisma/client       : 2.9.0-dev.49
Current platform     : darwin
Query Engine         : query-engine bc00f40f17ea2d691411eb7b529ca1529b68dc80 (at node_modules/@prisma/cli/query-engine-darwin)
Migration Engine     : migration-engine-cli bc00f40f17ea2d691411eb7b529ca1529b68dc80 (at node_modules/@prisma/cli/migration-engine-darwin)
Introspection Engine : introspection-core bc00f40f17ea2d691411eb7b529ca1529b68dc80 (at node_modules/@prisma/cli/introspection-engine-darwin)
Format Binary        : prisma-fmt bc00f40f17ea2d691411eb7b529ca1529b68dc80 (at node_modules/@prisma/cli/prisma-fmt-darwin)
Studio               : 0.296.0
```
