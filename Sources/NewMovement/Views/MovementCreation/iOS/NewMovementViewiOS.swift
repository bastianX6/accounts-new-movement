//
//  NewMovementView.swift
//
//
//  Created by Bastián Véliz Vega on 17-09-20.
//

import SwiftUI

@available(watchOS, unavailable)
@available(macOS, unavailable)
@available(tvOS, unavailable)
struct NewMovementViewiOS: View {
    @ObservedObject var manager: NewMovementBaseManager = DataPreview.getData()
    @State private var showSheet = false
    @State private var isIncome = false

    init(isIncome: Bool = false) {
        self.isIncome = isIncome
    }

    var body: some View {
        NavigationView {
            MovementTypeView(expeditureAction: {
                self.isIncome = false
                self.showSheet.toggle()
            },
                             incomeAction: {
                self.isIncome = true
                self.showSheet.toggle()
            })
                .navigationBarTitle(L10n.add)
        }.sheet(isPresented: self.$showSheet,
                onDismiss: {
                    self.showSheet = false
                },
                content: {
                    NavigationView {
                        self.newMovementView
                    }
        })
    }

    private var newMovementView: some View {
        NewMovementBaseView(model: self.$manager.model,
                            categories: self.manager.categories,
                            stores: self.manager.stores)
            .navigationBarTitle(self.isIncome ? L10n.newIncome : L10n.newExpediture)
            .navigationBarItems(leading:
                Button(action: {
                    self.showSheet = false
                }, label: {
                    Text(L10n.cancel)
                }), trailing: Button(action: {
                    // TODO: Save expediture in DB
                    print("model: \(String(describing: self.manager.model))")
                    self.showSheet = false
                }, label: {
                    Text(L10n.save).bold()
            }))
    }
}

@available(watchOS, unavailable)
@available(macOS, unavailable)
@available(tvOS, unavailable)
struct NewMovementViewiOS_Previews: PreviewProvider {
    static var previews: some View {
        NewMovementViewiOS()
    }
}
