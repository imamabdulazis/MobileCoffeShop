import 'package:caffeshop/data/remote/api_provider.dart';
import 'package:caffeshop/presentations/screens/drawer/drawer_navigation.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DynamicLinkService {
  final ApiProvider apiProvider = ApiProvider();
  Future handleDynamicLinks() async {
    // 1. Get the initial dynamic link if the app is opened with a dynamic link
    final PendingDynamicLinkData data =
        await FirebaseDynamicLinks.instance.getInitialLink();

    // 2. handle link that has been retrieved
    _handleDeepLink(data);

    // 3. Register a link callback to fire if the app is opened up from the background
    // using a dynamic link.
    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData dynamicLink) async {
      // 3a. handle link that has been retrieved
      _handleDeepLink(dynamicLink);
    }, onError: (OnLinkErrorException e) async {
      print('Link Failed: ${e.message}');
    });
  }

  void _handleDeepLink(PendingDynamicLinkData data) {
    final Uri deepLink = data?.link;
    if (deepLink != null) {
      print('_handleDeepLink | deeplink: $deepLink');

      var isHome = deepLink.pathSegments.contains('home');
      if (isHome) {
        var orderId = deepLink.queryParameters['orderId'];

        if (orderId != null) {
          print("ORDER_ID:$orderId");
          apiProvider.statusPeyment(orderId);
          Get.offNamedUntil(
              DrawerNavigation.route, (Route<dynamic> route) => false);
        }
      }
    }
  }

  Future<Uri> createDynamicLinkHome(String id) async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      // This should match firebase but without the username query param
      uriPrefix: 'https://copsychus.page.link',
      // This can be whatever you want for the uri, https://yourapp.com/groupinvite?username=$userName
      link: Uri.parse('https://copsychus.page.link/home?orderId=$id'),
      androidParameters: AndroidParameters(
        packageName: 'com.example.caffeshop',
      ),
      iosParameters: IosParameters(
        bundleId: 'com.example.caffeshop',
      ),
    );
    final link = await parameters.buildUrl();
    final ShortDynamicLink shortenedLink =
        await DynamicLinkParameters.shortenUrl(
      link,
      DynamicLinkParametersOptions(
        shortDynamicLinkPathLength: ShortDynamicLinkPathLength.unguessable,
      ),
    );
    return shortenedLink.shortUrl;
  }
}
