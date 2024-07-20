//
//  RoverStateModel.swift
//  Rover
//
//  Created by Marcel Jackowski on 7/19/24.
//

import Foundation
import Accelerate

@MainActor
class RoverStateModel: ObservableObject {
    
    @Published var roll: Double = 0.0
    @Published var pitch: Double = 0.0
    @Published var yaw: Double = 0.0
    @Published var voltage: Double = 0.0
    
    @Published var acc: SIMD3<Double> = [0.0, 0.0, 0.0]
    @Published var gyr: SIMD3<Double> = [0.0, 0.0, 0.0]
    @Published var mgn: SIMD3<Int> = [0, 0, 0]
    
    let rover: Rover
    
    init() {
        rover = Rover.shared
    }
    
    func infoUpdate() async {
        do {
            let info = try await rover.postInfoCommand()
            roll = info!.r
            pitch = info!.p
            yaw = info!.y
            voltage = info!.v
        } catch {
            print("Gen Info Command Error", error)
        }
    }
    
    func imuUpdate() async {
        do {
            let info = try await rover.postIMUCommand()
            acc.x = info!.ax
            acc.y = info!.ay
            acc.z = info!.az
            gyr.x = info!.gx
            gyr.y = info!.gy
            gyr.z = info!.gz
            mgn.x = info!.mx
            mgn.y = info!.my
            mgn.z = info!.mz
        } catch {
            print("IMU Info Command Error", error)
        }
    }
}
