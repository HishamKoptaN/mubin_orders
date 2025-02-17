// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations

class _OrdersApi implements OrdersApi {
  _OrdersApi(this._dio, {this.baseUrl, this.errorLogger}) {
    baseUrl ??= 'https://m-api.aquan.website/api/';
  }

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<OrdersResModel?> getOrders() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<OrdersResModel>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'orders',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>?>(_options);
    late OrdersResModel? _value;
    try {
      _value =
          _result.data == null ? null : OrdersResModel.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Order> createOrder({
    required String clientId,
    required String placeName,
    required File video,
    required File imageOne,
    required File imageTwo,
    required double latitude,
    required double longitude,
    void Function(int, int)? onSendProgress,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry('client_id', clientId));
    _data.fields.add(MapEntry('place', placeName));
    _data.files.add(
      MapEntry(
        'video',
        MultipartFile.fromFileSync(
          video.path,
          filename: video.path.split(Platform.pathSeparator).last,
        ),
      ),
    );
    _data.files.add(
      MapEntry(
        'image_one',
        MultipartFile.fromFileSync(
          imageOne.path,
          filename: imageOne.path.split(Platform.pathSeparator).last,
        ),
      ),
    );
    _data.files.add(
      MapEntry(
        'image_two',
        MultipartFile.fromFileSync(
          imageTwo.path,
          filename: imageTwo.path.split(Platform.pathSeparator).last,
        ),
      ),
    );
    _data.fields.add(MapEntry('latitude', latitude.toString()));
    _data.fields.add(MapEntry('longitude', longitude.toString()));
    final _options = _setStreamType<Order>(
      Options(
        method: 'POST',
        headers: _headers,
        extra: _extra,
        contentType: 'multipart/form-data',
      )
          .compose(
            _dio.options,
            'orders',
            queryParameters: queryParameters,
            data: _data,
            onSendProgress: onSendProgress,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late Order _value;
    try {
      _value = Order.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
