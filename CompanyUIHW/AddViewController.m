//
//  AddViewController.m
//  CompanyUIHW
//
//  Created by timkao on 13/12/13.
//  Copyright (c) 2013年 skl. All rights reserved.
//

#import "AddViewController.h"
#import "Member.h"


@interface AddViewController ()

@end

@implementation AddViewController

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
    
    //目前leader擁有的成員
    NSArray *members = [self.ReciveLeader.members allValues];
   
    for (int i = 0 ; i < [self.MemberArray count]; i++) {
        if ([members containsObject:[self.MemberArray objectAtIndex:i]]) {
                [self.MemberArray removeObject:[self.MemberArray objectAtIndex:i]];
        }
    }
    
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


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //leader 加入員工
    [self.ReciveLeader addMembers:[self.MemberArray objectAtIndex:indexPath.row
                                   ]];
    [self dismissViewControllerAnimated:YES completion:Nil];
}



- (IBAction)AddCancel:(UIBarButtonItem *)sender {
    
    [self dismissViewControllerAnimated:YES completion:Nil];
}
@end
