const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const pool = require("./pool");

const {
  vaidationDataSignUp,
  vaidationDataLogin
} = require("./validations/validatores");

const getAll = (req, res) => {
  pool
    .query(
      "SELECT * FROM public.userinfo JOIN billinginformation ON public.billinginformation.email = public.userinfo.email join public.shippinginfo on public.shippinginfo.email=public.userinfo.email"
    )
    .then(results => {
      return res.json(results.rows);
    })
    .catch(err => {
      console.error(err);
    });
};

const getUsers = (req, res) => {};

const billinginformation = (req, res) => {
  const { name, address, city, number, code, uuid } = req.body;

  pool
    .query(
      `UPDATE public.billinginformation SET billingname='${name}', billaddress='${address}', billcity='${city}', billnumber='${number}', billcode='${code}' WHERE uuid='${uuid}'`
    )
    .then(() => {
      res.json({
        message: "Profile updated"
      });
    })
    .catch(err => {
      res.status(404).json(err);
    });
};

const shoppinginformation = (req, res) => {
  const { name, address, city, number, code, uuid } = req.body;

  pool
    .query(
      `UPDATE public.shippinginfo SET shippingname='${name}', shipnumber='${number}', shipaddress='${address}', shipzipcode='${code}', shipcity='${city}' WHERE uuid='${uuid}'`
    )
    .then(() => {
      res.json({
        message: "Profile updated"
      });
    })
    .catch(err => {
      res.status(404).json(err);
    });
};

const signup = async (req, res) => {
  const newuser = {
    email: req.body.email,
    password: req.body.password,
    confirmPassword: req.body.confirmPassword
  };

  const { valid, errors } = vaidationDataSignUp(newuser);
  if (!valid) return res.status(400).json({ errors });

  let value,
    verify = false;

  try {
    value = await checkEmail(newuser.email);
    if (value) {
      return res.status(400).json({
        errors: {
          message: "email already exists"
        }
      });
    }

    let passwordHash = await bcrypt.hash(newuser.password, 10);
    let UUID = uuidv4();

    pool
      .query(
        `INSERT INTO public.userinfo(email, password, verify, uid) values ('${newuser.email}', '${passwordHash}', '${verify}', '${UUID}');`
      )
      .then(() => {
        pool.query(
          `INSERT INTO public.billinginformation(uuid) values ('${UUID}');`
        );
      })
      .then(() => {
        pool.query(`INSERT INTO public.shippinginfo(uuid) values ('${UUID}');`);
      })
      .then(() => {
        res.json({
          message: "Account Created"
        });
      })
      .catch(err => {
        res.status(404).json(err);
      });
  } catch (err) {
    console.error(err);
  }
};

function uuidv4() {
  return "xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx".replace(/[xy]/g, function(c) {
    var r = (Math.random() * 16) | 0,
      v = c == "x" ? r : (r & 0x3) | 0x8;
    return v.toString(16);
  });
}

const signin = (req, res) => {
  const userlogin = {
    email: req.body.email,
    password: req.body.password
  };

  const { valid, errors } = vaidationDataLogin(userlogin);
  if (!valid) return res.status(400).json({ errors });

  pool
    .query("SELECT * FROM public.userinfo WHERE email = $1 limit 1", [
      userlogin.email
    ])
    .then(async results => {
      if (results.rowCount === 0) {
        return res.status(400).json({
          errors: {
            noUser: "No user found"
          }
        });
      }
      let checkPassword = await bcrypt.compare(
        userlogin.password,
        results.rows[0].password
      );
      if (!checkPassword) {
        return res.status(400).json({
          errors: {
            noMatch: "Password not match"
          }
        });
      }
      const user = {
        uid: results.rows[0].uid,
        email: results.rows[0].email,
        verify: results.rows[0].verify,
        firstname: results.rows[0].firstname,
        lastname: results.rows[0].lastname
      };

      jwt.sign({ user }, "jobayer", { expiresIn: "11h" }, (err, token) => {
        res.json({
          token
        });
      });
    })
    .catch(err => {
      console.log(err);
    });
};

checkEmail = async email => {
  return pool
    .query("SELECT email FROM public.userinfo WHERE email = $1 limit 1", [
      email
    ])
    .then(check => {
      console.log();
      if (check.rowCount === 1 && check.rows[0].email === email) {
        return true;
      }
    });
};

module.exports = {
  getUsers,
  signup,
  signin,
  getAll,
  billinginformation,
  shoppinginformation
};
