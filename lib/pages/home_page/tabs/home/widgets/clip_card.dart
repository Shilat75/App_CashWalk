import 'package:cash_wallet/pages/base/base_translation.dart';
import 'package:cash_wallet/utils/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ClipCard extends StatelessWidget with BaseTranslation {
  @override
  String get route => 'main';

  const ClipCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 0,
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        tileColor: const Color(0xFF454545),
        title: const Text(
          tran('daily_rewards'),
          style: TextStyle(
            fontSize: 10,
            color: Color(0xffdb23c1),
          ),
        ),
        subtitle: const Text(
          'Watching ads\nGet 1 coin',
          style: TextStyle(color: Color(0xffffffff), fontSize: 18),
        ),
        trailing: SvgPicture.asset(R.assets.clip),
      ),
    );
  }
}
