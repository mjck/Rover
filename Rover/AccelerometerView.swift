//
//  AccelerometerView.swift
//  Rover
//
//  Created by Marcel Jackowski on 7/20/24.
//

import SwiftUI

struct AccelerometerView: View {
    @EnvironmentObject var roverStateModel: RoverStateModel
    var body: some View {
        //HStack {
            Text("Acc")
                .font(.system(size: 14))
                //.frame(alignment: .trailing)
            VStack {
                Text("\(roverStateModel.acc.x, specifier: "%+.2f")")
                    .font(.system(size: 18))
                Text("X")
                    .font(.caption)
            }
            //.frame(width: 70)
            .padding(.horizontal, 10)
            VStack {
                Text("\(roverStateModel.acc.y, specifier: "%+.2f")")
                    .font(.system(size: 18))
                Text("Y")
                    .font(.caption)
            }
            //.frame(width: 70)
            .padding(.horizontal, 10)
            VStack {
                Text("\(roverStateModel.acc.z, specifier: "%+.2f")")
                    .font(.system(size: 18))
                Text("Z")
                    .font(.caption)
            }
            //.frame(width: 80)
            .padding(.horizontal, 10)
        }
        //.padding(.vertical, 20)
    //}
}

//#Preview {
//    AccelerometerView()
//}
