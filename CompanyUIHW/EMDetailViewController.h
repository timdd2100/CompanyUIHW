//
//  EMDetailViewController.h
//  CompanyUIHW
//
//  Created by timkao on 13/12/12.
//  Copyright (c) 2013年 skl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Employee.h"
@interface EMDetailViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *EMDtextView;

@property (nonatomic,strong)Employee *ReciveEmployee;

@property (nonatomic,strong)NSMutableArray *MemberArray;
@end
