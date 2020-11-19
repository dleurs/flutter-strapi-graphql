const { sanitizeEntity } = require('strapi-utils');

module.exports = {
  /**
   * Retrieve a record.
   *
   * @return {Object}
   */

  async isEmailExist(ctx) {
    // async findOneByUsername(ctx, { username }) { username == undefined 
    console.log(ctx.params.email);
    const { email } = ctx.params;
    //console.log(username);

    const entity = await strapi.plugins['users-permissions'].services.user.fetch({ email: email });
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
