const pool = require("./pool");
const products = (req, res) => {
  pool
    .query("SELECT * FROM public.product")
    .then(results => {
      return res.status(200).json(results.rows);
    })
    .catch(err => {
      return res.status(400).json(err);
    });
};

const category = (req, res) => {
  let categoryItem = req.params.category;
  pool
    .query(`SELECT * FROM public.product where category= '${categoryItem}'`)
    .then(results => {
      return res.status(200).json(results.rows);
    })
    .catch(err => {
      return res.status(400).json(err);
    });
};

const sub_category = (req, res) => {
  let categoryItem = req.params.category;
  let sub_category = req.params.sub_category;

  pool
    .query(
      `SELECT * FROM public.product where category= '${categoryItem}' and sub_category= '${sub_category}'`
    )
    .then(results => {
      return res.status(200).json(results.rows);
    })
    .catch(err => {
      return res.status(400).json(err);
    });
};

module.exports = {
  products,
  category,
  sub_category
};
