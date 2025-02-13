const String apiDomain = "https://mubin.aquan.website/api";

const Map<String, dynamic> api = {
  //-----------//
  "check": "https://mubin.aquan.website/api/check",
  "login": "https://mubin.aquan.website/api/login",

  //-------------------------------//

  "orders": "$apiDomain/orders",
  "accounts": "$apiDomain/accounts",
  "get_roles": "$apiDomain/roles",
  "create_user": "$apiDomain/create-user",
  "register": "$apiDomain/api/auth/register",
  "change-password": "$apiDomain/api/user/change-password",

  //-----------------------//
  "account": "$apiDomain/api/account/",
  "deposits-and-withdraws": "$apiDomain/api/invoices/withdraws-deposits",
  "password": {
    "reset": "$apiDomain/api/auth/reset-password",
  },
  //-----------------------//
};
