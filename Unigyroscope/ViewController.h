//
//  ViewController.h
//  Unigyroscope
//
//  Created by IanChen on 2016/12/9.
//  Copyright © 2016年 IanChen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import<CoreMotion/CoreMotion.h>
@interface ViewController : UIViewController
{
    CMMotionManager *ACC;
}
@property (weak, nonatomic) IBOutlet UILabel *acLabelX;
@property (weak, nonatomic) IBOutlet UILabel *acLabelY;
@property (weak, nonatomic) IBOutlet UILabel *acLabelZ;
@property (weak, nonatomic) IBOutlet UILabel *gyLabelX;
@property (weak, nonatomic) IBOutlet UILabel *gyLabelY;
@property (weak, nonatomic) IBOutlet UILabel *gyLabelZ;
@property (weak, nonatomic) IBOutlet UILabel *dmLabelX;
@property (weak, nonatomic) IBOutlet UILabel *dmLabelY;
@property (weak, nonatomic) IBOutlet UILabel *dmLabelZ;

@end

