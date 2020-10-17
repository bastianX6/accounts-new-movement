// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Agregar
  internal static let add = L10n.tr("Localizable", "Add")
  /// Monto ($)
  internal static let amount = L10n.tr("Localizable", "Amount ($)")
  /// Información básica
  internal static let basicInformation = L10n.tr("Localizable", "Basic information")
  /// Cancelar
  internal static let cancel = L10n.tr("Localizable", "Cancel")
  /// Categoría
  internal static let category = L10n.tr("Localizable", "Category")
  /// Comentarios
  internal static let comments = L10n.tr("Localizable", "Comments")
  /// Fecha
  internal static let date = L10n.tr("Localizable", "Date")
  /// Descripción
  internal static let description = L10n.tr("Localizable", "Description")
  /// Gasto
  internal static let expedirure = L10n.tr("Localizable", "Expedirure")
  /// Detalle del gasto
  internal static let expenditureDetails = L10n.tr("Localizable", "Expenditure details")
  /// Ingreso
  internal static let income = L10n.tr("Localizable", "Income")
  /// Detalle del ingreso
  internal static let incomeDetails = L10n.tr("Localizable", "Income details")
  /// Pagado
  internal static let isPaid = L10n.tr("Localizable", "Is Paid")
  /// Compra en cuotas
  internal static let multiPaymentMovement = L10n.tr("Localizable", "Multi-payment movement")
  /// Nuevo gasto
  internal static let newExpenditure = L10n.tr("Localizable", "New expenditure")
  /// Nuevo ingreso
  internal static let newIncome = L10n.tr("Localizable", "New income")
  /// Nuevo movimiento
  internal static let newMovement = L10n.tr("Localizable", "New movement")
  /// Nº de cuotas (%i)
  internal static func numberOfPaymentsI(_ p1: Int) -> String {
    return L10n.tr("Localizable", "Number of payments (%i)", p1)
  }
  /// Gasto fijo
  internal static let permanentExpenditure = L10n.tr("Localizable", "Permanent expenditure")
  /// Ingreso fijo
  internal static let permanentIncome = L10n.tr("Localizable", "Permanent income")
  /// Guardar
  internal static let save = L10n.tr("Localizable", "Save")
  /// Tienda / Tarjeta
  internal static let storeCreditCard = L10n.tr("Localizable", "Store / Credit card")
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
    static let bundle = Bundle.module
}
// swiftlint:enable convenience_type
