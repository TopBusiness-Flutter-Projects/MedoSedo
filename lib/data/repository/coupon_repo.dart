import 'package:flutter/material.dart';
import 'package:medosedo_ecommerce/data/datasource/remote/dio/dio_client.dart';
import 'package:medosedo_ecommerce/data/datasource/remote/exception/api_error_handler.dart';
import 'package:medosedo_ecommerce/data/model/response/base/api_response.dart';
import 'package:medosedo_ecommerce/utill/app_constants.dart';
import 'dart:async';
import 'dart:convert';
class CouponRepo {
  final DioClient dioClient;
  CouponRepo({required this.dioClient});

  Future<ApiResponse> getCoupon(String coupon) async {
    try {
      final response = await dioClient.get('${AppConstants.COUPON_URI}$coupon');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}