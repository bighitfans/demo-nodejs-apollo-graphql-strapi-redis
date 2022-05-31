# IMPORTANT:

# 1. Please choose your tasks section from below depending on the role you are applying to.

# 2. After cloning this project, fork it before you begin development.

# ---------------------------------------------------------------------------------------------------

# Task for NodeJS engineer

# You have been provided with a basic backend project involving GraphQL, Strapi etc. The project has basic GraphQL resolvers and schema modelled after a company.

#

# The entities are: employee, department, task, account, and address.

# Their relationships are as follows:

# Employee : many to one : Task

# Employee : many to one : Department

# Task : many to one : Department

# Employee : one to one : Account

# Employee: one to one : Address

#

# Create any missing entities and relationships yourself using the existing ones as reference.

#

# You are required to write code and perform the following tasks using GraphQL:

# Create three departments.

# Create several employees, and add 4 - 6 employees randomly in each department. For each employee create a related account and address entry.

# For each department create a few tasks. Each task may be assigned to 1 - 3 people randomly. Each employee must be assigned a task.

# Update random tasks from random departments as completed.

#

#

# To run the project, have Docker installed and running, then run docker-compose up -d

# Strapi CMS can be accessed at http://localhost:25080/strapi/

# Strapi login credentials:

# Username: demo@app.com

# Password: Demo@123

# You may test your code by using the Apollo GraphQL client at https://studio.apollographql.com/sandbox/explorer with endpoint as http://localhost:25080/graphql

# ---------------------------------------------------------------------------------------------------

# nodejs + Apollo + GraphQL + Strapi + Redis

## Stack

**api**: `nodejs` + `apollo graph server`

**Content Management System**: `Strapi`

**Container**: `docker compose`

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

## Application Components and access

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
