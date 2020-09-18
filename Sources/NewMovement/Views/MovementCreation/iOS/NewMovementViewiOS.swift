//
//  NewMovementView.swift
//
//
//  Created by Bastián Véliz Vega on 17-09-20.
//

import SwiftUI

#if os(iOS)
    struct NewMovementViewiOS: View {
        @ObservedObject var viewModel: NewMovementViewModel

        init(viewModel: NewMovementViewModel) {
            self.viewModel = viewModel
        }

        var body: some View {
            NavigationView {
                MovementTypeView {
                    self.viewModel.setState(.showSheet(isIncome: true))
                } incomeAction: {
                    self.viewModel.setState(.showSheet(isIncome: false))
                }
                .navigationBarTitle(L10n.add)
            }.sheet(isPresented: self.$viewModel.state.showSheet,
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
            NewMovementBaseView(model: self.$viewModel.model,
                                categories: self.viewModel.categories,
                                stores: self.viewModel.stores)
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
                        if #available(iOS 14.0, *) {
                            ProgressView()
                        } else {
                            Text("Saving")
                        }
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

    struct NewMovementViewiOS_Previews: PreviewProvider {
        static var previews: some View {
            NewMovementViewiOS(viewModel: DataPreview.viewModel)
        }
    }

#endif
