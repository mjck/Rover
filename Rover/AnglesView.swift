//
//  AnglesView.swift
//  Rover
//
//  Created by Marcel Jackowski on 7/20/24.
//

import SwiftUI

struct AnglesView: View {
    @EnvironmentObject var roverStateModel: RoverStateModel
    var body: some View {
        HStack {
            Text("Attitude")
                .font(.system(size: 15))
                .frame(alignment: .trailing)
            VStack {
                Text("\(roverStateModel.roll, specifier: "%.2f")")
                    .font(.title2)
                Text("Roll")
                    .font(.caption)
            }
            .frame(width: 70)
            .padding(.horizontal, 10)
            VStack {
                Text("\(roverStateModel.pitch, specifier: "%.2f")")
                    .font(.title2)
                Text("Pitch")
                    .font(.caption)
            }
            .frame(width: 70)
            .padding(.horizontal, 10)
            VStack {
                Text("\(roverStateModel.yaw, specifier: "%.2f")")
                    .font(.title2)
                Text("Yaw")
                    .font(.caption)
            }
            .frame(width: 80)
            .padding(.horizontal, 10)
        }
        //.padding(.vertical, 20)
    }
}

//#Preview {
//    AnglesView()
//}
