//
//  ViewController.m
//  #TD4W
//
//  Created by Avdeep Sahi on 5/5/14.
//  Copyright (c) 2014 Avdeep Sahi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self makeButton]; // create our button
    [self disclaimerButton];
}
-(void) disclaimerButton {
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button addTarget:self
               action:@selector(disclaimer:)
     forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Disclaimer" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.frame = CGRectMake(screenWidth-85, screenHeight-25, 80.0, 20.0);
    [self.view addSubview:button];
    [self intro]; // call coachmarks
    self.view.backgroundColor = [UIColor colorWithRed:69/255.0 green:101/255.0 blue:255/255.0 alpha:1.0];
	// Do any additional setup after loading the view, typically from a nib.
}



-(void) intro {
    NSArray *coachMarks = @[
                            @{
                                @"rect": [NSValue valueWithCGRect:(CGRect){{10.0f,215.0f},{300.0f,140.0f}}],
                                @"caption": @"Turn Down For What! Yeahhhhhhhh!"
                                },
                            ];
                            WSCoachMarksView *coachMarksView = [[WSCoachMarksView alloc] initWithFrame:self.view.bounds coachMarks:coachMarks];
                            [self.view addSubview:coachMarksView];
                            coachMarksView.animationDuration = 0.5f;
                            coachMarksView.enableContinueLabel = YES;
                            [coachMarksView start];
    
}
- (IBAction) disclaimer: (id)sender {
    NSArray *coachMarks = @[
                            @{
                                @"rect": [NSValue valueWithCGRect:(CGRect){{0,0},{0,0}}],
                                @"caption": @"#TD4W"
                                },
                            @{
                                @"rect": [NSValue valueWithCGRect:(CGRect){{10.0f,50.0f},{0,0}}],
                                @"caption": @"#TD4W is an unofficial iOS app dedicated to DJ Snake & Lil Jon's Turn Down For What."
                                },
                            @{
                                @"rect": [NSValue valueWithCGRect:(CGRect){{10.0f,310.0f},{0,0}}],
                                @"caption": @"I created this for comical purposes only and do not intend to infringe the copyrights of DJ Snake, Lil Jon, Columbia, Sony Music, or any related entities."
                                },
                           
                            ];
    WSCoachMarksView *coachMarksView = [[WSCoachMarksView alloc] initWithFrame:self.view.bounds coachMarks:coachMarks];
    [self.view addSubview:coachMarksView];
    coachMarksView.animationDuration = 0.5f;
    coachMarksView.enableContinueLabel = YES;
    [coachMarksView start];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIStatusBarStyle)preferredStatusBarStyle { // change status bar color
    return UIStatusBarStyleLightContent;
}
-(void) makeButton {
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    UIButton *playButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    playButton.frame = CGRectMake(screenWidth/7, screenHeight/3.2, 230.0, 230.0);
    playButton.backgroundColor = [UIColor clearColor];
    [playButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal ];
    UIImage *buttonImageNormal = [UIImage imageNamed:@"td4w.png"];
    UIImage *strechableButtonImageNormal = [buttonImageNormal stretchableImageWithLeftCapWidth:12 topCapHeight:0];
    [playButton setBackgroundImage:strechableButtonImageNormal forState:UIControlStateNormal];
    UIImage *buttonImagePressed = [UIImage imageNamed:@"td4w2.png"];
    UIImage *strechableButtonImagePressed = [buttonImagePressed stretchableImageWithLeftCapWidth:12 topCapHeight:0];
    [playButton setBackgroundImage:strechableButtonImagePressed forState:UIControlStateHighlighted];
    [playButton addTarget:self action:@selector(tdfw:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:playButton];
}

- (IBAction) tdfw: (id)sender {
    NSString *sound;
    if ((sound = [[NSBundle mainBundle] pathForResource:@"audio" ofType:@"mp3"]) != nil){
        
        NSURL *url = [[NSURL alloc] initFileURLWithPath:sound];
        _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:NULL];
        [_audioPlayer prepareToPlay];
        [_audioPlayer play];
    }
}

@end
