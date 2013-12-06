//
//  Company.m
//  SKCU9015_Chapter4and5
//
//  Created by timkao on 13/11/28.
//  Copyright (c) 2013年 skl. All rights reserved.
//

#import "Company.h"


@implementation Company
@synthesize employee,sex,age,companyname,firstname,lastname;

-(id)initWitName:(NSString *)name
{
    
    self = [super init];
    if(self)
    {
        companyname = name;
    }
    return self;
}

-(void)addEmployee:(id)emp
{
    //檢查dictionary 是否為空
    if (!employee) {
        employee = [[NSMutableDictionary alloc] init];//配置Dictionary
    }
    
    //加入一個員工物件
    [employee setObject:emp forKey:[(id<IPerson>)emp getFullName]];
}


-(int)getEmployeeCount
{
    return (int)[employee count];
}

-(void)showEmployee
{
    NSLog(@"公司名稱 -- %@",[self getFullName]);
    if(employee)
    {
        NSArray *emp = [employee allValues];
        NSLog(@"公司員工成員如下：");
        for (int i = 0 ; i < [employee count]; i++) {
                    NSLog(@"%@", [(id<IPerson>)emp[[employee count] - (i+1)] getFullName]);
        }
 
    }
    else
    {
        NSLog(@"company %@ has no employee yet.",[self companyname]);
    }
}

-(NSString *)getFullName{
    return companyname;
}

@end
