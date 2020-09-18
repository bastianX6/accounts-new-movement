//
//  NewMovementView.swift
//
//
//  Created by Bastián Véliz Vega on 17-09-20.
//

import DataManagement
import SwiftUI

/// New movement view
public struct NewMovementView: View {
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

    /**
     View's body

     View's body

     - Important:
        This view is only available in iOS
     */
    public var body: some View {
        #if os(iOS)
            return self.iOSView.eraseToAnyView()
        #else
            return Text("Hello, World!").eraseToAnyView()
        #endif
    }

    #if os(iOS)
        private var iOSView: some View {
            let viewModel: NewMovementViewModel
            if let movement = self.movement {
                let model = NewMovementBaseModel(movement: movement)
                viewModel = NewMovementViewModel(model: model,
                                                 dataSource: self.dataModel.dataSource,
                                                 stores: self.dataModel.stores,
                                                 categories: self.dataModel.categories)

            } else {
                viewModel = NewMovementViewModel(dataSource: self.dataModel.dataSource,
                                                 stores: self.dataModel.stores,
                                                 categories: self.dataModel.categories)
            }
            return NewMovementViewiOS(viewModel: viewModel)
        }
    #endif
}

struct NewMovementView_Previews: PreviewProvider {
    static var previews: some View {
        NewMovementView(dataModel: DataPreview.dataModel)
    }
}
