sealed class AppConfig {
  // Base parity with Kotlin AppConfig.kt
  static const bool isTesting = bool.fromEnvironment(
    'IS_TESTING',
    defaultValue: false,
  );

  // Build strategy flags (UI-first migration from Kotlin to Flutter).
  static const bool uiOnlyMode = bool.fromEnvironment(
    'UI_ONLY_MODE',
    defaultValue: true,
  );
  static const bool allowNetworkCalls = bool.fromEnvironment(
    'ALLOW_NETWORK_CALLS',
    defaultValue: false,
  );

  // Domain integration flags (keep false while only UI is being ported).
  static const bool enableAuthBackend = bool.fromEnvironment(
    'ENABLE_AUTH_BACKEND',
    defaultValue: false,
  );
  static const bool enableOnboardingBackend = bool.fromEnvironment(
    'ENABLE_ONBOARDING_BACKEND',
    defaultValue: false,
  );
  static const bool enableProfileBackend = bool.fromEnvironment(
    'ENABLE_PROFILE_BACKEND',
    defaultValue: false,
  );
  static const bool enableSettingsBackend = bool.fromEnvironment(
    'ENABLE_SETTINGS_BACKEND',
    defaultValue: false,
  );

  // Remote legal docs can be enabled later when needed.
  static const bool enableRemoteLegalDocs = bool.fromEnvironment(
    'ENABLE_REMOTE_LEGAL_DOCS',
    defaultValue: false,
  );
  static const String legalBaseUrl = String.fromEnvironment(
    'TNYX_LEGAL_BASE_URL',
    defaultValue: 'https://www.tnyx.app',
  );

  static bool get backendEnabled =>
      !uiOnlyMode &&
      allowNetworkCalls &&
      (enableAuthBackend ||
          enableOnboardingBackend ||
          enableProfileBackend ||
          enableSettingsBackend);

  static bool get remoteLegalDocsEnabled =>
      allowNetworkCalls && enableRemoteLegalDocs;

  static void validate() {
    assert(
      !uiOnlyMode || !allowNetworkCalls,
      'UI_ONLY_MODE=true should not allow network calls.',
    );
    assert(
      !uiOnlyMode ||
          (!enableAuthBackend &&
              !enableOnboardingBackend &&
              !enableProfileBackend &&
              !enableSettingsBackend),
      'UI_ONLY_MODE=true requires all backend feature flags to remain false.',
    );
  }
}
