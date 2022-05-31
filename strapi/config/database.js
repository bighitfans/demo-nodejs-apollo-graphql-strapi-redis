module.exports = ({ env }) => ({
  defaultConnection: 'default',
  connections: {
    default: {
      connector: 'bookshelf',
      settings: {
        client: 'mysql',
        host: env('STRAPI_DATABASE_HOST', '127.0.0.1'),
        port: env.int('STRAPI_DATABASE_PORT', 3306),
        database: env('STRAPI_DATABASE_NAME', 'bighit'),
        username: env('STRAPI_DATABASE_USER', 'admin'),
        password: env('STRAPI_DATABASE_PASSWORD', 'dbpass'),
        ssl: env.bool('DATABASE_SSL', false),
        charset : "utf8"
      },
      options: {
        autoMigration: true,
        charset : "utf8"
        //authenticationDatabase: env('AUTHENTICATION_DATABASE'),
        //ssl: env('DATABASE_SSL')
      }
    },
  },
});
