//
//  ViewController.m
//  Sensores
//
//  Created by XCODE on 30/06/17.
//  Copyright © 2017 XCODE. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    motionManager = [CMMotionManager new];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mask - CoreMotion

-(void)startDeviceMotion:(double)interval{
    if(motionManager.isDeviceMotionAvailable){
        motionManager.deviceMotionUpdateInterval = interval;
        [motionManager startDeviceMotionUpdates];
        
        timer = [NSTimer scheduledTimerWithTimeInterval:interval repeats:YES block:^(NSTimer * timer){
            CMDeviceMotion * motionData = motionManager.deviceMotion;
        }];
    }
}

@end
