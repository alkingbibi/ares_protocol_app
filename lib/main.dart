import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'decoy_screen.dart';
import 'ares_protocol_screen.dart';

class AppState extends ChangeNotifier {
  bool _isUnlocked = false;
    bool get isUnlocked => _isUnlocked;
      
        void unlock() {
            _isUnlocked = true;
                notifyListeners();
                  }
                  }

                  void main() {
                    runApp(
                        ChangeNotifierProvider(
                              create: (context) => AppState(),
                                    child: const AresProtocolApp(),
                                        ),
                                          );
                                          }

                                          class AresProtocolApp extends StatelessWidget {
                                            const AresProtocolApp({super.key});

                                              @override
                                                Widget build(BuildContext context) {
                                                    return MaterialApp(
                                                          title: 'System Monitor',
                                                                theme: ThemeData.dark().copyWith(
                                                                        scaffoldBackgroundColor: const Color(0xFF121212),
                                                                              ),
                                                                                    debugShowCheckedModeBanner: false,
                                                                                          home: Consumer<AppState>(
                                                                                                  builder: (context, appState, child) {
                                                                                                            return appState.isUnlocked ? const AresProtocolScreen() : const DecoyScreen();
                                                                                                                    },
                                                                                                                          ),
                                                                                                                              );
                                                                                                                                }
                                                                                                                                }