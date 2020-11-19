const { sanitizeEntity } = require('strapi-utils');

module.exports = {
  /**
   * Retrieve a record.
   *
   * @return {Object}
   

  async findOneByUsername(ctx, { username }) {
    //var username = ctx.params.username;


    console.log(username);
    console.log(ctx.params.username);
    //const { username } = ctx.params;
    //console.log(username);
    console.log(strapi.plugins['users-permissions'].services.user);

    const entity = await strapi.plugins['users-permissions'].services.user.find({ username: "dimi_du_24@hotmail.fr" });
    console.log(entity);
    //const entity = await strapi.services.user.find({ "username": ctx.params.username });
    //return sanitizeEntity(entity, { model: strapi.models.user });
    return sanitizeEntity(entity.email, { model: strapi.plugins['users-permissions'].models.user });
  }, */
};
