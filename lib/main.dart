import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:latlong/latlong.dart';
import 'package:trufi_core/trufi_configuration.dart';
import 'package:trufi_core/trufi_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final trufiCfg = TrufiConfiguration();
  final globalCfg = GlobalConfiguration();
  await globalCfg.loadFromAsset("app_config");

  // Abbreviations
  trufiCfg.abbreviations.addAll({
    "Avenida": "Av.",
    "Calle": "C.",
    "Camino": "C.º",
  });

  // Animation
  trufiCfg.animation.loading = FlareActor(
    "assets/images/loading.flr",
    animation: "Trufi Drive",
  );
  trufiCfg.animation.success = FlareActor(
    "assets/images/success.flr",
    animation: "Untitled",
  );

  // Attribution
  trufiCfg.attribution.representatives.addAll([
    "Christoph Hanser",
    "Samuel Rioja",
  ]);
  trufiCfg.attribution.team.addAll([
    "Andreas Helms",
    "Annika Bock",
    "Christian Brückner",
    "Javier Rocha",
    "Luz Choque",
    "Malte Dölker",
    "Martin Kleppe",
    "Michael Brückner",
    "Natalya Blanco",
    "Neyda Mili",
    "Raimund Wege",
  ]);
  trufiCfg.attribution.translations.addAll([
    "Gladys Aguilar",
    "Jeremy Maes",
    "Gaia Vitali Roscini",
  ]);
  trufiCfg.attribution.routes.addAll([
    "Trufi team",
    "Guia Cochala team",
  ]);
  trufiCfg.attribution.osm.addAll([
    "Marco Antonio",
    "Noémie",
    "Philipp",
    "Felix D",
    "Valor Naram", // Sören Reinecke
  ]);

  // Email
  trufiCfg.email.feedback = globalCfg.getString("emailFeedback");
  trufiCfg.email.info = globalCfg.getString("emailInfo");

  // Image
  trufiCfg.image.drawerBackground = "assets/images/drawer-bg.jpg";

  // Map
  trufiCfg.map.mapTilerKey = "ugdtyAvKEOt7ClXjO5sM";
  trufiCfg.map.satelliteMapTypeEnabled = true;
  trufiCfg.map.terrainMapTypeEnabled = true;
  trufiCfg.map.defaultZoom = 14.0;
  trufiCfg.map.offlineMinZoom = 8.0;
  trufiCfg.map.offlineMaxZoom = 14.0;
  trufiCfg.map.offlineZoom = 13.0;
  trufiCfg.map.onlineMinZoom = 1.0;
  trufiCfg.map.onlineMaxZoom = 19.0;
  trufiCfg.map.onlineZoom = 13.0;
  trufiCfg.map.chooseLocationZoom = 16.0;
  trufiCfg.map.center = LatLng(35.572337, -5.373242);
  trufiCfg.map.southWest = LatLng(35.308321, -5.536133);
  trufiCfg.map.northEast = LatLng(35.844339, -5.087094);

  // Languages
  trufiCfg.languages.addAll([
    TrufiConfigurationLanguage(
      languageCode: "de",
      countryCode: "DE",
      displayName: "Deutsch",
    ),
    TrufiConfigurationLanguage(
      languageCode: "en",
      countryCode: "US",
      displayName: "English",
    ),
    TrufiConfigurationLanguage(
      languageCode: "es",
      countryCode: "ES",
      displayName: "Español",
    ),
    TrufiConfigurationLanguage(
      languageCode: "fr",
      countryCode: "FR",
      displayName: "Français",
      isDefault: true,
    ),
    TrufiConfigurationLanguage(
      languageCode: "it",
      countryCode: "IT",
      displayName: "Italiano",
    ),
  ]);

  // Url
  trufiCfg.url.otpEndpoint = globalCfg.getString("urlOtpEndpoint");
  trufiCfg.url.tilesStreetsEndpoint =
      globalCfg.getString("urlTilesStreetsEndpoint");
  trufiCfg.url.tilesSatelliteEndpoint =
      globalCfg.getString("urlTilesSatelliteEndpoint");
  trufiCfg.url.tilesTerrainEndpoint =
      globalCfg.getString("urlTilesTerrainEndpoint");
  trufiCfg.url.adsEndpoint = globalCfg.getString("urlAdsEndpoint");
  trufiCfg.url.routeFeedback = globalCfg.getString("urlRouteFeedback");
  trufiCfg.url.donate = globalCfg.getString("urlDonate");
  trufiCfg.url.website = globalCfg.getString("urlWebsite");
  trufiCfg.url.facebook = globalCfg.getString("urlFacebook");
  trufiCfg.url.instagram = globalCfg.getString("urlInstagram");
  trufiCfg.url.twitter = globalCfg.getString("urlTwitter");
  trufiCfg.url.share = globalCfg.getString("urlShare");

  // Run app
  runApp(
    TrufiApp(
      theme: ThemeData(
        primaryColor: const Color(0xff20356b),
        primaryColorLight: const Color(0xffe5f0fa),
        accentColor: const Color(0xfffcec35),
        backgroundColor: Colors.white,
      ),
    ),
  );
}
