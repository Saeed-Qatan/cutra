/// Enumeration representing the user's authentication and approval status.
enum AuthStatus {
  /// App is restoring or validating a session
  checking,

  /// User is not logged in
  unauthenticated,

  /// User is logged in but awaiting admin approval
  pending,

  /// User registration was rejected by admin
  rejected,

  /// User is authenticated and approved
  authenticated,
}
