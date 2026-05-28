sealed class TnyxConfig {
  TnyxConfig._();

  /* -------------------------------------------------------------------------- */
  /*                                ENVIRONMENT                                 */
  /* -------------------------------------------------------------------------- */

  static const bool isDevelopment = true;

  static const bool isTesting = false;

  static const bool isProduction =
      !isDevelopment && !isTesting;

  /* -------------------------------------------------------------------------- */
  /*                                   NETWORK                                  */
  /* -------------------------------------------------------------------------- */

  static const String baseUrl =
      'https://api.tnyx.com/';

  static const Duration networkTimeout =
  Duration(seconds: 30);

  static const Duration receiveTimeout =
  Duration(seconds: 30);

  static const Duration sendTimeout =
  Duration(seconds: 30);

  /* -------------------------------------------------------------------------- */
  /*                                  DATABASE                                  */
  /* -------------------------------------------------------------------------- */

  static const String databaseName =
      'tnyx_db';

  static const int databaseVersion = 1;

  static const String datastoreName =
      'tnyx_prefs';

  /* -------------------------------------------------------------------------- */
  /*                                SECURE STORAGE                              */
  /* -------------------------------------------------------------------------- */

  static const String secureStorageName =
      'tnyx_secure_storage';

  /* -------------------------------------------------------------------------- */
  /*                                FEATURE FLAGS                               */
  /* -------------------------------------------------------------------------- */

  static const bool enableAiCoachBeta = true;

  static const bool enableDetailedLogging =
      isDevelopment;

  static const bool enableCrashReporting =
      isProduction;

  static const bool enableAnalytics =
      isProduction;

  static const bool enablePerformanceTracking =
      isProduction;

  static const bool enableWearOs =
  true;

  static const bool enableBluetooth =
  true;

  static const bool enableOfflineMode =
  true;

  /* -------------------------------------------------------------------------- */
  /*                                 PAGINATION                                 */
  /* -------------------------------------------------------------------------- */

  static const int defaultPageSize = 20;

  static const int maxPageSize = 100;

  /* -------------------------------------------------------------------------- */
  /*                                   CACHING                                  */
  /* -------------------------------------------------------------------------- */

  static const Duration apiCacheDuration =
  Duration(minutes: 5);

  static const Duration imageCacheDuration =
  Duration(days: 7);

  /* -------------------------------------------------------------------------- */
  /*                                   BLUETOOTH                                */
  /* -------------------------------------------------------------------------- */

  static const Duration bleScanTimeout =
  Duration(seconds: 12);

  static const Duration bleReconnectDelay =
  Duration(seconds: 5);

  static const int bleMtu = 247;

  /* -------------------------------------------------------------------------- */
  /*                                   WEAR OS                                  */
  /* -------------------------------------------------------------------------- */

  static const String wearDataPath =
      '/tnyx/wear';

  static const Duration wearSyncInterval =
  Duration(minutes: 15);

  /* -------------------------------------------------------------------------- */
  /*                                     AI                                     */
  /* -------------------------------------------------------------------------- */

  static const int aiChatMessageLimit = 100;

  static const Duration aiResponseTimeout =
  Duration(seconds: 60);

  /* -------------------------------------------------------------------------- */
  /*                                   UI/UX                                    */
  /* -------------------------------------------------------------------------- */

  static const Duration animationFast =
  Duration(milliseconds: 150);

  static const Duration animationMedium =
  Duration(milliseconds: 250);

  static const Duration animationSlow =
  Duration(milliseconds: 400);

  /* -------------------------------------------------------------------------- */
  /*                                   LOGGING                                  */
  /* -------------------------------------------------------------------------- */

  static const String logTag = 'TNYX';

  static const bool logNetworkRequests =
      isDevelopment;

  static const bool logBlocTransitions =
      isDevelopment;

  /* -------------------------------------------------------------------------- */
  /*                                  SECURITY                                  */
  /* -------------------------------------------------------------------------- */

  static const bool enableRootDetection =
      isProduction;

  static const bool enableScreenSecurity =
      isProduction;

  static const bool enableSslPinning =
      isProduction;
}