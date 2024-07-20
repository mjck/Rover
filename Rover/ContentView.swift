//
//  ContentView.swift
//  Rover
//
//  Created by Marcel Jackowski on 7/19/24.
//

import SwiftUI
import Combine

struct ContentView: View {
    @EnvironmentObject var roverStateModel: RoverStateModel
    //@StateObject var roverStateModel = RoverStateModel()

    @State private var timer = Timer.publish(every: 0.25, on: .main, in: .common)//.autoconnect()
    @State private var timerHandler: Cancellable?
    
    // A flag to stop timer from repeating itself
    //@State private var repeatTimer: Bool = false
    
    var body: some View {
        ZStack {
            Color.black
            VStack {
                Text("Rover Dashboard")
                    .font(.title)
                    .colorInvert()
                    .padding()
                VoltageView()
                    .colorInvert()
                    .padding()
                AnglesView()
                    .colorInvert()
                    .padding()
                AccelerometerView()
                    .colorInvert()
                    .padding()
                GyroscopeView()
                    .colorInvert()
                    .padding()
                MagnetometerView()
                    .colorInvert()
                    .padding()
                HStack {
                    Button("Start") {
                        timer = Timer.publish(every: 0.25, tolerance: 0.01, on: .main, in: .common)//.autoconnect()
                        timerHandler = timer.connect()
                    }
                    .padding()
                    Button("Stop") {
                        cancelTimer()
                    }
                    .padding()
                }
            }
        }
        .onReceive(timer) { timer in
            Task {
                await roverStateModel.infoUpdate()
                await roverStateModel.imuUpdate()
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    func cancelTimer() {
        timerHandler?.cancel()
        //timer.upstream.connect().cancel()
    }
}
