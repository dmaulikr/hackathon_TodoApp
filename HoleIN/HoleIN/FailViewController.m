//
//  FailViewController.m
//  HoleIN
//
//  Created by HanYoungsoo on 2017. 3. 8..
//  Copyright © 2017년 YoungsooHan. All rights reserved.
//

#import "FailViewController.h"
#import "FailTableViewCell.h"

@interface FailViewController ()
<UITableViewDelegate,UITableViewDataSource>

@property NSMutableArray *challengeArr;
@property NSMutableArray *ddayArr;
@property NSMutableArray *imgs;

@end

@implementation FailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   self.challengeArr = [[NSMutableArray alloc] initWithObjects:@"다이어트 5키로 감량",@"마라톤 참가하기",@"토익 890점",@"접영배우기",@"국토대장정",@"앙코르와트 가 보기", nil];


//    self.ddayArr = @[@"D-0",@"D-0",@"D-0"];
    self.imgs = [[NSMutableArray alloc] initWithObjects:@"fail1",@"fail2",@"fail3",@"fail4",@"fail5",@"fail6", nil];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.challengeArr.count;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    FailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FailTableViewCell"];
    
    
    if(cell == nil){
        cell = [[FailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"FailTableViewCell"];
        
    }
    cell.FailCellImg.image = [UIImage imageNamed:[self.imgs objectAtIndex:indexPath.row]];
    
    cell.chText.text = [self.challengeArr objectAtIndex:indexPath.row];


    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}
- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewRowAction *retry = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"Retry" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath){
        UIAlertController *retryAlert = [UIAlertController alertControllerWithTitle:@"재도전" message:@"D-Day 날짜를 설정해주세요" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *yes = [UIAlertAction actionWithTitle:@"확인" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self.challengeArr removeObjectAtIndex:indexPath.row];
            [self.imgs removeObjectAtIndex:indexPath.row];
            [self.tableView reloadData];
            NSLog(@"11zzz%@", retryAlert.textFields[0].text);
        }];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"취소" style:UIAlertActionStyleCancel handler:nil];
        [retryAlert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            textField.placeholder = @"D-Day날짜를 입력하세요!";
            textField.textColor = [UIColor blueColor];
            textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        }];
        [retryAlert addAction:yes];
        [retryAlert addAction:cancel];
        [self presentViewController:retryAlert animated:YES completion:nil];
    }];
    [retry setBackgroundColor:[UIColor blueColor]];
    
    UITableViewRowAction *rowdelete = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"Del" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath){
        UIAlertController *challegeAlert = [UIAlertController alertControllerWithTitle:@"삭제" message:@"삭제할까요?" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *yes = [UIAlertAction actionWithTitle:@"확인" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self.challengeArr removeObjectAtIndex:indexPath.row];
            [self.imgs removeObjectAtIndex:indexPath.row];
            [self.tableView reloadData];
        }];
        UIAlertAction *no = [UIAlertAction actionWithTitle:@"아니오" style:UIAlertActionStyleCancel handler:nil];
        [challegeAlert addAction:yes];
        [challegeAlert addAction:no];
        [self presentViewController:challegeAlert animated:YES completion:nil];
        
    }];
    return @[rowdelete,retry];
}
@end
