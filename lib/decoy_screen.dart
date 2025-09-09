import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:battery_plus/battery_plus.dart';
import 'main.dart';

class DecoyScreen extends StatefulWidget {
  const DecoyScreen({super.key});

    @override
      State<DecoyScreen> createState() => _DecoyScreenState();
      }

      class _DecoyScreenState extends State<DecoyScreen> {
        int _batteryLevel = 100;
          final Battery _battery = Battery();
            int _tapCount = 0;
              DateTime _lastTapTime = DateTime.now();

                @override
                  void initState() {
                      super.initState();
                          _battery.onBatteryStateChanged.listen((BatteryState state) {
                                _getBatteryLevel();
                                    });
                                        _getBatteryLevel();
                                          }

                                            void _getBatteryLevel() async {
                                                final level = await _battery.batteryLevel;
                                                    setState(() {
                                                          _batteryLevel = level;
                                                              });
                                                                }

                                                                  void _handleTap() {
                                                                      final now = DateTime.now();
                                                                          if (now.difference(_lastTapTime).inSeconds > 1) {
                                                                                _tapCount = 0;
                                                                                    }
                                                                                        _tapCount++;
                                                                                            _lastTapTime = now;

                                                                                                if (_tapCount >= 3) {
                                                                                                      Provider.of<AppState>(context, listen: false).unlock();
                                                                                                          }
                                                                                                            }

                                                                                                              @override
                                                                                                                Widget build(BuildContext context) {
                                                                                                                    return Scaffold(
                                                                                                                          backgroundColor: Colors.black,
                                                                                                                                appBar: AppBar(
                                                                                                                                        backgroundColor: Colors.black,
                                                                                                                                                title: const Text('System Monitor', style: TextStyle(color: Colors.green, fontFamily: 'monospace')),
                                                                                                                                                      ),
                                                                                                                                                            body: Center(
                                                                                                                                                                    child: GestureDetector(
                                                                                                                                                                              onTap: _handleTap,
                                                                                                                                                                                        child: Column(
                                                                                                                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                                                                                                                children: [
                                                                                                                                                                                                                              const Icon(Icons.battery_charging_full, size: 100, color: Colors.green),
                                                                                                                                                                                                                                            const SizedBox(height: 20),
                                                                                                                                                                                                                                                          Text(
                                                                                                                                                                                                                                                                          'Battery: $_batteryLevel%',
                                                                                                                                                                                                                                                                                          style: const TextStyle(color: Colors.green, fontSize: 24, fontFamily: 'monospace'),
                                                                                                                                                                                                                                                                                                        ),
                                                                                                                                                                                                                                                                                                                      const SizedBox(height: 10),
                                                                                                                                                                                                                                                                                                                                    const Text(
                                                                                                                                                                                                                                                                                                                                                    'Status: Optimal',
                                                                                                                                                                                                                                                                                                                                                                    style: TextStyle(color: Colors.green, fontSize: 18, fontFamily: 'monospace'),
                                                                                                                                                                                                                                                                                                                                                                                  ),
                                                                                                                                                                                                                                                                                                                                                                                              ],
                                                                                                                                                                                                                                                                                                                                                                                                        ),
                                                                                                                                                                                                                                                                                                                                                                                                                ),
                                                                                                                                                                                                                                                                                                                                                                                                                      ),
                                                                                                                                                                                                                                                                                                                                                                                                                          );
                                                                                                                                                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                                                                                                                                                            }