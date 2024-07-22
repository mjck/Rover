//
//  VoltageView.swift
//  Rover
//
//  Created by Marcel Jackowski on 7/20/24.
//

import SwiftUI

struct VoltageView: View {
    @EnvironmentObject var roverStateModel: RoverStateModel
    var body: some View {
        HStack {
            VStack {
                Text("\(roverStateModel.voltage, specifier: "%5.2f")")
                font(.system(size: 19))
                Text("Voltage")
                    .font(.caption)
            }
        }
    }
}

//#Preview {
//    VoltageView()
//}
