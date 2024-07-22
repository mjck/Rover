//
//  MagnetometerView.swift
//  Rover
//
//  Created by Marcel Jackowski on 7/20/24.
//

import SwiftUI

struct MagnetometerView: View {
    @EnvironmentObject var roverStateModel: RoverStateModel
    var body: some View {
        //HStack {
            Text("Mgn")
                .font(.system(size: 14))
                //.frame(alignment: .trailing)
            VStack {
                Text("\(roverStateModel.mgn.x, specifier: "%3d")")
                    .font(.system(size: 18))
                Text("X")
                    .font(.caption)
            }
            //.frame(width: 70)
            .padding(.horizontal, 10)
            VStack {
                Text("\(roverStateModel.mgn.y, specifier: "%3d")")
                    .font(.system(size: 18))
                Text("Y")
                    .font(.caption)
            }
            //.frame(width: 70)
            .padding(.horizontal, 10)
            VStack {
                Text("\(roverStateModel.mgn.z, specifier: "%3d")")
                    .font(.system(size: 18))
                Text("Z")
                    .font(.caption)
            }
            //.frame(width: 70)
            .padding(.horizontal, 10)
        }
        //.padding(.vertical, 20)
    //}
}

//#Preview {
//    MagnetometerView()
//}
