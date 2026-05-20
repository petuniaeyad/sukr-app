import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sukar/utils/routes/routes_string.dart';

void main() {
  runApp(
    MaterialApp(home: EmergencyHomePage(), debugShowCheckedModeBanner: false),
  );
}

class EmergencyHomePage extends StatelessWidget {
  const EmergencyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        title: Text("emergency_cases".tr),
        backgroundColor: const Color(0xFF5a5ea3),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  _buildCard(
                    context,
                    title: "low_blood_sugar".tr,
                    icon: Icons.water_drop,
                    shadowColor: Colors.redAccent,
                    onTap: () => Get.toNamed(RoutesString.lowbloodsugarpage),
                  ),
                  _buildCard(
                    context,
                    title: "high_blood_sugar".tr,
                    icon: Icons.local_fire_department,
                    shadowColor: Colors.orangeAccent,
                    onTap: () => Get.toNamed(RoutesString.highbloodsugarpage),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  _buildCard(
                    context,
                    title: "loss_of_consciousness".tr,
                    icon: Icons.bed,
                    shadowColor: Colors.purple,
                    onTap:
                        () => Get.toNamed(RoutesString.lossofconsciousnesspage),
                  ),
                  _buildCard(
                    context,
                    title: "request_for_help".tr,
                    icon: Icons.support_agent,
                    shadowColor: Colors.teal,
                    onTap: () => Get.toNamed(RoutesString.requestforhelppage),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color shadowColor,
    required Function() onTap,
  }) {
    return Expanded(
      child: _PressableCard(
        title: title,
        icon: icon,
        color: shadowColor,
        onTap: onTap,
      ),
    );
  }
}

class _PressableCard extends StatefulWidget {
  final String title;
  final IconData icon;
  final Color color;
  final Function() onTap;

  const _PressableCard({
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  State<_PressableCard> createState() => _PressableCardState();
}

class _PressableCardState extends State<_PressableCard> {
  bool _pressed = false;

  void _handleTapDown(_) {
    setState(() => _pressed = true);
  }

  void _handleTapUp(_) {
    setState(() => _pressed = false);
  }

  void _handleTapCancel() {
    setState(() => _pressed = false);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: _pressed ? widget.color.withOpacity(0.1) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: widget.color, width: 2),
          boxShadow: [
            BoxShadow(
              color: widget.color.withOpacity(0.3),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(widget.icon, size: 48, color: widget.color),
            const SizedBox(height: 16),
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                height: 1.4,
                color: widget.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
