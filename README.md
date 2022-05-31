# nodejs + Apollo + GraphQL + Strapi + Redis

## Stack

**api**: `nodejs` + `apollo graph server`

**Content Management System**: `Strapi`

**Container**: `docker compose`

## Pre-requisit
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
