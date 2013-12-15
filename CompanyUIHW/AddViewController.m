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
{
    NSMutableArray *currectMember;
}

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
    
    //這裡的member array是全新的
    currectMember = [NSMutableArray new];
    
    //目前leader擁有的成員
    NSArray *members = [self.ReciveLeader.members allValues];
    
    for (int i = 0 ; i < [self.MemberArray count]; i++) {
        if (![members containsObject:[self.MemberArray objectAtIndex:i]]) {
            [currectMember addObject:[self.MemberArray objectAtIndex:i]];
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
    return [currectMember count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"memberCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [[currectMember objectAtIndex:indexPath.row]getFullName];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Member *member = [currectMember objectAtIndex:indexPath.row];
    
    //leader 加入員工
    [self.ReciveLeader addMembers:member];
    
    //員工將調薪委派給主管
    member = [self.MemberArray objectAtIndex:[self.MemberArray indexOfObject:member]];
    member.m_delegate = self.ReciveLeader;
    
    [self dismissViewControllerAnimated:YES completion:Nil];
}



- (IBAction)AddCancel:(UIBarButtonItem *)sender {
    
    [self dismissViewControllerAnimated:YES completion:Nil];
}
@end
