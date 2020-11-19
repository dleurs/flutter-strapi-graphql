const { sanitizeEntity } = require('strapi-utils');

module.exports = {
  query: `
    isEmailExist(email: String): Boolean
  `,
  resolver: {
    Query: {
      isEmailExist: {
        plugin: 'users-permissions',
        resolverOf: 'User.isEmailExist',
        async resolver(ctx, { email }) {
            console.log(email);
            const entity = await strapi.plugins['users-permissions'].services.user.fetch({ email: email });
            if (entity == null) {
              return false;
            }
            return true;
            //return sanitizeEntity(entity, { model: strapi.plugins['users-permissions'].models.user });
            // userByUsername(username: String): UsersPermissionsUser 
          },
      },
    },
  },
};