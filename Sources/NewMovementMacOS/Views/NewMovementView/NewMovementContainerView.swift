//
//  MovementTypeNewMovementView.swift
//
//
//  Created by Bastián Véliz Vega on 12-12-20.
//

import AccountsUI
import DependencyResolver
import Foundation
import NewMovementCommon
import SwiftUI

struct NewMovementContainerView: View {
    @State var showLoading: Bool = false
    @ObservedObject var viewModel: NewMovementViewModel
    @EnvironmentObject var resolver: DependencyResolver
    private var deleteAction: (() -> Void)?

    init(viewModel: ObservedObject<NewMovementViewModel>,
         deleteAction: (() -> Void)? = nil)
    {
        self._viewModel = viewModel
        self.deleteAction = deleteAction
    }

    var body: some View {
        ZStack {
            VStack {
                VStack {
                    Text(self.viewModel.state.navigationBarTitle)
                        .font(.title)
                }
                .frame(minWidth: 0,
                       maxWidth: .infinity,
                       minHeight: 0,
                       maxHeight: 50)
                VStack {
                    self.newMovementView
                }
                .frame(minWidth: 0,
                       maxWidth: .infinity,
                       minHeight: 0,
                       maxHeight: .infinity)
                HStack {
                    self.cancelButton
                    Spacer()
                    self.saveButton
                }
                .frame(minWidth: 0,
                       maxWidth: .infinity,
                       minHeight: 0,
                       maxHeight: 50)
            }
            .navigationTitle(self.viewModel.state.navigationBarTitle)
            .padding([.leading, .trailing], 10)
            .background(Color.systemGray6)

            self.loadingView
        }
    }

    private var newMovementView: some View {
        let dataResources = NewMovementViewInternalDataResources(
            categories: self.viewModel.categories,
            stores: self.viewModel.stores,
            customDataSectionTitle: self.viewModel.state.movementDetailTitle,
            isIncome: self.viewModel.state.isIncome
        )
        return NewMovementViewInternal(model: self.$viewModel.model,
                                       dataResources: dataResources,
                                       deleteAction: self.deleteAction)
    }

    // MARK: - Loading view

    private var loadingView: some View {
        VStack {
            if self.showLoading {
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
        .background(self.resolver.appearance.accentColor)
        .disabled(self.viewModel.state.showLoading)
    }
}

struct MovementTypeNewMovementView_Previews: PreviewProvider {
    @ObservedObject static var viewModel: NewMovementViewModel = DataPreview.viewModel

    static var previews: some View {
        NewMovementContainerView(viewModel: self._viewModel)
            .frame(width: 500,
                   height: 500,
                   alignment: .center)
    }
}
