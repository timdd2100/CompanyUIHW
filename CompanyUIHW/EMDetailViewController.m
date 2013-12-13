//
//  EMDetailViewController.m
//  CompanyUIHW
//
//  Created by timkao on 13/12/12.
//  Copyright (c) 2013年 skl. All rights reserved.
//

#import "EMDetailViewController.h"

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

#pragma -mark table區
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.MemberArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"memberCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [[self.MemberArray objectAtIndex:indexPath.row]getFullName];
    return cell;
}
- (IBAction)EMDback:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
