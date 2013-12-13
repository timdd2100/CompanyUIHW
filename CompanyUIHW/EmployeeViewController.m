//
//  EmployeeViewController.m
//  CompanyUIHW
//
//  Created by timkao on 13/12/11.
//  Copyright (c) 2013年 skl. All rights reserved.
//

#import "EmployeeViewController.h"
#import "Company.h"
#import "LDetailViewController.h"
#import "Leader.h"
#import "Member.h"
#import "EMDetailViewController.h"

@interface EmployeeViewController ()
{
    NSMutableArray *leaderArray ;
    NSMutableArray *memberArray;
    NSMutableArray *tableArray;
    Employee *SendEm;
    EMDetailViewController *EMD;
}
@end

@implementation EmployeeViewController
@synthesize leaders;
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
    
    //init
    SendEm = [Employee new];
    //將員工資料分裝在不同array 已便呈現群組
    leaderArray = [NSMutableArray new];
    memberArray = [NSMutableArray new];
    tableArray = [NSMutableArray new];
    
    leaders = [NSMutableArray new];
    
    
    //
    self.LCompanyName.text = [self.Lreceivedict objectForKey:@"CompanyName"];
    
    //set navigation
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(CompanyAdd)];
    
    self.navigationItem.rightBarButtonItem = addButton;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma -mark table 區
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //array的分類 將員工資料分裝在不同array 已便呈現群組
    
    [leaderArray removeAllObjects];//先初始
    [memberArray removeAllObjects];
    [tableArray removeAllObjects];
    
    id emp = [[self.Lreceivedict objectForKey:@"Company"]employee];
    
    for (int i = 0; i < [emp count]; i++) {
        id temp = [[emp allValues] objectAtIndex:i];
        if([temp isKindOfClass:[Leader class]])
        {
            [leaderArray addObject:temp];
        }
        else
        {
            [memberArray addObject:temp];
        }
    }
    
    [tableArray addObject:leaderArray];
    [tableArray addObject:memberArray];
    
    
    
    return 2;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *sectionName;
    switch (section) {
        case 0:
            sectionName = @"Leader";
            break;
            
        case 1 :
            sectionName = @"Member";
            break;
        default:
            sectionName = @"";
            break;
    }
    return sectionName;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (section == 0) {
        return [[self.Lreceivedict objectForKey:@"Company"]getLeaderCount];
    }
    else
    {
        return [[self.Lreceivedict objectForKey:@"Company"]getMemberCount];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"LeaderCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    //根據員工種類 作歸類
    NSString *employee_name =[[[tableArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]getFullName];
    cell.textLabel.text = employee_name;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SendEm = [[tableArray objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
    
    EMD = [self.storyboard instantiateViewControllerWithIdentifier:@"EMDetailViewController"];
    //EMD.ReciveEmployee = [[Employee alloc] init];
    EMD.ReciveEmployee = SendEm;
    //EMD.MemberArray = [NSMutableArray new];
    EMD.MemberArray = memberArray;
    
    [self presentViewController:EMD animated:YES completion:Nil];
    
    
//    UIAlertView *description = [[UIAlertView alloc]initWithTitle:@"自我介紹" message:[em getDescription] delegate:Nil  cancelButtonTitle:@"確認" otherButtonTitles: nil];
//    description.alertViewStyle = UIAlertViewStyleDefault;
//    
//    [description show];
}

#pragma -mark functions
-(void) CompanyAdd
{
    //開啓細節頁面
    LDetailViewController *LdetailView = [self.storyboard instantiateViewControllerWithIdentifier:@"LDetailViewController"];
    LdetailView.LDreceivedict = self.Lreceivedict;
    
    //設定父親
    LdetailView.parentLeader = self;
    
    [self presentViewController:LdetailView animated:YES completion:^{
    }];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"EMDescription"])
    {
        EMD = (EMDetailViewController *)segue.destinationViewController;
    }
}



@end
