const Database = require("../../database/index.js");

module.exports = async function (fastify, options) {
  fastify.get("/list", async (req, res) => {
    res.send(await Database.getAnimeList()).code(200);
  });
};
