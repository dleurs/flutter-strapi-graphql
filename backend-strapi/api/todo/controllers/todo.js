const { sanitizeEntity } = require('strapi-utils');

module.exports = {
  /**
   * Retrieve a record.
   *
   * @return {Object}
   */

  async findOneByUsername(_, { username }) {
    //console.log(ctx.params.username);
    //var username = ctx.params.username;


    console.log(username);
    //const { username } = ctx.params;
    //console.log(username);

    const entity = await strapi.plugins['users-permissions'].services.user.fetch({ username });
    console.log(entity);
    //const entity = await strapi.services.user.find({ "username": ctx.params.username });
    //return sanitizeEntity(entity, { model: strapi.models.user });
    return sanitizeEntity(entity, { model: strapi.plugins['users-permissions'].models.user });
  },
};
