//
//  ChallengeViewController.m
//  HoleIN
//
//  Created by HanYoungsoo on 2017. 3. 8..
//  Copyright © 2017년 YoungsooHan. All rights reserved.
//

#import "ChallengeViewController.h"
#import "ChallengeTableViewCell.h"

@interface ChallengeViewController ()
<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ChallengeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ChallengeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ChallengeTableViewCell"];
    
    
    if(cell == nil){
        cell = [[ChallengeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ChallengeTableViewCell"];
        
    }
    cell.cellImg.image = [UIImage imageNamed:@"background"];
    
    
    return cell;
}





@end
