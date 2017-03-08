//
//  ViewController.m
//  HoleIN
//
//  Created by HanYoungsoo on 2017. 3. 8..
//  Copyright © 2017년 YoungsooHan. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UIView *customNaviBar;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property BOOL naviSwitch;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapGes;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.naviSwitch = YES;
    [self.scrollView setContentOffset:CGPointMake(0, -self.customNaviBar.frame.size.height)];
    [self.view addGestureRecognizer:_tapGes];
    
}

- (IBAction)touched:(UITapGestureRecognizer *)sender {
    
    if (self.naviSwitch == YES) {
        NSLog(@"1");
        [self.scrollView setContentOffset:CGPointMake(0,0) animated:YES];
        
        self.naviSwitch = NO;
        
    }
    else if (self.naviSwitch == NO) {
        NSLog(@"1");
        [self.scrollView setContentOffset:CGPointMake(0,-self.customNaviBar.frame.size.height) animated:YES];
        self.naviSwitch = YES;
        
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
