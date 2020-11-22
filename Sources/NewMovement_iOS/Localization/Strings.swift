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
  /// ¿Estás seguro que deseas borrar este movimiento?
  internal static let areYouSureYouWantToDeleteThisMovement = L10n.tr("Localizable", "Are you sure you want to delete this movement?")
  /// Información básica
  internal static let basicInformation = L10n.tr("Localizable", "Basic information")
  /// Cancelar
  internal static let cancel = L10n.tr("Localizable", "Cancel")
  /// Categoría
  internal static let category = L10n.tr("Localizable", "Category")
  /// Comentarios
  internal static let comments = L10n.tr("Localizable", "Comments")
  /// No se pudo ejecutar la transacción
  internal static let couldnTExecuteTransaction = L10n.tr("Localizable", "Couldn't execute transaction")
  /// Fecha
  internal static let date = L10n.tr("Localizable", "Date")
  /// Borrar
  internal static let delete = L10n.tr("Localizable", "Delete")
  /// Borrar gasto
  internal static let deleteExpenditure = L10n.tr("Localizable", "Delete expenditure")
  /// Borrar ingreso
  internal static let deleteIncome = L10n.tr("Localizable", "Delete income")
  /// Descripción
  internal static let description = L10n.tr("Localizable", "Description")
  /// Editar gasto
  internal static let editExpenditure = L10n.tr("Localizable", "Edit expenditure")
  /// Editar ingreso
  internal static let editIncome = L10n.tr("Localizable", "Edit income")
  /// Detalle del gasto
  internal static let expenditureDetails = L10n.tr("Localizable", "Expenditure details")
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
