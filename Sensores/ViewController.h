//
//  ViewController.h
//  Sensores
//
//  Created by XCODE on 30/06/17.
//  Copyright © 2017 XCODE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreMotion/CoreMotion.h"

@interface ViewController : UIViewController
{
    CMMotionManager * motionManager;
    NSTimer * timer;
    CMPedometer * passos;
}


@end

