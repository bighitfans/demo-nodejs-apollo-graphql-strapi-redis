module.exports = ({ env }) => ({
  host: env('HOST', '0.0.0.0'),
  port: env.int('PORT', 1337),
  url: "http://localhost:25080/capi",
  admin: {
    auth: {
      secret: env('ADMIN_JWT_SECRET', '3ce43684c5482441659c76578f07590e'),
    },
    url: "http://localhost:25080/strapi"
  },
});
