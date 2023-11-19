import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rndvouz/features/common/data/colors.dart';
import 'package:rndvouz/features/merchandise/domain/merchandise.dart';

import 'dart:developer' as developer;

class UploadMenu extends ConsumerWidget {
  const UploadMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final theState = ref.watch(sellingMethodStateProvider);

    return Column(
      children: [
        SizedBox(height: screenHeight * 0.02),
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Container(
            height: screenHeight * 0.05,
            width: screenWidth * 0.85,
            color: primaryGreen,
            child: Padding(
              padding: EdgeInsets.all(screenHeight * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      ref.read(sellingMethodStateProvider.notifier).state =
                          SellingMethod.selling;
                    },
                    child: Column(
                      children: [
                        Text("Sell"),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Text("|"),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      ref.read(sellingMethodStateProvider.notifier).state =
                          SellingMethod.negotiate;
                    },
                    child: Column(
                      children: [
                        Text("Negotiate"),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Text("|"),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      ref.read(sellingMethodStateProvider.notifier).state =
                          SellingMethod.trading;
                    },
                    child: Column(
                      children: [
                        Text("Trade"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

SellingMethod? curState;

final sellingMethodStateProvider =
    StateProvider<SellingMethod?>((ref) => curState);
