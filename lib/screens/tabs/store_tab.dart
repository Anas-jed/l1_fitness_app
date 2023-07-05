import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:l1_fitness_app/exports_all.dart';

class StoreTab extends StatelessWidget {
  const StoreTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: SvgPicture.asset('assets/icons/notifications.svg',
                      height: 25,
                      width: 25,
                      colorFilter:
                          const ColorFilter.mode(Colors.grey, BlendMode.srcIn)),
                ),
                const SizedBox(
                  width: 30,
                ),
                SvgPicture.asset('assets/icons/user.svg',
                    height: 25,
                    width: 25,
                    colorFilter:
                        const ColorFilter.mode(Colors.grey, BlendMode.srcIn))
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Store',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 25,
            ),
            Expanded(
              child: ListView.separated(
                itemCount: splashList.length,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 30,
                ),
                itemBuilder: (context, index) {
                  final item = splashList[index];
                  return Stack(children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        '${item.imageSrc}${index + 1}.jpg',
                        fit: BoxFit.cover,
                        height: 200,
                        width: double.infinity,
                      ),
                    ),
                    Positioned(
                      bottom: 30,
                      left: 20,
                      child: Text(
                        item.heading,
                        style: const TextStyle(
                            color: white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ]);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
