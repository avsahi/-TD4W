//
//  ViewController.h
//  #TD4W
//
//  Created by Avdeep Sahi on 5/5/14.
//  Copyright (c) 2014 Avdeep Sahi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "WSCoachMarksView.h"

@interface ViewController : UIViewController

@property(nonatomic, copy) AVAudioPlayer *audioPlayer; // has to be a property otherwise ARC overrides it for some shitty reason
-(void)makeButton;
-(UIStatusBarStyle)preferredStatusBarStyle;
@end
