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
    
    var isFirstTime: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        Bonnus.instance.isModal = true
        Bonnus.instance.modalViewController = self
        addButtonClose ()
    }
    
    @objc func buttonAction(sender: UIButton!) {
        Bonnus.instance.tryToRedeemPrice(momento: "Momento2")
    }
    @objc func closeAction(sender: UIButton!) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if isFirstTime {
            Bonnus.instance.tryToRedeemPrice(momento: "Momento2")
            isFirstTime = false
        }
    }
    
    func addButton () {
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        button.backgroundColor = .green
        button.setTitle("Test Button", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        self.view.addSubview(button)
    }
    
    func addButtonClose () {
        let button = UIButton(frame: CGRect(x: 0, y: 50, width: 100, height: 50))
        button.backgroundColor = .white
        button.setTitle("Close", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(closeAction), for: .touchUpInside)
        
        self.view.addSubview(button)
    }


}
