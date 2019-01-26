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

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickConfigSDK(_ sender: Any) {
        
        Bonnus.instance.initWithCredentials(partnerID: "d6SfD0X7WSnG247v7INpHPq7vxHJBvai",
                                            token: "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImtpZCI6Ik1qUTFNVVJEUVVWRlEwUXpRekl3TXpNek9EVkROa1ZHUkRKRk16Y3lSREU1UWtNelJrTkNRUSJ9.eyJpc3MiOiJodHRwczovL3ZhbG1hbnMuYXV0aDAuY29tLyIsInN1YiI6InhTYzdraFBPdE8xMFMzUG0xMlFTRHM4R3JvOVNuZWJnQGNsaWVudHMiLCJhdWQiOiJodHRwOi8vYm9ubnVzYXBpLmF6dXJld2Vic2l0ZXMubmV0L2FwaSIsImlhdCI6MTU0MjA4MDQ2MSwiZXhwIjoxNTU3NjMyNDYxLCJhenAiOiJ4U2M3a2hQT3RPMTBTM1BtMTJRU0RzOEdybzlTbmViZyIsInNjb3BlIjoib3BlbmlkOnByb2ZpbGU6ZW1haWwgb3BlbmlkIiwiZ3R5IjoiY2xpZW50LWNyZWRlbnRpYWxzIn0.lI34dkc99ruNoDxwN6nRbeyyjW5lxJWcsWLWO8D1nTHPhB_dNb0Af5dfknwNJoaxgR059IQ8XNLCku357lpiXDb-UVmdcoBegKTFp54N0PSVs5T1su1Rd5fbnrBTQX_T298zvnPph6-hzdCqPP_QDE_pyzEtNbhTXRx3FQQj9pRu7w7h-t-JiH_d9444075CF3mUngnIXW091oMZ9XSk6xeWAQRI5-AYuYzV3vsCos0mzPEJdXgtYAsNK3qcX-iwl8WxXlw-rWpK7DAZBdd03_Xqmhe8aRa5G7D1XjGzbUYowMhau2Yur_ZHH73RY-slQ-NGDSDgYbrrwx00wKZz4g", sdkId: "37i8rehebptnrmwxy0mfgmc2hyol4yjogu",userID: "testios")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(3000)) {
            self.checkStatusForSDK()
        }
       
    }

    @IBAction func deleteAllInfo(_ sender: Any) {
        Bonnus.instance.resetSDK()
        checkStatusForSDK()
    }

    @IBAction func ClickButtonOne(_ sender: Any) {
        Bonnus.instance.tryToRedeemPrice(momento: "Pago de servicios")
    }

    @IBAction func ClickButtonTwo(_ sender: Any) {
         Bonnus.instance.tryToRedeemPrice(momento: "Login")
    }

    @IBAction func ClickButtonThree(_ sender: Any) {
        Bonnus.instance.tryToRedeemPrice(momento: "Cuenta digital")
    }

    @IBAction func ClickButtonFour(_ sender: Any) {
        Bonnus.instance.tryToRedeemPrice(momento: "Saldos")
    }

    @IBAction func ClickButtonFive(_ sender: Any) {
        Bonnus.instance.tryToRedeemPrice(momento: "Transferencia")
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
