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
        .navigationTitle(L10n.add)
        .fullBackgroundColor(.systemGray6)
        .sheet(isPresented: self.$showSheet,
               onDismiss: {
                   self.viewModel.setState(.end)
               },
               content: {
                   self.newMovementContainerView
                       .accentColor(self.resolver.appearance.accentColor)
               })
    }

    private var newMovementContainerView: some View {
        return NewMovementContainerView(viewModel: self._viewModel)
            .frame(width: 500,
                   height: 500,
                   alignment: .center)
    }
}

struct MovementTypeSelectorInternalView_Previews: PreviewProvider {
    static var previews: some View {
        MovementTypeSelectorInternalView(dataModel: DataPreview.dataModel)
    }
}
