import 'package:Islami/core/provider/prayer_time_provider.dart';
import 'package:Islami/core/utils/colors.dart';
import 'package:Islami/presentation_layer/home_page/componenet/custom_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cityController = TextEditingController();
    final countryController = TextEditingController();

    void _searchPrayerTimes(BuildContext context) {
      final provider = Provider.of<PrayerTimeProvider>(context, listen: false);
      final city = cityController.text.trim();
      final country = countryController.text.trim();

      if (city.isNotEmpty && country.isNotEmpty) {
        provider.loadPrayerTimes(city, country);
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text(
          "Setting",
          style: TextStyle(color: Colors.blue, fontSize: 35),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomSearchBar(
              searchController: cityController,
              onSearch: (value) => _searchPrayerTimes(context),
              hintText: "City Name",
              iconPath: const Icon(Icons.add_location),
            ),
            const SizedBox(height: 20),
            CustomSearchBar(
              searchController: countryController,
              onSearch: (value) => _searchPrayerTimes(context),
              hintText: "Country Name",
              iconPath: const Icon(Icons.language_outlined),
            ),
            const SizedBox(height: 30),
            // Consumer to display prayer times
            Consumer<PrayerTimeProvider>(
              builder: (context, provider, child) {
                if (provider.isLoading) {
                  return const CircularProgressIndicator();
                }
                if (provider.prayerData == null || provider.prayerData!['timings'] == null) {
                  return const Text('No data available');
                }

                final timings = provider.prayerData!['timings'] as Map<String, dynamic>;

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: timings.entries.map((entry) {
                      // Ensure entry.key and entry.value are both strings
                      return ListTile(
                        title: Text('${entry.key}: ${entry.value.toString()}',style: TextStyle(color: AppColors.primary),),
                      );
                    }).toList(),
                  ),
                );
              },
            ),
            ElevatedButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text("Finish"))
          ],
        ),
      ),
    );
  }
}
