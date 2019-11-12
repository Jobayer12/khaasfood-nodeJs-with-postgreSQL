const isEmail = email => {
  let reqEx = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/;
  if (email.match(reqEx)) return true;
  else return false;
};

const isEmpty = string => {
  if (string.trim() === "") return true;
  else return false;
};

exports.vaidationDataSignUp = newuser => {
  let errors = {};
  if (isEmpty(newuser.email)) {
    errors.email = "email can not be empty";
  } else if (!isEmail(newuser.email)) {
    errors.email = "Must be a valid email address";
  }

  if (isEmpty(newuser.password)) errors.password = "password can not be empty";
  if (isEmpty(newuser.confirmPassword)) errors.confirmPassword = "confirm password can not be empty";
  if (newuser.password !== newuser.confirmPassword)
    errors.confirmPassword = "password not match";
  
  return {
    errors,
    valid: Object.keys(errors).length === 0 ? true : false
  };
};

exports.vaidationDataLogin = user => {
  let errors = {};
  if (isEmpty(user.email)) errors.email = "Email can not be empty";
  if (isEmpty(user.password)) errors.password = "password can not be empty";

  return {
    errors,
    valid: Object.keys(errors).length === 0 ? true : false
  };
};


