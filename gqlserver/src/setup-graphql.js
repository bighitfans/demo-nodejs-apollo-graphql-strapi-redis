const path = require("path");
const { ApolloServer } = require("apollo-server-express");
const { BaseRedisCache } = require('apollo-server-cache-redis')
const { ApolloServerPluginCacheControl } = require('apollo-server-core')
const { client } = require('cache')
const { loadFilesSync } = require("@graphql-tools/load-files");
const { mergeTypeDefs } = require("@graphql-tools/merge");
const { mergeResolvers } = require("@graphql-tools/merge");
const { makeExecutableSchema } = require("@graphql-tools/schema");

const dataSources = require('graphql-datasources')
const cache = new BaseRedisCache({
  client,
})

const typesArray = loadFilesSync(path.join(__dirname, "./graphql"), {
  extensions: ["graphql"],
});
const typeDefs = mergeTypeDefs(typesArray);

const resolversArray = loadFilesSync(path.join(__dirname, "./graphql"), {
  extensions: ["js"],
});
const resolvers = mergeResolvers(resolversArray);

const schema = makeExecutableSchema({
  typeDefs,
  resolvers,
});

// startApolloServer
module.exports = {

  start: async (app, path = "/graphql") => {
    const server = new ApolloServer({
      typeDefs,
      schema,
      cache,
      dataSources,
      plugins: [ApolloServerPluginCacheControl()],
    });

    await server.start();

    server.applyMiddleware({ app, path });

    return server;
  }
};

