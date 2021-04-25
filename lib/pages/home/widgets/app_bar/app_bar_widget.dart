import 'package:devquiz/core/app_gradients.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/pages/home/widgets/score_card/score_card_widget.dart';
import 'package:devquiz/shared/models/user_model.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends PreferredSize {
  final UserModel user;
  AppBarWidget(this.user)
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
                            text: user.name,
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
                          image: NetworkImage(user.photoUrl),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment(0, 1),
                child: ScoreCardWidget(user.score / 100),
              )
            ],
          ),
        );
}
