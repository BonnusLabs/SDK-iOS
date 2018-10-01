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

        Bonnus.instance.initWithCredentials(partnerID: "a3B7CdNShdCO4KzYrdZYtWwEEfr17J99",
                                            token: "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImtpZCI6Ik1qUTFNVVJEUVVWRlEwUXpRekl3TXpNek9EVkROa1ZHUkRKRk16Y3lSREU1UWtNelJrTkNRUSJ9.eyJpc3MiOiJodHRwczovL3ZhbG1hbnMuYXV0aDAuY29tLyIsInN1YiI6ImEzQjdDZE5TaGRDTzRLellyZFpZdFd3RUVmcjE3Sjk5QGNsaWVudHMiLCJhdWQiOiJodHRwOi8vYm9ubnVzYXBpLmF6dXJld2Vic2l0ZXMubmV0L2FwaSIsImlhdCI6MTUzNDM1OTA2NywiZXhwIjoxNTQ5OTExMDY3LCJhenAiOiJhM0I3Q2ROU2hkQ080S3pZcmRaWXRXd0VFZnIxN0o5OSIsImd0eSI6ImNsaWVudC1jcmVkZW50aWFscyJ9.TERMlIrXlY5d7alEmsnoInZZEhu80OTSs_ZUQEhc_4YoK3zA5SEFOWjOwNa-sbsZLGkvd7KPd2QMq98Mm3eMumagDOeKZxs3f5nep4NbnlDc0A1VoQtJ5yUZkpbSau1pQLkeXQj1mlU3p_T6aTo0izLSu5V41T7h6hjm94gGkgSRJcf4AY6fx5wLOXuo5Io7Wnp7BfmEQ_5GDqDiVlSVteMfLDkMjNURelOeIf2DxRg8nWXy-YmSgPVhkH0sKak1Tze02AJuda6FhpxyNECg8soigCeW-lPpOd7_YKrwPB-mQ8_AZqdWceuzYlWZJhwXXroQK2VdwyPKJUS-Qin9sw", sdkId: "cec4c4ab490c4ef4a6d0d7c435ac9515",userID: "1234567890-iOS")
        
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
