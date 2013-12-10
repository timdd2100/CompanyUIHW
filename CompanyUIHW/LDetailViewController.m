//
//  LDetailViewController.m
//  CompanyUIHW
//
//  Created by timkao on 13/12/6.
//  Copyright (c) 2013年 skl. All rights reserved.
//

#import "LDetailViewController.h"
@interface LDetailViewController ()

@end

@implementation LDetailViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    // set
    [self.LDSex setSelectedSegmentIndex:1];
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
    LeaderViewController *leaderview =  self.parentLeader;
    
    
    
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
    //init
    self.LDsenddict = [NSMutableDictionary new];
    
    //set value
    [self.LDsenddict setObject:self.LDFirstName.text forKey:@"FirstName"];
    [self.LDsenddict setObject:self.LDLastName.text forKey:@"LastName"];
    [self.LDsenddict setObject:self.LDAge.text forKey:@"age"];
    [self.LDsenddict setObject:self.LDSalary.text forKey:@"Salary"];
    [self.LDsenddict setObject:sex forKey:@"Sex"];
    [self.LDsenddict setObject:self.LDskill.text forKey:@"skill"];
    [self.LDsenddict setObject:self.LDdescription.text forKey:@"Description"];
    
    [leaderview.leaders addObject:self.LDsenddict];
    [leaderview.LtableView reloadData];
    
    
    //    [self presentViewController: leaderview animated:(YES) completion:^{
    //        //換完頁後
    //
    //
    //        //塞回leader
    //        [leaderview.leaders addObject:self.LDsenddict];
    //        [leaderview.LtableView reloadData];
    //    }];
    
    
    
    
    [self dismissViewControllerAnimated:YES completion:^{
        //換完頁後
        //塞回leader
        
    }];
}



//-(void)viewWillDisappear:(BOOL)animated
//{
//    LeaderViewController *leaderview = [self.storyboard instantiateViewControllerWithIdentifier:@"LeaderViewController"];
//    [leaderview.LtableView reloadData];
//}

-(void)tapped
{
    [self.view endEditing:YES];
}
@end
