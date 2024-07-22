//
//  GyroscopeView.swift
//  Rover
//
//  Created by Marcel Jackowski on 7/20/24.
//

import SwiftUI

struct GyroscopeView: View {
    @EnvironmentObject var roverStateModel: RoverStateModel
    var body: some View {
        //HStack {
            Text("Gyr")
                .font(.system(size: 14))
                //.frame(alignment: .trailing)
            VStack {
                Text("\(roverStateModel.gyr.x, specifier: "%.2f")")
                    .font(.system(size: 18))
                Text("X")
                    .font(.caption)
            }
            //.frame(width: 70)
            .padding(.horizontal, 10)
            VStack {
                Text("\(roverStateModel.gyr.y, specifier: "%.2f")")
                    .font(.system(size: 18))
                Text("Y")
                    .font(.caption)
            }
            //.frame(width: 70)
            .padding(.horizontal, 10)
            VStack {
                Text("\(roverStateModel.gyr.z, specifier: "%.2f")")
                    .font(.system(size: 18))
                Text("Z")
                    .font(.caption)
            }
            //.frame(width: 70)
            .padding(.horizontal, 10)
        }
    //}
}

//#Preview {
//    GyroscopeView()
//}
