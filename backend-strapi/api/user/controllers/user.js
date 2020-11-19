const { sanitizeEntity } = require('strapi-utils');

module.exports = {
  /**
   * Retrieve a record.
   *
   * @return {Object}
   */

  async findOneByUsername(ctx) {
    // async findOneByUsername(ctx, { username }) { username == undefined 
    console.log(ctx.params.username);
    const { username } = ctx.params;
    //console.log(username);

    const entity = await strapi.plugins['users-permissions'].services.user.fetch({ username: username });
    if (entity == null) {
      ctx.response.status = 404;
      return ctx.response;
    }
    //console.log(entity);
    ctx.response.status = 302;
    return ctx.response;
    //return sanitizeEntity(entity.email, { model: strapi.plugins['users-permissions'].models.user });
  },
}; 
