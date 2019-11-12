const jwt = require("jsonwebtoken");
const pool = require("./pool");
module.exports = async (req, res, next) => {
  const bearerHeader = req.headers["authorization"];

  if (typeof bearerHeader !== "undefined") {
    const bearer = bearerHeader.split(" ");

    const bearerToken = bearer[1];

    req.token = bearerToken;

    jwt.verify(req.token, "jobayer", (err, results) => {
      if (err) {
        res.sendStatus(403);
      }
      return next();
    });
  } else {
    res.sendStatus(403);
  }
};
