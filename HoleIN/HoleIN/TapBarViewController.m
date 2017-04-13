//
//  TapBarViewController.m
//  HoleIN
//
//  Created by HanYoungsoo on 2017. 3. 9..
//  Copyright © 2017년 YoungsooHan. All rights reserved.
//

#import "TapBarViewController.h"
#import "MainViewController.h"
#import "ChallengeViewController.h"
#import "SuccessViewController.h"
#import "FailViewController.h"
#import "PlusViewController.h"

@interface TapBarViewController ()
@property (weak, nonatomic) IBOutlet UIView *naviBar;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *pan;
@property ChallengeViewController * chaellengeVC;
@property MainViewController *mainVC;
@property SuccessViewController *successVS;
@property FailViewController *failVC;
@property PlusViewController *plusVC;
@property UIViewController *currView;
@property const CGFloat logoLBx;
@property const CGFloat logoLBy;
@end

@implementation TapBarViewController
// MARK: - App LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view layoutIfNeeded];
    
    [self.homeBtn setSelected:YES];
    [self.scrollView setContentOffset:CGPointMake(0, -self.naviBar.frame.size.height)];
    self.mainVC = [self.storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
    self.chaellengeVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ChallengeViewController"];
    self.successVS = [self.storyboard instantiateViewControllerWithIdentifier:@"SuccessViewController"];
    self.failVC = [self.storyboard instantiateViewControllerWithIdentifier:@"FailViewController"];
//    self.plusVC = [self.storyboard instantiateViewControllerWithIdentifier:@"PlusViewController"];
    NSLog(@"%lf", self.mainVC.titleLB.bounds.origin.y);
    [self addChildViewController:self.mainVC];
    [self addChildViewController:self.chaellengeVC];
    [self.scrollView addSubview:self.mainVC.view];
    self.currView = self.mainVC;
    
    self.mainVC.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - self.naviBar.frame.size.height);
    self.chaellengeVC.view.frame =  CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - self.naviBar.frame.size.height);
    self.successVS.view.frame =  CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - self.naviBar.frame.size.height);
    self.failVC.view.frame =  CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - self.naviBar.frame.size.height);
    self.plusVC.view.frame =  CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - self.naviBar.frame.size.height);
    [self.view layoutIfNeeded];
    
    self.logoLBx = self.mainVC.titleLB.frame.origin.x;
    self.logoLBy = self.mainVC.titleLB.frame.origin.y;
    NSLog(@"0 %f %f", _logoLBx , _logoLBy);
    
    [self.view addGestureRecognizer:_pan];
    
    
}

// MARK: - Gesture event
- (IBAction)paned:(UIPanGestureRecognizer *)sender {
    
    if ((sender.state == UIGestureRecognizerStateChanged) ||
        (sender.state == UIGestureRecognizerStateEnded))
    {
        CGPoint velocity = [sender velocityInView:self.view];
        
        if (velocity.y >0)   // panning down
        {
            NSLog(@"1 %f %f", _logoLBx , _logoLBy);
            [self.scrollView setContentOffset:CGPointMake(0, -self.naviBar.frame.size.height) animated:YES];
            [UIView animateWithDuration:0.5 animations:^{
                [self.mainVC.titleLB setFrame:CGRectMake(self.logoLBx, self.logoLBy, self.mainVC.titleLB.frame.size.width, self.mainVC.titleLB.frame.size.height)];}];
            
        }else                // panning up
        {
            NSLog(@"2 %f %f", _logoLBx , _logoLBy);
            [self.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
            NSLog(@"UP");
            [UIView animateWithDuration:0.5 animations:^{
                [self.mainVC.titleLB setFrame:CGRectMake(self.logoLBx, self.mainVC.titleLB.bounds.origin.y-10 + self.naviBar.frame.size.height, self.mainVC.titleLB.frame.size.width, self.mainVC.titleLB.frame.size.height)];}];
            
            }
        }
    }

// MARK: - TapBar Button
- (IBAction)onChallengeBtn:(UIButton *)sender {
    [self.scrollView addSubview:self.chaellengeVC.view];
    [self.pan setEnabled:NO];
    [self.currView.view removeFromSuperview];
    self.currView = self.chaellengeVC;
    [sender setSelected:!sender.selected];
    [self.homeBtn setSelected:NO];
    [self.successBtn setSelected:NO];
    [self.failBtn setSelected:NO];
}
- (IBAction)onMainBtn:(UIButton *)sender {
    [self.pan setEnabled:YES];
    [self.scrollView addSubview:self.mainVC.view];
    [self.currView.view removeFromSuperview];
    self.currView = self.mainVC;
    [sender setSelected:!sender.selected];
    [self.challBtn setSelected:NO];
    [self.successBtn setSelected:NO];
    [self.failBtn setSelected:NO];
}
- (IBAction)onSuccessBtn:(UIButton *)sender {
    [self.pan setEnabled:NO];
    [self.scrollView addSubview:self.successVS.view];
    [self.currView.view removeFromSuperview];
    self.currView = self.successVS;
    [sender setSelected:!sender.selected];
    [self.challBtn setSelected:NO];
    [self.homeBtn setSelected:NO];
    [self.failBtn setSelected:NO];

}
- (IBAction)onFailBtn:(UIButton *)sender {
    [self.pan setEnabled:NO];
    [self.scrollView setScrollEnabled:NO];
    [self.scrollView addSubview:self.failVC.view];
    [self.currView.view removeFromSuperview];
    self.currView = self.failVC;
    [sender setSelected:!sender.selected];
    [self.challBtn setSelected:NO];
    [self.homeBtn setSelected:NO];
    [self.successBtn setSelected:NO];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
