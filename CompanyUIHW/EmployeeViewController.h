//
//  EmployeeViewController.h
//  CompanyUIHW
//
//  Created by timkao on 13/12/11.
//  Copyright (c) 2013年 skl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Company.h"
@interface EmployeeViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) Company *parentCompany;
@property (nonatomic, strong) NSMutableArray *leaders;
@property (nonatomic, strong) NSMutableDictionary *Lreceivedict;
@property (weak, nonatomic) IBOutlet UITableView *LtableView;
@property (weak, nonatomic) IBOutlet UILabel *LCompanyName;

@end
