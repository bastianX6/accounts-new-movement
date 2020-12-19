// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Editar gasto
  internal static let editExpenditure = L10n.tr("Localizable", "Edit expenditure")
  /// Editar ingreso
  internal static let editIncome = L10n.tr("Localizable", "Edit income")
  /// Gasto
  internal static let expenditure = L10n.tr("Localizable", "Expenditure")
  /// Detalle del gasto
  internal static let expenditureDetails = L10n.tr("Localizable", "Expenditure details")
  /// Ingreso
  internal static let income = L10n.tr("Localizable", "Income")
  /// Detalle del ingreso
  internal static let incomeDetails = L10n.tr("Localizable", "Income details")
  /// Nuevo gasto
  internal static let newExpenditure = L10n.tr("Localizable", "New expenditure")
  /// Nuevo ingreso
  internal static let newIncome = L10n.tr("Localizable", "New income")
  /// ¿Qué deseas agregar?
  internal static let whatDoYouWantToAdd = L10n.tr("Localizable", "What do you want to add?")
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
