//
//  AppDelegate.h
//  Demo-Bonnus-ObjectiveC
//
//  Created by Emmanuel Casañas Cruz on 1/2/19.
//  Copyright © 2019 Bonnus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BonnusSDK/BonnusSDK-Swift.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) Bonnus *bonnusInstance;

@end

