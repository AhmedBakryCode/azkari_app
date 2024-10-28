import 'package:Islami/core/utils/colors.dart';
import 'package:Islami/presentation_layer/home_page/screens/reciter_surrah_page.dart';
import 'package:flutter/material.dart';
import 'package:Islami/data/models/reciter.dart';

class ReciterItem extends StatelessWidget {
  final Reciter reciter;

  const ReciterItem({Key? key, required this.reciter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ReciterSurahListPage(reciter: reciter),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.teal,
              child: Text(reciter.name[0]), // First letter as avatar
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                reciter.name,
                style: const TextStyle(
                  color: AppColors.secondary,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
      ),
    );
  }
}
