# Demo nodejs + Apollo + GraphQL + Strapi + Redis

#### IMPORTANT:

After cloning this project, fork it before you begin development.

## About the `repo`

The `repo` has 2 projects in folders:

`gqlserver` => a `nodejs` based `apollo-graphql-server`

`.infra/strapi` => `strapi` headless CMS

The project runs using `docker compose`, which also runs `services`- `nginx`, `mariadb`, `redis` & `adminer` used by above projects.

### Project `services` / Stack
| service | lang/pkg/tool | description |
|:--|:--|:--|
| `gqlserver` |`nodejs` + `apollo graph server` | main `nodejs` server |
| `strapi` | [Strapi CMS](https://strapi.io/) | Content Management System |
| `db` | `mariadb` | Database |
| `adminer` | [Adminer](https://www.adminer.org/) | DBMS |
| `nginx` | `nginx` | for url routing |

### Description

The project is built on `nodejs` with `Apollo-GraphQL` & `Strapi`.

The `gqlserver` project has `GraphQL` `resolvers` and `schema` modelled for:

- `Employee` collection

- `Task` collection

Their relationships are as follows:

`Employee` : `one-to-many` : `Task`

(Employee `belongs to many` Tasks)

The models are created in `Strapi CMS` which uses `mariadb` for storing daata.

## Task for nodejs developers

Add a `Department` collection & its `resolvers` in `gqlserver` project

### Steps:

- in `Strapi CMS`

  * create a `Department` `Content-Type`

- in `gqlserver` project:

  * create a `type` `Department` (ref: `src/graphql/employee.graphql`)

  * create a `resolver` `Department` (ref: `src/graphql/employee.js`)

  * create a `DataSource` `Department` (ref: `src/graphql-datasources\base.js`)

- using `Strapi CMS` add following data:
  * add three departments.

  * add several employees, and add 4 - 6 employees randomly in each department. For each employee create a related account and address entry.

  * For each department add a few tasks. Each task may be assigned to 1 - 3 people randomly. Each employee must be assigned a task.

  * Update random tasks from random departments as completed.

## Runming Project

The project runs inside docker container with `hot reload` enabled. Any changes made to `gqlserver/src` folder will be `hot reloaded`.

### Pre-requisite

- `docker Desktop` + `docker-compose` should be installed

- understanding of `Strapi`

  - [About Strapi v3](https://strapi.io/)

  - [Getting Started v3](https://docs-v3.strapi.io/developer-docs/latest/getting-started/introduction.html)

### Steps to Run `Project`

**Windows** user install `docker` in `WSL` mode & run commands in `PowerShell (x86)`.

**Ubuntu** & **Mac** users use `terminal`.

```bash
# in (window/terminal 1) start project with
docker compose up
or
docker-compose up

# in a (window/terminal 2) run below command till nginx service appears
docker compose ps
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

# in (window/terminal 3) to view logs run
docker compose logs -f

# to view `gqlserver` & `strapi` project logs
docker compose logs -f gqlserver strapi

# to view only `gqlserver` logs
docker compose logs -f gqlserver

# to view only `strapi` logs
docker compose logs -f strapi
```
The project will take time to setup all `services`. It will be ready once following output is visible in (window/termilan 1):

## Access details

|service | endpoint | credentials |
|:--|:-:|:-|
| `gqlserver` | http://localhost:25080/graphql | - |
| `Strapi CMS` | http://localhost:25080/strapi/ |  _Strapi login credentials: <br />Username: **demo@app.com** <br />Password: **Demo@123**_ |
| `mariadb` | http://localhost:25080/adminer/ | _Adminer login credentials: <br /> System: **MySQL** <br /> Server: **db** <br /> Username: **admin** <br /> Password: **dbpass** <br /> Database: **gqlserver**_ |

You may test your code by using the Apollo GraphQL client at https://studio.apollographql.com/sandbox/explorer with endpoint as http://localhost:25080/graphql

## Application Components and Design

<pre>
                                                ┌────────────────────────────────────────────────────────────────────────┐
                                                │                          docker compose network                        │
                                                ├────────────────────────────────────────────────────────────────────────┤
                                                │                                                                        │
                                                │ ┌────────┐                                                             │
                                                │ │        │                            ┌─────────────────┐              │
┌───┐  http://localhost:25080/gqlserver/upload  │ │        │ gqlserver:3000/api/upload  │                 │              │
│   │ ───────────────────────────────────────►  │ │        │ ─────────────────────────► │                 │              │
│   │                                           │ │        │                            │ gqlserver:30000 │              │
│   │  http://localhost:25080/graphql           │ │        │ gqlserver:3000/grapql      │                 │              │
│   │ ───────────────────────────────────────►  │ │        │ ─────────────────────────► │                 │              │
│   │                                           │ │        │                            └─┬───────container              │
│   │                                           │ │        │                              │                              │
│   │                                           │ │        │                              ├──► ┌────────────┐            │
│ B │                                     exposes │        │                              │    │ redis:6379 │            │
│ r │                                        port │        │                              │    └────container            │
│ o │                                       25080 │nginx:80│                              │                              │
│ w │                                           │ │        │                              │    strapi:1337/query         │
│ s │                                           │ │        │                              └──► ┌─────────────┐           │
│ e │  http://localhost:25080/strapi            │ │        │ strapi:1337/strapi                │             │           │
│ r │ ───────────────────────────────────────►  │ │        │ ────────────────────────────────► │             │           │
│   │                                           │ │        │                                   │ strapi:1337 │           │
│   │  http://localhost:25080/capi/query        │ │        │ strapi:1337/query                 │             │           │
│   │ ───────────────────────────────────────►  │ │        │ ────────────────────────────────► │             │           │
│   │                                           │ │        │                                   └─────container           │
│   │                                           │ │        │                                             │               │
│   │                                           │ │        │                                             └─► ┌─────────┐ │
│   │                                           │ │        │                            ┌──────────────┐     │ db:3306 │ │
│   │  http://localhost:25080/adminer           │ │        │ adminer:8080               │ adminer:8080 │ ──► └─container │
└───┘ ───────────────────────────────────────►  │ └─container ────────────────────────► └──────container                 │
                                                │                                                                        │
                                                └────────────────────────────────────────────────────────────────────────┘
Note: The endpoints http://localhost:25080/api/* & http://localhost:25080/graphql
      are the only public endpoints
      The remaining routes are only for development purpose and are not available in production
</pre>
