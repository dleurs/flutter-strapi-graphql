const { sanitizeEntity } = require('strapi-utils');

module.exports = {
  query: `
    userByUsername(username: String): UsersPermissionsUser
  `,
  resolver: {
    Query: {
      userByUsername: {
        plugin: 'users-permissions',
        resolverOf: 'User.findOneByUsername',
        async resolver(ctx, { username }) {
            console.log(username);
            const entity = await strapi.plugins['users-permissions'].services.user.fetch({ username: username });
            if (entity == null) {
              return;
            }
            return sanitizeEntity(entity, { model: strapi.plugins['users-permissions'].models.user });
          },
      },
    },
  },
};