const Pool = require("pg").Pool;

const pool = new Pool({
    user: "temurbek",
    password: "19",
    host: "localhost",
    port: 5432,
    database: "food"
});

module.exports = pool;