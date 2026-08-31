import '../services/session_manager.dart';

const featureAccess = FeatureAccess._();

class FeatureAccess {
  const FeatureAccess._();

  bool has(String featureKey) =>
      SessionController.instance.userFeatures.contains(featureKey);
}
