import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

final isarProvider = Provider<Isar>((ref) {
  debugPrint('test');
  throw UnimplementedError('test');
});
