//
//  ModalViewController.swift
//  Testing
//
//  Created by Emmanuel Casanas Cruz on 6/20/19.
//  Copyright © 2019 Emmanuel Cruz. All rights reserved.
//

import UIKit
import BonnusSDK

class ModalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        Bonnus.instance.isModal = true
        Bonnus.instance.modalViewController = self
    }
    
    @objc func buttonAction(sender: UIButton!) {
       Bonnus.instance.tryToRedeemPrice(momento: "Momento2")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        Bonnus.instance.tryToRedeemPrice(momento: "Momento2")
    }
    
    func addButton () {
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        button.backgroundColor = .green
        button.setTitle("Test Button", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        self.view.addSubview(button)
    }


}
