import 'package:devquiz/core/app_gradients.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/home/widgets/score_card/score_card_widget.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends PreferredSize {
  AppBarWidget()
      : super(
          preferredSize: Size.fromHeight(250),
          child: Stack(
            children: [
              Container(
                height: 161,
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(gradient: AppGradients.linear),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: 'Olá, ',
                        style: AppTextStyles.title,
                        children: [
                          TextSpan(
                            text: 'Raiane!',
                            style: AppTextStyles.titleBold,
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://robohash.org/set_set3/bgset_bg1/3.14159?size=100x100'),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Align(alignment: Alignment(0, 1), child: ScoreCardWidget())
            ],
          ),
        );
}
