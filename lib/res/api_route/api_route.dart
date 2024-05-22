class ApiRoutes {
  ApiRoutes._();

  static const baseUrl = 'https://raven.thenoobnetwork.com/api/';

  ///authentication

  static const register = 'register';
  static const resetpassword = 'password/forgot';
  static const login = 'login';
  static const sendotp = 'send-otp';
  static const verifyotp = 'verify-otp';
  static const addnewproperty = 'property/submit';
  static const getallproperty = 'property/list';
  static const getsingleproperty = 'property/preview/';
  static const getuserproperty = 'property/my-list';
  static const getwalletbalance = 'wallet/balance';
  static const getuserprofile = 'me';
  static const test = 'devhangout';
}
