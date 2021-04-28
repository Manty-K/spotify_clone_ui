import 'package:flutter/material.dart';
import 'package:spotify_clone_ui/utils/app_styles.dart';

class ShowsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Spacer(),
          Text(
            'You haven\'t followed any shows yet.',
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: AppStyles.defaultPadding,
          ),
          AppStyles.greyText(
              'When you follow a show, you\'ll get new wpisode automatically'),
          SizedBox(
            height: AppStyles.defaultPadding * 2,
          ),
          Container(
            alignment: Alignment.center,
            width: 200,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: AppStyles.defaultPadding),
              child: Text(
                'BROWSE',
                style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
