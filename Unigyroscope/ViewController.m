//
//  ViewController.m
//  Unigyroscope
//
//  Created by IanChen on 2016/12/9.
//  Copyright © 2016年 IanChen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    float accX,accY,accZ,gyX,gyY,gyZ,dmX,dmY,dmZ;
    NSTimer *Utimer;
}
@end

@implementation ViewController
#if __IPHONE_OS_VERSION_MAX_ALLOWED < 90000
- (NSUInteger)supportedInterfaceOrientations
#else
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
#endif
{
    return UIInterfaceOrientationMaskPortrait;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self startAccelerometer];
    // Do any additional setup after loading the view, typically from a nib.
    Utimer = [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(updateUI) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) startAccelerometer{
    ACC = [[CMMotionManager alloc] init];
    NSOperationQueue *ACq = [[NSOperationQueue alloc] init];
    NSOperationQueue *GYq = [[NSOperationQueue alloc] init];
    NSOperationQueue *DMq = [[NSOperationQueue alloc] init];
    [ACC startAccelerometerUpdatesToQueue:ACq withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
        accX = accelerometerData.acceleration.x;
        accY = accelerometerData.acceleration.y;
        accZ = accelerometerData.acceleration.z;
        
    }];
    [ACC startGyroUpdatesToQueue:GYq withHandler:^(CMGyroData *gyroData, NSError *error) {
        gyX = gyroData.rotationRate.x;
        gyY = gyroData.rotationRate.y;
        gyZ = gyroData.rotationRate.z;
    }];
    [ACC startDeviceMotionUpdatesToQueue:DMq withHandler:^(CMDeviceMotion *motion, NSError *error) {
        dmX = motion.attitude.pitch;
        dmY = motion.attitude.roll;
        dmZ = motion.attitude.yaw;
    }];
}
- (void) updateUI{

    _acLabelX.text =[[NSString alloc] initWithFormat: @"%.2f",accX ];
    [_acLabelY setText:[[NSString alloc] initWithFormat: @"%.2f",accY ]];
    [_acLabelZ setText:[[NSString alloc] initWithFormat: @"%.2f",accZ ]];
    [_gyLabelX setText:[[NSString alloc] initWithFormat: @"%.2f",gyX ]];
    [_gyLabelY setText:[[NSString alloc] initWithFormat: @"%.2f",gyY ]];
    [_gyLabelZ setText:[[NSString alloc] initWithFormat: @"%.2f",gyZ ]];
    [_dmLabelX setText:[[NSString alloc] initWithFormat: @"%.2f",dmX ]];
    [_dmLabelY setText:[[NSString alloc] initWithFormat: @"%.2f",dmY ]];
    [_dmLabelZ setText:[[NSString alloc] initWithFormat: @"%.2f",dmZ ]];
}
@end
