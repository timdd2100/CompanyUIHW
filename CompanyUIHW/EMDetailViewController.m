//
//  EMDetailViewController.m
//  CompanyUIHW
//
//  Created by timkao on 13/12/12.
//  Copyright (c) 2013年 skl. All rights reserved.
//

#import "EMDetailViewController.h"
#import "Member.h"
#import "Leader.h"
#import "AddViewController.h"

@interface EMDetailViewController ()

@end

@implementation EMDetailViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)EMDback:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)EMDdescription:(UIButton *)sender {
    
    UIAlertView *description = [[UIAlertView alloc]initWithTitle:@"自我介紹" message:[self.ReciveEmployee getDescription] delegate:Nil  cancelButtonTitle:@"確認" otherButtonTitles: nil];
    description.alertViewStyle = UIAlertViewStyleDefault;
    
    [description show];
    
}
- (IBAction)EMDAdj:(UIButton *)sender {
    if ([self.ReciveEmployee isKindOfClass:[Member class]]) {
        
        //委派給主管調薪
        Member *member = (Member *)self.ReciveEmployee;
        [member adjSalary];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"警告" message:@"非Member不能調薪" delegate:Nil  cancelButtonTitle:@"確認" otherButtonTitles: nil];
        alert.alertViewStyle = UIAlertViewStyleDefault;
        
        [alert show];
    }
    
}
- (IBAction)EMDaddEmployee:(UIButton *)sender {
    //傳送員工陣列
    if ([self.ReciveEmployee isKindOfClass:[Leader class]]) {
        
        AddViewController *memberAdd = [self.storyboard instantiateViewControllerWithIdentifier:@"AddViewController"];
        
        memberAdd.MemberArray = self.MemberArray;
        memberAdd.ReciveLeader = (Leader *)self.ReciveEmployee;
        [self presentViewController:memberAdd animated:YES completion:Nil];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"警告" message:@"非Leader不能加入員工" delegate:Nil  cancelButtonTitle:@"確認" otherButtonTitles: nil];
        alert.alertViewStyle = UIAlertViewStyleDefault;
        
        [alert show];
    }
}


@end
