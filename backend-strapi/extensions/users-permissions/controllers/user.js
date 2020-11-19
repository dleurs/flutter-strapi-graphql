const { sanitizeEntity } = require('strapi-utils');

module.exports = {
  /**
   * Retrieve a record.
   *
   * @return {Object}
   */

  async findOneByUsername(ctx) {
    console.log(ctx.params.username);
    //const { username } = ctx.params;
    //console.log(username);

    const entity = await strapi.services.todo.find({ "name": ctx.params.username });
    return sanitizeEntity(entity, { model: strapi.models.todo });
  },
};