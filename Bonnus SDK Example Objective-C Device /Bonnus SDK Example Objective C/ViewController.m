//
//  ViewController.m
//  Demo Objective
//
//  Created by Emmanuel Casañas Cruz on 11/11/18.
//  Copyright © 2018 Emmanuel Cruz. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()
@end

@implementation ViewController


@synthesize bonnus;


- (void)viewDidLoad {
	[super viewDidLoad];
	bonnus = [(AppDelegate*)[[UIApplication sharedApplication] delegate] bonnusInstance];

    
}

- (void)setupSDK {
 
    [bonnus initWithCredentialsWithPartnerID:@"a3B7CdNShdCO4KzYrdZYtWwEEfr17J99" token:@"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImtpZCI6Ik1qUTFNVVJEUVVWRlEwUXpRekl3TXpNek9EVkROa1ZHUkRKRk16Y3lSREU1UWtNelJrTkNRUSJ9.eyJpc3MiOiJodHRwczovL3ZhbG1hbnMuYXV0aDAuY29tLyIsInN1YiI6InhTYzdraFBPdE8xMFMzUG0xMlFTRHM4R3JvOVNuZWJnQGNsaWVudHMiLCJhdWQiOiJodHRwOi8vYm9ubnVzYXBpLmF6dXJld2Vic2l0ZXMubmV0L2FwaSIsImlhdCI6MTU0MjA4MDQ2MSwiZXhwIjoxNTU3NjMyNDYxLCJhenAiOiJ4U2M3a2hQT3RPMTBTM1BtMTJRU0RzOEdybzlTbmViZyIsInNjb3BlIjoib3BlbmlkOnByb2ZpbGU6ZW1haWwgb3BlbmlkIiwiZ3R5IjoiY2xpZW50LWNyZWRlbnRpYWxzIn0.lI34dkc99ruNoDxwN6nRbeyyjW5lxJWcsWLWO8D1nTHPhB_dNb0Af5dfknwNJoaxgR059IQ8XNLCku357lpiXDb-UVmdcoBegKTFp54N0PSVs5T1su1Rd5fbnrBTQX_T298zvnPph6-hzdCqPP_QDE_pyzEtNbhTXRx3FQQj9pRu7w7h-t-JiH_d9444075CF3mUngnIXW091oMZ9XSk6xeWAQRI5-AYuYzV3vsCos0mzPEJdXgtYAsNK3qcX-iwl8WxXlw-rWpK7DAZBdd03_Xqmhe8aRa5G7D1XjGzbUYowMhau2Yur_ZHH73RY-slQ-NGDSDgYbrrwx00wKZz4g" sdkId:@"cec4c4ab490c4ef4a6d0d7c435ac9515" userID:@"12-ObjectiveC-iOS"];
}


- (IBAction)clcikConfig:(id)sender {
    [self setupSDK];

}

- (IBAction)clcikReedem:(id)sender {
    [bonnus tryToRedeemPriceWithMomento:@"Pago de servicios"];
    
}

- (IBAction)clcikReedemSecond:(id)sender {
	[bonnus tryToRedeemPriceWithMomento:@"Login"];
	
}

- (IBAction)clcikReedemThird:(id)sender {
	[bonnus tryToRedeemPriceWithMomento:@"Cuenta digital"];
	
}

- (IBAction)clcikReedemFourht:(id)sender {
	[bonnus tryToRedeemPriceWithMomento:@"Saldos"];
	
}

- (IBAction)clcikReedemFifth:(id)sender {
	[bonnus tryToRedeemPriceWithMomento:@"Transferencia"];
	
}
- (IBAction)clickShow:(id)sender {
    [bonnus showRewardsViewControllerWithCurrentViewController:self];
}
- (IBAction)clickReset:(id)sender {
	[bonnus resetSDK];
}

@end
