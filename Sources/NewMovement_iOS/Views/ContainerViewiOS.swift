//
//  ContainerViewiOS.swift
//
//
//  Created by Bastián Véliz Vega on 17-09-20.
//

import NewMovementCommon
import SwiftUI

struct ContainerViewiOS: View {
    @ObservedObject var viewModel: NewMovementViewModel

    init(viewModel: NewMovementViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            MovementTypeView {
                self.viewModel.setState(.showSheet(isIncome: false))
            } incomeAction: {
                self.viewModel.setState(.showSheet(isIncome: true))
            }
            .background(Color.systemGray6)
            .navigationBarTitle(L10n.add)
            .navigationBarTitleDisplayMode(.inline)
        }
        .sheet(isPresented: self.$viewModel.state.showSheet,
               onDismiss: {
                   self.viewModel.setState(.initial)
               },
               content: {
                   NavigationView {
                       ZStack {
                           self.newMovementView
                           self.loadingView
                       }
                   }
        })
    }

    private var newMovementView: some View {
        let dataResources = NewMovementView.DataResources(
            categories: self.viewModel.categories,
            stores: self.viewModel.stores, customDataSectionTitle: self.viewModel.state.movementDetailTitle,
            isIncome: self.viewModel.state.isIncome
        )
        return NewMovementView(model: self.$viewModel.model,
                               dataResources: dataResources)
            .navigationBarTitle(self.viewModel.state.navigationBarTitle)
            .navigationBarItems(leading: self.cancelButton,
                                trailing: self.saveButton)
    }

    // MARK: - Navigation bar buttons

    private var cancelButton: some View {
        Button {
            self.viewModel.setState(.initial)
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

struct ContainerViewiOS_Previews: PreviewProvider {
    static var previews: some View {
        ContainerViewiOS(viewModel: DataPreview.viewModel)
    }
}
