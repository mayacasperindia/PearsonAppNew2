import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:pearson_flutter/utils/urlConstants.dart';

class AuthenticationRepository {
  Future<String> verifyVoucher(String voucherCode) async {
    var accessToken = UrlConstants.debugAccessToken;
    var compCode = UrlConstants.compCode;
    try {
      var response = await http.post(
          "https://uat.wheebox.com/wheeboxAPI_v2/prep/VerifyVoucherCode/$compCode?voucherCode=$voucherCode",
          headers: {"accessToken": accessToken});
      print(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return "verified";
      } else {
        return null;
      }
    } on SocketException {
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<String> signUpUser(
      {String firstName,
      String lastName,
      String schoolName,
      String schoolCity,
      String board,
      String schoolState,
      String userClass}) async {

  }
}
