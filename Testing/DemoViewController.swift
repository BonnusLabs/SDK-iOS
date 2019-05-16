//
//  DemoViewController.swift
//  BonnusSDK
//
//  Created by Emmanuel Casañas on 7/12/18.
//  Copyright © 2018 Emmanuel Casañas. All rights reserved.
//

import UIKit
import BonnusSDK


class DemoViewController: UIViewController {
    
    
    @IBOutlet weak var carrierLabel: UILabel!
    @IBOutlet weak var DEviceInfoLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    
    @IBOutlet var AllButtons: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkStatusForSDK()
        Bonnus.instance.setCuponDelegate(delegate: self)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickConfigSDK(_ sender: Any) {
        
        Bonnus.instance.initWithCredentials(partnerID: "BH9biBeZIWOf9T28lCiyNklRCsKiiEYG",
                                            token: "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImtpZCI6Ik1qUTFNVVJEUVVWRlEwUXpRekl3TXpNek9EVkROa1ZHUkRKRk16Y3lSREU1UWtNelJrTkNRUSJ9.eyJpc3MiOiJodHRwczovL3ZhbG1hbnMuYXV0aDAuY29tLyIsInN1YiI6IkJIOWJpQmVaSVdPZjlUMjhsQ2l5TmtsUkNzS2lpRVlHQGNsaWVudHMiLCJhdWQiOiJodHRwOi8vYm9ubnVzYXBpLmF6dXJld2Vic2l0ZXMubmV0L2FwaSIsImlhdCI6MTU0ODI1NzYyNywiZXhwIjoxNTYzODA5NjI3LCJhenAiOiJCSDliaUJlWklXT2Y5VDI4bENpeU5rbFJDc0tpaUVZRyIsImd0eSI6ImNsaWVudC1jcmVkZW50aWFscyJ9.r5aCq83GyqIdBGe9f09DbFmBu1ao6vM3ZNg35_fs6qm65kcsh3yPftrwPYM7zVxfTiBWBh3cgZeIOiy0wexnrR6_BV-_vU2xEopOW4Vb7DnWKlI8j-Owjqqhg8unT5mAewrn1QrHtJpG-hq4HOAJA2IB_OWxiBnQnvh83YOsMCPWhakyjviBkQhDnE81X023z20mpE_jYa0xbq2Yl6K6xbbYyXNRFTvh3taoND5IwA7oPI3lnH6AmC547qZjJSJZHM6bVyC1oAS-YnAT1aba6Fp0Ow609wy7oBdSA3aMrmZky53ShbP3hr22dloyLZZ-8tyl-0wJYIFWRk3bmgc6zQ", sdkId: "6a9cd43fb297418080d7da5a0b3afa2f",userID: "jobelle103")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(3000)) {
            self.checkStatusForSDK()
        }
       
    }

    @IBAction func deleteAllInfo(_ sender: Any) {
        Bonnus.instance.resetSDK()
        checkStatusForSDK()
    }

    @IBAction func ClickButtonOne(_ sender: Any) {
        Bonnus.instance.tryToRedeemPrice(momento: "Momento1")
    }

    @IBAction func ClickButtonTwo(_ sender: Any) {
         Bonnus.instance.tryToRedeemPrice(momento: "Momento2")
    }

    @IBAction func ClickButtonThree(_ sender: Any) {
        Bonnus.instance.tryToRedeemPrice(momento: "Momento3")
    }

    @IBAction func ClickButtonFour(_ sender: Any) {
        Bonnus.instance.tryToRedeemPrice(momento: "Momento4")
    }

    @IBAction func ClickButtonFive(_ sender: Any) {
        Bonnus.instance.tryToRedeemPrice(momento: "Momento5ddf")
    }

    @IBAction func ClickButtonRewards(_ sender: Any) {
        Bonnus.instance.showRewardsViewController(currentViewController: self)
    }

    func checkStatusForSDK(){
        let status =  UserSettings.isSDKStarted() ? "SDK Ready" : "SDK status: Need to config"
        self.statusLabel.text = status
        self.DEviceInfoLabel.text = Bonnus.instance.getDeviceInfo()
        self.carrierLabel.text = Bonnus.instance.getCarrierName()
        self.view.backgroundColor = UIColor(hexString:Bonnus.instance.getMainColor())
        let secondColor = UIColor(hexString: Bonnus.instance.getSecondColor())
        self.statusLabel.textColor = secondColor
        self.carrierLabel.textColor = secondColor
        self.DEviceInfoLabel.textColor = secondColor
        
        for button in AllButtons {
            button.setTitleColor(secondColor, for: .normal)
        }
        
    }
}

extension DemoViewController: cuponDelegate {
    func didClickRedeemButton() {
        print("Redeem Button Clicked")
    }
    func didClickSaveButton() {
        print("CloseButton Clicked")
    }
}
