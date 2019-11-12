const pool = require("../pool");

const firstPage = (req, res) => {
  let alldata = {};
  pool
    .query("SELECT * FROM public.new_products")
    .then(results => {
      alldata.newProduct = results.rows;
      return pool.query("SELECT * FROM public.popular");
    })
    .then(popular_product => {
      alldata.popular = popular_product.rows;

      return pool.query("SELECT * FROM public.categories");
    })
    .then(categories => {
      alldata.allcategories = categories.rows;

      return res.status(200).json(alldata);
    })
    .catch(err => {
      console.error(err);
    });
};

module.exports = {
  firstPage
};
