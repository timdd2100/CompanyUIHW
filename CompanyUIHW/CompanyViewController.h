//
//  CompanyViewController.h
//  CompanyUIHW
//
//  Created by timkao on 13/12/6.
//  Copyright (c) 2013年 skl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CompanyViewController : UITableViewController<UIAlertViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *CMtableView;

@property (strong, nonatomic) NSMutableDictionary *Companys;

@end
