//
//  NewMovementView.swift
//
//
//  Created by Bastián Véliz Vega on 17-10-20.
//

import DataManagement
import DependencyResolver
import SwiftUI

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
        let model = NewMovementViewInternal.DataModel(movement: movement)

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
                self.newMovementView
                self.loadingView
            }
        }
        .accentColor(self.resolver.appearance.accentColor)
    }

    private var newMovementView: some View {
        let dataResources = NewMovementViewInternal.DataResources(
            categories: self.viewModel.categories,
            stores: self.viewModel.stores, customDataSectionTitle: self.viewModel.state.movementDetailTitle,
            isIncome: self.isIncome
        )
        return NewMovementViewInternal(model: self.$viewModel.model,
                                       dataResources: dataResources,
                                       deleteAction: {})
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
        Button {
            self.viewModel.setState(.saving)
            self.viewModel.state.saveAction()
        } label: {
            Text(L10n.save).bold()
        }
        .disabled(self.viewModel.state.showLoading)
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
}

struct NewMovementView_Previews: PreviewProvider {
    static var previews: some View {
        NewMovementView(dataModel: DataPreview.dataModel,
                        movement: DataPreview.movement,
                        isIncome: true,
                        onEnd: {})
    }
}
