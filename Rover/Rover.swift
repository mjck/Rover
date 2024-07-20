//
//  Rover.swift
//  Rover
//
//  Created by Marcel Jackowski on 7/19/24.
//

import Foundation

//{"T":1002,"r":0.160861328,"p":0.066984721,"y":-148.780777,"ax":-0.068359375,"ay":-1.19140625,"az":982.1582031,"gx":0.321250021,"gy":-0.207499981,"gz":-0.25,"mx":75,"my":-45,"mz":0,"temp":0}

struct RoverCommand: Codable {
    let T: Int
}

struct RoverInfoResponse: Decodable {
    let T: Int
    let L: Int   // left
    let R: Int   // right
    let r: Double // roll
    let p: Double // pitch
    let y: Double // yaw
    let v: Double // voltage
//    enum CodingKeys: String, CodingKey {
//        case name = "name"
//        case age = "ageYears"
//    }
}

struct RoverIMUResponse: Codable {
    var T: Int
    var r: Double
    var p: Double
    var y: Double
    var ax: Double
    var ay: Double
    var az: Double
    var gx: Double
    var gy: Double
    var gz: Double
    var mx: Int
    var my: Int
    var mz: Int
    var temp: Int
}

class Rover
{
    static let shared = Rover()
    
    let infoCommand = RoverCommand(T: 130)
    let imuCommand = RoverCommand(T: 126)
    
    private init() {
        //url = URL(string: "https://192.168.4.1")
    }
    
    //var url: URL?
    
//    func connect() -> Bool {
//        url = URL(string: "https://192.168.4.1") ?? nil
//        if url == nil {
//            return false
//        }
//       return true
//    }
    
    func postInfoCommand() async throws -> RoverInfoResponse? {
        guard let url = URL(string: "http://192.168.4.1/js") else {
            print("Invalid URL")
            return nil
        }
        var request = URLRequest(url: url, timeoutInterval: 10)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try! JSONEncoder().encode(infoCommand)
        let (data, response) = try await URLSession.shared.data(for: request)
        //print("HTTPURLResponse:", response)
        //print("The response body is:", String(decoding: data, as: UTF8.self))
        return try JSONDecoder().decode(RoverInfoResponse.self, from: data)
    }
    
    func postIMUCommand() async throws -> RoverIMUResponse? {
        guard let url = URL(string: "http://192.168.4.1/js") else {
            print("Invalid URL")
            return nil
        }
        var request = URLRequest(url: url, timeoutInterval: 10)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try! JSONEncoder().encode(imuCommand)
        let (data, response) = try await URLSession.shared.data(for: request)
        //print("HTTPURLResponse:", response)
        //print("The response body is:", String(decoding: data, as: UTF8.self))
        return try JSONDecoder().decode(RoverIMUResponse.self, from: data)
    }
    
}
