//
//  CompanyViewController.m
//  CompanyUIHW
//
//  Created by timkao on 13/12/6.
//  Copyright (c) 2013年 skl. All rights reserved.
//

#import "CompanyViewController.h"
#import "LeaderViewController.h"
@interface CompanyViewController ()
{
    LeaderViewController *LtableView;
    NSString *companyName;
}


@end

@implementation CompanyViewController
@synthesize Companys;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    //self.navigationItem.rightBarButtonItem = [UIBarButtonSystemItemAdd ];
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(CompanyAdd)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    //init dict
    Companys = [NSMutableDictionary new];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [Companys count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CompanyCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [Companys objectForKey:[NSString stringWithFormat:@"%li",(long)indexPath.row + 1]];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //準備好欲傳送的物件
    companyName = [NSString stringWithFormat:@"%@", [tableView cellForRowAtIndexPath:indexPath].textLabel.text];
    
    LtableView = [self.storyboard instantiateViewControllerWithIdentifier:@"LeaderViewController"];
    
    //設定好要傳送的資料
    LtableView.Lreceivedict = [NSMutableDictionary new];
    [LtableView.Lreceivedict setObject:self->companyName forKey:@"CompanyName"];
    
    [self.navigationController pushViewController:LtableView animated:YES];
    //[self presentViewController:LtableView animated:YES completion:^(void){}];
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */
// Override to support editing the table view.
//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        // Delete the row from the data source
//        [tableView deleteRowsAtIndexPaths:[self.CMtableView cell]  withRowAnimation:UITableViewRowAnimationFade];
//    }
//    else if (editingStyle == UITableViewCellEditingStyleInsert) {
//        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//    }
//}


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
 } */


#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    LeaderViewController  *leaderview = [segue destinationViewController];
    
    //設定好要傳送的資料
    leaderview.Lreceivedict = [NSMutableDictionary new];
    [leaderview.Lreceivedict setObject:self->companyName forKey:@"CompanyName"];
}


#pragma mark -functions
-(void) CompanyAdd
{
    UIAlertView *addAlert = [[UIAlertView alloc]initWithTitle:@"公司名稱" message:@"請輸入公司名稱" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"確認", nil];
    
    //dismiss
    addAlert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [addAlert dismissWithClickedButtonIndex:0 animated:YES];
    [addAlert show];
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        //add 到字典中
        NSUInteger i = [Companys count] + 1;
        NSString *companyID = [NSString stringWithFormat:@"%lu",(unsigned long)i];
        [Companys setObject:[alertView textFieldAtIndex:0].text forKey:companyID];
        
        //重新reload tableView
        [self.CMtableView reloadData];
    }
}



@end
