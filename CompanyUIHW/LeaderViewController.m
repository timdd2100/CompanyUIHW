//
//  LeaderViewController.m
//  CompanyUIHW
//
//  Created by timkao on 13/12/6.
//  Copyright (c) 2013年 skl. All rights reserved.
//

#import "LeaderViewController.h"
#import "LDetailViewController.h"
@interface LeaderViewController ()
@end

@implementation LeaderViewController
@synthesize LCompanyName,Lreceivedict,leaders,LtableView,LDreceivedict;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //init
    leaders = [NSMutableArray new];
    
    //set 接收到的資料
    LCompanyName.text = [Lreceivedict objectForKey:@"CompanyName"];
    
    //set navigation
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(CompanyAdd)];
    
    self.navigationItem.rightBarButtonItem = addButton;
}

//- (void) viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [leaders count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"LeaderCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    NSMutableDictionary *dict = [leaders objectAtIndex:indexPath.row];
    NSString *leader_name = [dict  objectForKey:@"FirstName"];
    cell.textLabel.text = leader_name;
    
    
    return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a story board-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 
 */

#pragma mark -functions
-(void) CompanyAdd
{
    //開啓細節頁面
    LDetailViewController *LdetailView = [self.storyboard instantiateViewControllerWithIdentifier:@"LDetailViewController"];
    
    //設定父親
    LdetailView.parentLeader = self;
    
    [self presentViewController:LdetailView animated:YES completion:^{
    }];
}




@end
