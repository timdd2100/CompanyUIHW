//
//  Company.h
//  SKCU9015_Chapter4and5
//
//  Created by timkao on 13/11/28.
//  Copyright (c) 2013年 skl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IPerson.h"
#import "Employee.h"
@interface Company : NSObject<IPerson>

@property (readonly)NSString *companyname;
@property NSMutableDictionary *employee;

//設定公司名稱
-(id)initWitName: (NSString*)name;

//加入員工
-(void)addEmployee: (id)emp;

//回傳員工數
-(int)getEmployeeCount;

//列出有那些員工
-(void)showEmployee;

@end
