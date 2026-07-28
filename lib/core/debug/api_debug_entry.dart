class ApiDebugEntry {
  final String id;
  final String method;
  final String url;
  final Map<String, dynamic> headers;
  final dynamic requestBody;
  final DateTime startTime;
  final DateTime? endTime;
  final int? statusCode;
  final String? responsePreview;
  final String? responseBody;
  final bool isError;
  final String? errorMessage;

  const ApiDebugEntry({
    required this.id,
    required this.method,
    required this.url,
    required this.headers,
    this.requestBody,
    required this.startTime,
    this.endTime,
    this.statusCode,
    this.responsePreview,
    this.responseBody,
    this.isError = false,
    this.errorMessage,
  });

  ApiDebugEntry copyWith({
    String? id,
    String? method,
    String? url,
    Map<String, dynamic>? headers,
    Object? requestBody = _omit,
    DateTime? startTime,
    DateTime? endTime,
    Object? statusCode = _omit,
    Object? responsePreview = _omit,
    Object? responseBody = _omit,
    bool? isError,
    Object? errorMessage = _omit,
  }) {
    return ApiDebugEntry(
      id: id ?? this.id,
      method: method ?? this.method,
      url: url ?? this.url,
      headers: headers ?? this.headers,
      requestBody: requestBody == _omit ? this.requestBody : requestBody,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      statusCode: statusCode == _omit ? this.statusCode : statusCode as int?,
      responsePreview: responsePreview == _omit ? this.responsePreview : responsePreview as String?,
      responseBody: responseBody == _omit ? this.responseBody : responseBody as String?,
      isError: isError ?? this.isError,
      errorMessage: errorMessage == _omit ? this.errorMessage : errorMessage as String?,
    );
  }

  bool get isCompleted => endTime != null;

  int get elapsedMs {
    final end = endTime ?? DateTime.now();
    return end.difference(startTime).inMilliseconds;
  }

  String get elapsedLabel {
    final ms = elapsedMs;
    if (ms < 1000) return '${ms}ms';
    return '${(ms / 1000).toStringAsFixed(1)}s';
  }

  String get shortPath {
    final uri = Uri.tryParse(url);
    if (uri == null) return url;
    final segments = uri.pathSegments.where((s) => s.isNotEmpty).toList();
    if (segments.isEmpty) return '/';
    if (segments.length <= 2) return '/${segments.join('/')}';
    final last2 = segments.sublist(segments.length - 2);
    return '/…/${last2.join('/')}';
  }
}

class _OmitSentinel {
  const _OmitSentinel();
}

const _omit = _OmitSentinel();
