import 'package:flutter/material.dart';
import 'package:light_/Constant/colors.dart';
import 'package:light_/Controller/controller.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final ThemeProvider controller = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: const Alignment(-0.7, 0),
            colors: controller.themeModel().gradientColors!,
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateTime.now().hour.toString(),
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    SizedBox(
                      width: width / 4,
                      child: const Divider(
                        thickness: 2,
                        color: AppColors.grey,
                      ),
                    ),
                    Text(
                      DateTime.now().minute.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(color: AppColors.white),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        controller.toggleThemeData();
                      },
                      child: Container(
                        width: width * .2,
                        height: height * .1,
                        decoration: BoxDecoration(
                          color: controller.themeModel().switchColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: controller.isLigthTheme == true
                            ? const Icon(
                                Icons.nights_stay_outlined,
                                size: 50,
                                color: AppColors.white,
                              )
                            : const Icon(
                                Icons.wb_sunny_outlined,
                                size: 50,
                              ),
                      ),
                    ),
                    SizedBox(
                      width: width / 4,
                      child: const Divider(
                        thickness: 2,
                        color: AppColors.grey,
                      ),
                    ),
                    const Text("30\u00B0C")
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
