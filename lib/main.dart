import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spirituum/data/services/database_service.dart';
import 'package:spirituum/presentation/app.dart';

void main() async {
  // Ensure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();
  
  // Create container for initialization that needs to happen before runApp
  final container = ProviderContainer();
  
  // Initialize the database
  final dbService = container.read(databaseServiceProvider);
  await dbService.seedDatabaseIfEmpty();
  
  // Run the app wrapped in a ProviderScope for Riverpod
  runApp(
    ProviderScope(
      parent: container,
      child: const SpiritumApp(),
    ),
  );
}