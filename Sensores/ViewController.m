//
//  ViewController.m
//  Sensores
//
//  Created by XCODE on 30/06/17.
//  Copyright © 2017 XCODE. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *rotationX;
@property (weak, nonatomic) IBOutlet UILabel *rotationY;
@property (weak, nonatomic) IBOutlet UILabel *rotationZ;
@property (weak, nonatomic) IBOutlet UILabel *attitudePitch;
@property (weak, nonatomic) IBOutlet UILabel *attitudeYaw;
@property (weak, nonatomic) IBOutlet UILabel *attitudeRoll;
@property (weak, nonatomic) IBOutlet UILabel *accelerationX;
@property (weak, nonatomic) IBOutlet UILabel *accelerationY;
@property (weak, nonatomic) IBOutlet UILabel *accelerationZ;

@property (weak, nonatomic) IBOutlet UITextField *rotationXfield;
@property (weak, nonatomic) IBOutlet UITextField *rotationYfield;
@property (weak, nonatomic) IBOutlet UITextField *rotationZfield;
@property (weak, nonatomic) IBOutlet UITextField *attitudePitchField;
@property (weak, nonatomic) IBOutlet UITextField *attitudeYawField;
@property (weak, nonatomic) IBOutlet UITextField *attitudeRollField;
@property (weak, nonatomic) IBOutlet UITextField *accelerationXfield;
@property (weak, nonatomic) IBOutlet UITextField *accelerationYfield;
@property (weak, nonatomic) IBOutlet UITextField *acceletarionZfield;



@end

@implementation ViewController{
    double x;
    double y;
    double z;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    motionManager = [CMMotionManager new];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [self startDeviceMotion:2.0];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
    if(motionManager.isDeviceMotionActive){
        [timer invalidate];
        [motionManager stopDeviceMotionUpdates];
    }
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
            x = motionData.rotationRate.x;
            
            self.rotationXfield.text = [NSString stringWithFormat:@"%.2f", motionData.rotationRate.x];
            self.rotationYfield.text = [NSString stringWithFormat:@"%.2f", motionData.rotationRate.y];
            self.rotationZfield.text = [NSString stringWithFormat:@"%.2f", motionData.rotationRate.z];
            
            self.attitudeYawField.text = [NSString stringWithFormat:@"%.2f", motionData.attitude.yaw];
            self.attitudeRollField.text = [NSString stringWithFormat:@"%.2f", motionData.attitude.roll];
            self.attitudePitchField.text = [NSString stringWithFormat:@"%.2f", motionData.attitude.pitch];
            
            self.accelerationYfield.text = [NSString stringWithFormat:@"%.2f", motionData.userAcceleration.y];
            self.accelerationXfield.text = [NSString stringWithFormat:@"%.2f", motionData.userAcceleration.x];
            self.acceletarionZfield.text = [NSString stringWithFormat:@"%.2f", motionData.userAcceleration.z];
            
            
            
        }];
    }
}

@end
