const express = require("express");
const app = express();
var cors = require("cors");
const bodyParser = require("body-parser");
const port = 4000;
const db = require("./queries");
const first = require("./homePage/index");
const product = require("./product");
const verifyToken = require("./verifyToken");
const searchQuery = require("./search");

app.use(
  bodyParser.urlencoded({
    extended: true
  })
);

app.use(bodyParser.json());

app.use(cors());

app.use(express.static(__dirname + "/data/img"));

app.get("/", first.firstPage);
app.get("/users", verifyToken, db.getUsers);
app.get("/all", db.getAll);
app.post("/user/bill", verifyToken, db.billinginformation);
app.post("/user/shopping", verifyToken, db.shoppinginformation);
app.post("/signup", db.signup);
app.post("/signin", db.signin);
app.get("/products", product.products);
app.get("/products/:category", product.category);
app.get("/products/:category/:sub_category", product.sub_category);
app.get("/search", searchQuery.search);

console.log("app running");

app.listen(port, () => console.log(`Example app listening on port ${port}!`));

// select uid,name from public.product  where name like '%organic eg%' union all select uid, name from public.popular where name like '%organic eg%' union all select uid, name from public.product  where name like '%organic eg%'
