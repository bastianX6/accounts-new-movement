//
//  ContainerView.swift
//
//
//  Created by Bastián Véliz Vega on 17-09-20.
//

import DataManagement
import SwiftUI

/// New movement view
public struct ContainerView: View {
    private var dataModel: NewMovementViewDataModel
    private var movement: Movement?

    /// Default initializer
    /// - Parameters:
    ///   - dataModel: data used to populate the view
    ///   - movement: movement used to edit its data. Default value: `nil`
    public init(dataModel: NewMovementViewDataModel,
                movement: Movement? = nil) {
        self.dataModel = dataModel
        self.movement = movement
    }

    /// View's body
    public var body: some View {
        let viewModel: NewMovementViewModel
        if let movement = self.movement {
            let model = NewMovementView.DataModel(movement: movement)
            viewModel = NewMovementViewModel(model: model,
                                             dataSource: self.dataModel.dataSource,
                                             incomeData: self.dataModel.incomeData,
                                             expeditureData: self.dataModel.expeditureData)

        } else {
            viewModel = NewMovementViewModel(dataSource: self.dataModel.dataSource,
                                             incomeData: self.dataModel.incomeData,
                                             expeditureData: self.dataModel.expeditureData)
        }
        return ContainerViewiOS(viewModel: viewModel)
    }
}

struct NewMovementView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerView(dataModel: DataPreview.dataModel)
    }
}
