import 'package:Islami/core/provider/prayer_time_provider.dart';
import 'package:Islami/core/utils/colors.dart';
import 'package:Islami/presentation_layer/home_page/screens/setting_page.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PrayerNowItem extends StatefulWidget {
  const PrayerNowItem({Key? key}) : super(key: key);

  @override
  State<PrayerNowItem> createState() => _PrayerNowItemState();
}

class _PrayerNowItemState extends State<PrayerNowItem> {
  bool mute = false;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PrayerTimeProvider>(context);

    if (provider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (provider.prayerData == null) {
      return const Center(child: Text('No Data Available'));
    }

    final timings = provider.prayerData!['timings'];
    final date = provider.prayerData!['date'];

    // Convert timings to a list of key-value pairs for easy use in the Swiper
    final List<MapEntry<String, dynamic>> prayerTimes = timings.entries
        .where((entry) =>
        ['Fajr', 'Dhuhr', 'Asr', 'Maghrib', 'Isha'].contains(entry.key))
        .toList();

    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.36,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF856B3F),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Text(
              '${date['gregorian']['date']}',
              style: const TextStyle(color: AppColors.white, fontSize: 16),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Text(
              '${date['hijri']['date']}',
              style: const TextStyle(color: AppColors.white, fontSize: 16),
            ),
          ),
          Column(
            children: [
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.asset("assets/home/left.png"),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primary),
                        color: AppColors.primary,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                        ),
                      ),
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 0.33,
                      child: Column(
                        children: const [
                          Text(
                            "Pray Time",
                            style: TextStyle(
                                color: Color(0xff856b3f), fontSize: 20),
                          ),
                          Text(
                            "Tuesday",
                            style: TextStyle(
                                color: AppColors.secondary, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Image.asset("assets/home/right.png"),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.17,
                      child: Swiper(
                        viewportFraction: 0.3,
                        itemHeight: MediaQuery.of(context).size.height * 0.16,
                        scale: 0.5,
                        autoplay: false,
                        itemCount: prayerTimes.length,
                        itemBuilder: (BuildContext context, int index) {
                          final entry = prayerTimes[index];
                          return Container(
                            padding: const EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width * 0.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.secondary,
                                  AppColors.primary,
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${entry.key}\n${entry.value}",
                                  style: const TextStyle(
                                    color: AppColors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.settings,
                              color: AppColors.secondary,
                              size: 20,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SettingPage()),
                              );
                            },
                          ),
                          const Spacer(flex: 2),
                          const Text(
                            "Next Pray - 02:32",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const Spacer(flex: 1),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                mute = !mute;
                              });
                            },
                            icon: Icon(
                              mute ? Icons.volume_off : Icons.volume_up,
                              color: AppColors.secondary,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
