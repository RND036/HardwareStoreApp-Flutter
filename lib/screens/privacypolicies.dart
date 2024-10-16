import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hardware_store/widgets/appbar_widget.dart';
import 'package:hardware_store/widgets/jsonimport/privacy.dart';
import 'package:hardware_store/widgets/networkconnection.dart';
import 'package:http/http.dart' as http;

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  _PrivacyPolicyScreenState createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  Future<PrivacyPolicy?> fetchPrivacy() async {
    // geting data from external json
    var url = Uri.parse(
        'https://raw.githubusercontent.com/RND036/JsonData/main/privacypolicy.json'); 
    var response = await http.get(url);

    // to check the status of the connection
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return PrivacyPolicy.fromJson(json['privacyPolicy']);
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: Text('Privacy Policies'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<PrivacyPolicy?>(
          future: fetchPrivacy(),
          builder: (context, snapshot) {
            // to indicate connection
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error fetching data check your connection'));
            } else if (!snapshot.hasData) {
              return const Center(child: Text('No data available'));
            } else {
              var privacy = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const NetworkConnection(),
                        Text('${privacy.companyName}',
                            style: const TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 5),
                        Text('Last Updated: ${privacy.lastUpdated}',
                            style: const TextStyle(fontSize: 10)),
                             const SizedBox(height: 20),
                            const Divider(),
                        const SizedBox(height: 20),
                        const Text('Contact Info',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        Text('Email: ${privacy.contactInformation?.email}'),
                        Text('Phone: ${privacy.contactInformation?.phone}'),
                        Text('Address: ${privacy.contactInformation?.address}'),
                         const SizedBox(height: 20),
                        const Divider(),
                        const SizedBox(height: 20),
                        const Text('Policies',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                                 const SizedBox(height: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
  
                          children: [
                            Text(
                                'Personal Information Collected: ${privacy.dataCollection?.personalInformation?.typesCollected?.join(', ')}'),
                                 Text(
                            'Purpose: ${privacy.dataCollection?.personalInformation?.purposeOfCollection?.join(', ')}'),
                        const SizedBox(height: 20),
                        Text(
                            'Non-Personal Information Collected: ${privacy.dataCollection?.nonPersonalInformation?.typesCollected?.join(', ')}'),
                        Text(
                            'Purpose: ${privacy.dataCollection?.nonPersonalInformation?.purposeOfCollection?.join(', ')}'),
                             const SizedBox(height: 60),
                             const Divider(),
                              const SizedBox(height: 20),

                            const Text('All Right Resereved Tech.®')
                          ],
                          
                        ),
                       
                      ],
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

