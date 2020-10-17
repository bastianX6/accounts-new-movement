//
//  MovementTypeSelectorView.swift
//
//
//  Created by Bastián Véliz Vega on 17-10-20.
//

import DataManagement
import SwiftUI

/// New movement type selector view
public struct MovementTypeSelectorView: View {
    private var dataModel: NewMovementViewDataModel

    /// Default initializer
    /// - Parameters:
    ///   - dataModel: data used to populate the view
    public init(dataModel: NewMovementViewDataModel) {
        self.dataModel = dataModel
    }

    /// View's body
    public var body: some View {
        let viewModel = NewMovementViewModel(dataSource: self.dataModel.dataSource,
                                             incomeData: self.dataModel.incomeData,
                                             expeditureData: self.dataModel.expeditureData)

        return MovementTypeSelectorInternalView(viewModel: viewModel)
    }
}

struct MovementTypeSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        MovementTypeSelectorView(dataModel: DataPreview.dataModel)
    }
}
