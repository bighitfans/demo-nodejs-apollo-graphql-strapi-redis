# Demo nodejs + Apollo + GraphQL + Strapi + Redis

#### IMPORTANT:

After cloning this project, fork it before you begin development.

## About the `Demo` Project

### Project Stack

|**api** |`nodejs` + `apollo graph server` |
|:--|:--|
|**Content Management System** |`Strapi` |
|**Database** |`mariadb` |
|**Container** |`docker compose` |

### Description

The `Demo` project is built on `nodejs` with `Apollo-GraphQL` & `Strapi`.

The project has `GraphQL` `resolvers` and `schema` modelled for:

- `Employee` collection

- `Task` collection

Their relationships are as follows:

`Employee` : `one-to-many` : `Task`

(Employee `belongs to many` Tasks)

## Task for nodejs developers

Add a `Department` collection

### Steps:

- in `Strapi CMS`

  * create a `Department` `Content-Type`

- in `gqlserver` project:

  * create a `type` `Department` (ref: `src/graphql/employee.graphql`)

  * create a `resolver` `Department` (ref: `src/graphql/employee.js`)

  * create a `DataSource` `Department` (ref: `src/graphql-datasources\base.js`)

* Create three departments.

* Create several employees, and add 4 - 6 employees randomly in each department. For each employee create a related account and address entry.

* For each department create a few tasks. Each task may be assigned to 1 - 3 people randomly. Each employee must be assigned a task.

* Update random tasks from random departments as completed.


## Pre-requisite

- `docker Desktop` + `docker-compose` should be installed

- understanding of `Strapi`

  - [About Strapi v3](https://strapi.io/)

  - [Getting Started v3](https://docs-v3.strapi.io/developer-docs/latest/getting-started/introduction.html)

## Run Project

```bash
# start project with
docker compose up -d
or
docker-compose up -d

# run below command till nginx service appears
watch -x docker compose ps
# output
NAME                                                    COMMAND                  SERVICE             STATUS              PORTS
demo-nodejs-apollo-graphql-strapi-redis_adminer_1       "entrypoint.sh docke…"   adminer             running             8080/tcp
demo-nodejs-apollo-graphql-strapi-redis_gqlserver_1     "docker-entrypoint.s…"   gqlserver           running
demo-nodejs-apollo-graphql-strapi-redis_db_1            "docker-entrypoint.s…"   db                  running (healthy)   3306/tcp
demo-nodejs-apollo-graphql-strapi-redis_init-gqlserver_1"docker-entrypoint.s…"   init-gqlserver      exited (0)
demo-nodejs-apollo-graphql-strapi-redis_init-strapi_1   "docker-entrypoint.s…"   init-strapi         exited (0)
demo-nodejs-apollo-graphql-strapi-redis_nginx_1         "/docker-entrypoint.…"   nginx               running             0.0.0.0:25080->80/tcp
demo-nodejs-apollo-graphql-strapi-redis_redis_1         "docker-entrypoint.s…"   redis               running (healthy)   6379/tcp
demo-nodejs-apollo-graphql-strapi-redis_strapi_1        "docker-entrypoint.s…"   strapi              running

# to view logs run
docker compose logs -f

# to view `gqlserver` & `strapi` project logs
docker compose logs -f gqlserver strapi

# to view only `gqlserver` logs
docker compose logs -f gqlserver

# to view only `strapi` logs
docker compose logs -f strapi
```

## Access details

|service | endpoint | credentials |
|:--|:-:|:-|
| Access gqlserver | http://localhost:25080/graphql | - |
| Access Strapi | http://localhost:25080/strapi/ |  _Strapi login credentials: <br />Username: **demo@app.com** <br />Password: **Demo@123**_ |
| Access mariadb | http://localhost:25080/adminer/ | _Adminer login credentials: <br /> System: **MySQL** <br /> Server: **db** <br /> Username: **admin** <br /> Password: **dbpass** <br /> Database: **gqlserver**_ |

You may test your code by using the Apollo GraphQL client at https://studio.apollographql.com/sandbox/explorer with endpoint as http://localhost:25080/graphql

## Application Components and Design

<pre>
                                                ┌────────────────────────────────────────────────────────────────────────┐
                                                │                       docker com      pose network                     │
                                                ├────────────────────────────────────────────────────────────────────────┤
                                                │                                                                        │
                                                │ ┌────────┐                                                             │
                                                │ │        │                            ┌─────────────────┐              │
┌───┐  http://localhost:25080/gqlserver/upload  │ │        │ gqlserver:3000/api/upload  │                 │              │
│   │ ──────────────────────────────────►       │ │        │ ─────────────────────────► │                 │              │
│   │                                           │ │        │                            │ gqlserver:30000 │              │
│   │  http://localhost:25080/graphql           │ │        │ gqlserver:3000/grapql      │                 │              │
│   │ ──────────────────────────────────►       │ │        │ ─────────────────────────► │                 │              │
│   │                                           │ │        │                            └─┬───────container              │
│   │                                           │ │        │                              │                              │
│   │                                           │ │        │                              ├──► ┌────────────┐            │
│ B │                                     exposes │        │                              │    │ redis:6379 │            │
│ r │                                        port │        │                              │    └────container            │
│ o │                                       25080 │nginx:80│                              │                              │
│ w │                                           │ │        │                              │    strapi:1337/query         │
│ s │                                           │ │        │                              └──► ┌─────────────┐           │
│ e │  http://localhost:25080/strapi            │ │        │ strapi:1337/strapi                │             │           │
│ r │ ──────────────────────────────────►       │ │        │ ────────────────────────────────► │             │           │
│   │                                           │ │        │                                   │ strapi:1337 │           │
│   │  http://localhost:25080/capi/query        │ │        │ strapi:1337/query                 │             │           │
│   │ ──────────────────────────────────►       │ │        │ ────────────────────────────────► │             │           │
│   │                                           │ │        │                                   └─────container           │
│   │                                           │ │        │                                             │               │
│   │                                           │ │        │                                             └─► ┌─────────┐ │
│   │                                           │ │        │                            ┌──────────────┐     │ db:3306 │ │
│   │  http://localhost:25080/adminer           │ │        │ adminer:8080               │ adminer:8080 │ ──► └─container │
└───┘ ──────────────────────────────────►       │ └─container ────────────────────────► └──────container                 │
                                                │                                                                        │
                                                └────────────────────────────────────────────────────────────────────────┘
Note: The endpoints http://localhost:25080/gqlserver/* & http://localhost:25080/graphql
      are the only public endpoints
      The remaining routes are only for development purpose and are not available in production
</pre>
