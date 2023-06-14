//
//  SocketIOManager.swift
//  Socket Demo
//
//  Created by Kiran Padhiyar on 14/06/23.
//

import UIKit
import SocketIO

class SocketIOManager: NSObject {
    
    static let sharedInstance = SocketIOManager()
    //Need to define manager globally. If you define it in func scope then it will not connect to the socket.
    //.forceNew(true) --> Sometime we are facing ""Tried connecting on an already connected socket"" issue. So trying to connect with new connection.
    var manager = SocketManager(socketURL: URL(string: "http://localhost:8080")!, config: [.log(true), .compress, .forceNew(true)])
    var socket: SocketIOClient?
    
    override init() {
        super.init()
        self.socket = manager.defaultSocket
        socket?.on(clientEvent: .connect) {data, ack in
            print("socket connected \(data)")
        }
        socket?.onAny { event in
            print("socket.onAny")
            print(event)
        }
    }
    
    func establishConnection() {
        socket?.connect()
    }
    
    func closeConnection() {
        socket?.disconnect()
    }
}
