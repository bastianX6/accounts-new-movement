//
//  MovementTypeSelectorInternalView.swift
//
//
//  Created by Bastián Véliz Vega on 17-10-20.
//

import Foundation

import AccountsUI
import DependencyResolver
import NewMovementCommon
import SwiftUI

struct MovementTypeSelectorInternalView: View {
    @ObservedObject var viewModel: NewMovementViewModel
    @EnvironmentObject var resolver: DependencyResolver
    @State var showSheet: Bool = false

    init(dataModel: NewMovementViewDataModel) {
        self.viewModel = NewMovementViewModel(dataSource: dataModel.dataSource,
                                              incomeData: dataModel.incomeData,
                                              expenditureData: dataModel.expenditureData,
                                              onEnd: {})
    }

    var body: some View {
        self.viewModel.endState.onEnd = {
            self.showSheet = false
        }

        return MovementTypeView {
            self.viewModel.isIncome = false
            self.showSheet = true

        } incomeAction: {
            self.viewModel.isIncome = true
            self.showSheet = true
        }
        .background(Color.systemGray6)
        .fullBackgroundColor(.systemGray6)
        .navigationBarTitle(L10n.add)
        .navigationBarItems(leading: Text(""), trailing: Text(""))
        .navigationBarTitleDisplayMode(.inline)
        .wrapInNavigationViewIfNeeded()
        .sheet(isPresented: self.$showSheet,
               onDismiss: {
                   self.viewModel.setState(.end)
               },
               content: {
                   NavigationView {
                       ZStack {
                           self.newMovementView
                           self.loadingView
                       }
                   }
                   .accentColor(self.resolver.appearance.accentColor)
               })
    }

    private var newMovementView: some View {
        let dataResources = NewMovementViewInternalDataResources(
            categories: self.viewModel.categories,
            stores: self.viewModel.stores,
            customDataSectionTitle: self.viewModel.state.movementDetailTitle,
            isIncome: self.viewModel.state.isIncome
        )
        return NewMovementViewInternal(model: self.$viewModel.model,
                                       dataResources: dataResources)
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

struct MovementTypeSelectorInternalView_Previews: PreviewProvider {
    static var previews: some View {
        MovementTypeSelectorInternalView(dataModel: DataPreview.dataModel)
    }
}
