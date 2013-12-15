//
//  AddViewController.h
//  CompanyUIHW
//
//  Created by timkao on 13/12/13.
//  Copyright (c) 2013年 skl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Leader.h"
@interface AddViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)Leader *ReciveLeader;

@property (nonatomic,strong)NSMutableArray *MemberArray;
- (IBAction)AddCancel:(UIBarButtonItem *)sender;

@end
