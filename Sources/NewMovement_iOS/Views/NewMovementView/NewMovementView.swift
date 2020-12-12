//
//  NewMovementView.swift
//
//
//  Created by Bastián Véliz Vega on 17-10-20.
//

import AccountsUI
import DataManagement
import DependencyResolver
import SwiftUI
import NewMovementCommon

/// New movement view
public struct NewMovementView: View {
    @ObservedObject var viewModel: NewMovementViewModel
    @EnvironmentObject var resolver: DependencyResolver

    private var dataModel: NewMovementViewDataModel
    private var movement: Movement
    private let isIncome: Bool

    /// Default initializer
    /// - Parameters:
    ///   - dataModel: data used to populate the view
    ///   - movement: movement used to edit its data.
    ///   - isIncome: indicates if view must be prepared for an income
    ///   - onEnd: called when movement edition ends
    public init(dataModel: NewMovementViewDataModel,
                movement: Movement,
                isIncome: Bool,
                onEnd: @escaping () -> Void) {
        self.dataModel = dataModel
        self.movement = movement
        self.isIncome = isIncome
        let model = NewMovementViewInternalDataModel(movement: movement)

        let viewModel = NewMovementViewModel(model: model,
                                             dataSource: dataModel.dataSource,
                                             incomeData: dataModel.incomeData,
                                             expenditureData: dataModel.expenditureData,
                                             onEnd: onEnd)
        viewModel.isIncome = isIncome
        viewModel.isEdition = true
        self.viewModel = viewModel
    }

    public var body: some View {
        NavigationView {
            ZStack {
                if self.viewModel.state.error != nil {
                    self.errorView
                } else {
                    self.newMovementView
                }
                self.loadingView
            }
        }.alert(isPresented: self.$viewModel.state.showDeleteAlert,
                content: {
                    self.deleteAlert
        })
            .accentColor(self.resolver.appearance.accentColor)
    }

    private var newMovementView: some View {
        let dataResources = NewMovementViewInternalDataResources(
            categories: self.viewModel.categories,
            stores: self.viewModel.stores, customDataSectionTitle: self.viewModel.state.movementDetailTitle,
            isIncome: self.isIncome
        )
        return NewMovementViewInternal(model: self.$viewModel.model,
                                       dataResources: dataResources,
                                       deleteAction: {
                                           self.viewModel.setState(.askingForDelete)
        })
            .navigationBarTitle(self.viewModel.state.navigationBarTitle)
            .navigationBarItems(leading: self.cancelButton,
                                trailing: self.saveButton)
    }

    // MARK: - Navigation bar buttons

    private var cancelButton: some View {
        Button {
            self.viewModel.setState(.end)
        } label: {
            Text(L10n.cancel)
        }
        .disabled(self.viewModel.state.showLoading)
    }

    private var saveButton: some View {
        let disabled = self.viewModel.state.showLoading || self.viewModel.state.error != nil
        return Button {
            self.viewModel.setState(.saving)
        } label: {
            Text(L10n.save).bold()
        }
        .disabled(disabled)
    }

    // MARK: - Loading view

    private var loadingView: some View {
        VStack {
            if self.viewModel.state.showLoading {
                VStack {
                    ProgressView()
                }
                .frame(minWidth: 0,
                       maxWidth: .infinity,
                       minHeight: 0,
                       maxHeight: .infinity)
                .background(Color.backgroundColor.opacity(0.5))
            }
        }
    }

    // MARK: - Delete alert

    private var deleteAlert: Alert {
        let message = L10n.areYouSureYouWantToDeleteThisMovement
        let title = self.isIncome ? L10n.deleteIncome : L10n.deleteExpenditure
        let deleteButtonLabel = L10n.delete

        let deleteButton = Alert.Button.destructive(Text(deleteButtonLabel)) {
            self.viewModel.setState(.deleting)
        }

        let cancelButton = Alert.Button.cancel()

        return Alert(title: Text(title),
                     message: Text(message),
                     primaryButton: deleteButton,
                     secondaryButton: cancelButton)
    }

    // MARK: - Error view

    private var errorView: some View {
        GenericErrorView(title: L10n.couldnTExecuteTransaction,
                         error: self.viewModel.state.error)
    }
}

struct NewMovementView_Previews: PreviewProvider {
    static var previews: some View {
        NewMovementView(dataModel: DataPreview.dataModel,
                        movement: DataPreview.movement,
                        isIncome: true,
                        onEnd: {})
    }
}
