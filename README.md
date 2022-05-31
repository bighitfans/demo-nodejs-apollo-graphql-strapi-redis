# Demo nodejs + Apollo + GraphQL + Strapi + Redis

#### IMPORTANT:

Please choose your tasks section from below depending on the role you are applying to.

After cloning this project, fork it before you begin development.

## Demo Stack

**api**: `nodejs` + `apollo graph server`

**Content Management System**: `Strapi`

**Container**: `docker compose`

## Task for NodeJS engineer

The `Demo` project is built on `nodejs` with `Apollo-GraphQL` & `Strapi`. The project has `GraphQL` `resolvers` and `schema` modelled for:
- `Employee` collection
- `Task` collection

Their relationships are as follows:

`Employee` : `one to many` : `Task`

Create `GraphQL` resolvers for `Department`

You have to:

- in `Strapi CMS`
      - create a `Department` `Content-Type`

- in `api` project:
      - create a `type` `Department` (ref: `src/graphql/employee.graphql`)
      - create a `resolver` `Department` (ref: `src/graphql/employee.js`)
      - create a `DataSource` `Department` (ref: `src/graphql-datasources\base.js`)

* Create three departments.

* Create several employees, and add 4 - 6 employees randomly in each department. For each employee create a related account and address entry.

* For each department create a few tasks. Each task may be assigned to 1 - 3 people randomly. Each employee must be assigned a task.

* Update random tasks from random departments as completed.


## Pre-requisite

`docker Desktop` + `docker-compose` should be installed

## Run Project

```bash
# start project with
docker compose up
or
docker-compose up

# run below command till nginx service appears
watch -x docker compose ps
# output
NAME                                                    COMMAND                  SERVICE             STATUS              PORTS
demo-nodejs-apollo-graphql-strapi-redis_adminer_1       "entrypoint.sh docke…"   adminer             running             8080/tcp
demo-nodejs-apollo-graphql-strapi-redis_api_1           "docker-entrypoint.s…"   api                 running
demo-nodejs-apollo-graphql-strapi-redis_db_1            "docker-entrypoint.s…"   db                  running (healthy)   3306/tcp
demo-nodejs-apollo-graphql-strapi-redis_init-api_1      "docker-entrypoint.s…"   init-api            exited (0)
demo-nodejs-apollo-graphql-strapi-redis_init-strapi_1   "docker-entrypoint.s…"   init-strapi         exited (0)
demo-nodejs-apollo-graphql-strapi-redis_nginx_1         "/docker-entrypoint.…"   nginx               running             0.0.0.0:25080->80/tcp
demo-nodejs-apollo-graphql-strapi-redis_redis_1         "docker-entrypoint.s…"   redis               running (healthy)   6379/tcp
demo-nodejs-apollo-graphql-strapi-redis_strapi_1        "docker-entrypoint.s…"   strapi              running

# to view logs run
docker compose logs -f
```

### Access api

http://localhost:25080/graphql

You may test your code by using the Apollo GraphQL client at https://studio.apollographql.com/sandbox/explorer with endpoint as http://localhost:25080/graphql

### Access Strapi

http://localhost:25080/strapi/

Strapi login credentials:

Username: demo@app.com

Password: Demo@123


## Application Components and Design

<pre>
                                          ┌──────────────────────────────────────────────────────────────────┐
                                          │                       docker compose network                     │
                                          ├──────────────────────────────────────────────────────────────────┤
                                          │                                                                  │
                                          │ ┌────────┐                                                       │
                                          │ │        │                      ┌───────────┐                    │
┌───┐  http://localhost:25080/api/upload  │ │        │ api:3000/api/upload  │           │                    │
│   │ ──────────────────────────────────► │ │        │ ───────────────────► │           │                    │
│   │                                     │ │        │                      │ api:30000 │                    │
│   │  http://localhost:25080/graphql     │ │        │ api:3000/grapql      │           │                    │
│   │ ──────────────────────────────────► │ │        │ ───────────────────► │           │                    │
│   │                                     │ │        │                      └─┬─container                    │
│   │                                     │ │        │                        │                              │
│   │                                     │ │        │                        ├──► ┌────────────┐            │
│ B │                               exposes │        │                        │    │ redis:6379 │            │
│ r │                                  port │        │                        │    └────container            │
│ o │                                 25080 │nginx:80│                        │                              │
│ w │                                     │ │        │                        │    strapi:1337/query         │
│ s │                                     │ │        │                        └──► ┌─────────────┐           │
│ e │  http://localhost:25080/strapi      │ │        │ strapi:1337/strapi          │             │           │
│ r │ ──────────────────────────────────► │ │        │ ──────────────────────────► │             │           │
│   │                                     │ │        │                             │ strapi:1337 │           │
│   │  http://localhost:25080/capi/query  │ │        │ strapi:1337/query           │             │           │
│   │ ──────────────────────────────────► │ │        │ ──────────────────────────► │             │           │
│   │                                     │ │        │                             └─────container           │
│   │                                     │ │        │                                       │               │
│   │                                     │ │        │                                       └─► ┌─────────┐ │
│   │                                     │ │        │                      ┌──────────────┐     │ db:3306 │ │
│   │  http://localhost:25080/adminer     │ │        │ adminer:8080         │ adminer:8080 │ ──► └─container │
└───┘ ──────────────────────────────────► │ └─container ──────────────────► └──────container                 │
                                          │                                                                  │
                                          └──────────────────────────────────────────────────────────────────┘
Note: The endpoints http://localhost:25080/api/* & http://localhost:25080/graphql
      are the only public endpoints
      The remaining routes are only for development purpose and are not available in production
</pre>
