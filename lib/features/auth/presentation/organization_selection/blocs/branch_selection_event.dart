import '../../../../../../../features/auth/domain/entities/user_entity.dart';

abstract class BranchSelectionEvent {
  const BranchSelectionEvent();
}

class BranchSelectedEvent extends BranchSelectionEvent {
  final UserOrganizationEntity org;
  final int orgIndex;

  const BranchSelectedEvent({required this.org, required this.orgIndex});
}
