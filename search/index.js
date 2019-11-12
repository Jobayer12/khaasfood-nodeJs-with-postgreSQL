const pool = require("../pool");

const search = (req, res) => {
  const { name } = req.body;

  pool
    .query(
      `select uid, name, price, image, weight from public.product  where name like '%${name}%' union all select uid, name, price, image, weight from public.popular where name like '%${name}%' union all select uid, name, price, image, weight from public.product  where name like '%${name}%'`
    )
    .then(results => {
      return res.json(results.rows);
    })
    .catch(err => {
      console.error(err);
    });
};

module.exports = {
  search
};
