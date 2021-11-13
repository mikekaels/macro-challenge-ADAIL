// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Create your group first or joint to access this app
  internal static let onB1Desc = L10n.tr("Localizable", "onB1Desc")
  /// Create Or Join Group
  internal static let onB1Title = L10n.tr("Localizable", "onB1Title")
  /// 'CoFi' will help you to manage your expenses bill group
  internal static let onB2Desc = L10n.tr("Localizable", "onB2Desc")
  /// Create Expenses
  internal static let onB2Title = L10n.tr("Localizable", "onB2Title")
  /// 'CoFi' will help to provide your owe information
  internal static let onB3Desc = L10n.tr("Localizable", "onB3Desc")
  /// Providing Your Owe Information
  internal static let onB3Title = L10n.tr("Localizable", "onB3Title")
  /// Welcome
  internal static let welcomeTitle = L10n.tr("Localizable", "welcomeTitle")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
