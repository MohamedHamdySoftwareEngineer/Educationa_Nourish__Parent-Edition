import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../features/Parent Profile/data/models/Profile.dart';

class ApiService {
  final _baseUrl = 'http://54.242.19.19:3000/api/';

  final Dio _dio;

  ApiService({Dio? dio}) : _dio = dio ?? Dio();

  
  Future<Profile> fetchParentProfile({required String endPoint}) async {
    var response = await _dio.get('$_baseUrl$endPoint');
    final list = response.data as List<dynamic>;

    if (list.isEmpty) {
      throw Exception('No users found');
    }

    return Profile.fromJson(list.first as Map<String, dynamic>);
  }
}
