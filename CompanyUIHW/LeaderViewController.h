//
//  LeaderViewController.h
//  CompanyUIHW
//
//  Created by timkao on 13/12/6.
//  Copyright (c) 2013年 skl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeaderViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *LCompanyName;
@property (nonatomic, strong) NSMutableDictionary *Lreceivedict;
@property (nonatomic, strong) NSMutableDictionary *LDreceivedict;
@property (nonatomic, strong) NSMutableArray *leaders;
@property (weak, nonatomic) IBOutlet UITableView *LtableView;

-(id)initWithCompanyName : (NSString *) companyname;


@end
