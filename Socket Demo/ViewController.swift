//
//  ViewController.swift
//  Socket Demo
//
//  Created by Kiran Padhiyar on 14/06/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let socketManager = SocketIOManager.sharedInstance
        socketManager.establishConnection()
    }


}

