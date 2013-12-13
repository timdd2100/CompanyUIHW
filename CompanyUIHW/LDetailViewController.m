//
//  LDetailViewController.m
//  CompanyUIHW
//
//  Created by timkao on 13/12/6.
//  Copyright (c) 2013年 skl. All rights reserved.
//

#import "LDetailViewController.h"
#import "Leader.h"
#import "Member.h"

@interface LDetailViewController ()
{
    Company *company;
}
@end

@implementation LDetailViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    // set
    [self.LDSex setSelectedSegmentIndex:1];
    [self.LDType setSelectedSegmentIndex:1];
    //
    //加入手勢 判別 鍵盤消失時機
    UITapGestureRecognizer *tapscroll = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapped)];
    tapscroll.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapscroll];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)LdetailCancel:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}
- (IBAction)LdetailSave:(UIBarButtonItem *)sender {
    EmployeeViewController *leaderview =  self.parentLeader;
    
    //設定 公司
    company = [self.LDreceivedict objectForKey:@"Company"];
    
    NSString *sex;
    switch (self.LDSex.selectedSegmentIndex) {
        case 0:
            sex = [NSString stringWithFormat:@"Male"];
            break;
        case 1:
            sex = [NSString stringWithFormat:@"FeMale"];
            break;
        default:
            break;
    }
    
    NSString *type;
    switch (self.LDType.selectedSegmentIndex) {
        case 0:
            type = [NSString stringWithFormat:@"Leader"];
            break;
        case 1:
            type = [NSString stringWithFormat:@"Member"];
            break;
        default:
            break;
    }
    
    
    
    //建立員工
    if([type isEqualToString:@"Leader"])
    {
        Leader *leader = [[Leader alloc]initWthFirstName:self.LDFirstName.text LastName:self.LDLastName.text Sex:sex Age:[self.LDAge.text intValue] Salary:[self.LDSalary.text intValue ]];
        
        //將建立的員工加入公司
        [company addEmployee:leader];
    }
    else if ([type isEqualToString:@"Member"])
    {
        Member *member = [[Member alloc]initWthFirstName:self.LDFirstName.text LastName:self.LDLastName.text Sex:sex Age:[self.LDAge.text intValue] Salary:[self.LDSalary.text intValue]];
        
        //將建立的員工加入公司
        [company addEmployee:member];
    }
    
    
    [leaderview.LtableView reloadData];
    
    
    [self dismissViewControllerAnimated:YES completion:^{
        //換完頁後
        //塞回leader
        
    }];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField endEditing:YES];
    return NO;
}

-(void)tapped
{
    [self.view endEditing:YES];
}
@end
