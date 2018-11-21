//
//  AppDelegate.h
//  Demo Objective
//
//  Created by Emmanuel Casañas Cruz on 11/11/18.
//  Copyright © 2018 Emmanuel Cruz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BonnusSDK/BonnusSDK-Swift.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) Bonnus *bonnusInstance;

@end

