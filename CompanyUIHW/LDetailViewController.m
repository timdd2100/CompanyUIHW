//
//  LDetailViewController.m
//  CompanyUIHW
//
//  Created by timkao on 13/12/6.
//  Copyright (c) 2013年 skl. All rights reserved.
//

#import "LDetailViewController.h"
#import "LeaderViewController.h"
@interface LDetailViewController ()

@end

@implementation LDetailViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    // set
 
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
    LeaderViewController *leaderview = [self.storyboard instantiateViewControllerWithIdentifier:@"LeaderViewController"];
    //set
    leaderview.LDreceivedict = [NSMutableDictionary new];
    
    //set trans value
    [leaderview.LDreceivedict setObject:@"123" forKey:@"FirstName"];
    [leaderview.LDreceivedict setObject:@"123" forKey:@"LastName"];
    [leaderview.LDreceivedict setObject:@"123" forKey:@"age"];
    [leaderview.LDreceivedict setObject:@"123" forKey:@"Salary"];
    [leaderview.LDreceivedict setObject:@"123" forKey:@"Sex"];
    [leaderview.LDreceivedict setObject:@"123" forKey:@"skill"];
    [leaderview.LDreceivedict setObject:@"123" forKey:@"Description"];

    
    
}


-(void)tapped
{
    [self.view endEditing:YES];
}
@end
