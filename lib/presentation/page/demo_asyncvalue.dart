import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'demo_asyncvalue.g.dart';

@riverpod
Future<DateTime> getDateTimeFromWeb(Ref ref) async {
  final response = await http.get(
    Uri.parse('https://worldtimeapi.org/api/timezone/Etc/UTC'),
  );
  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);
    return DateTime.parse(json['datetime']);
  } else {
    throw Exception('Failed to load date and time from the web');
  }
}
