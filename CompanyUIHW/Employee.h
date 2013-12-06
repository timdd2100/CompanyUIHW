//
//  Employee.h
//  SKCU9015_Chapter4and5
//
//  Created by timkao on 13/11/28.
//  Copyright (c) 2013年 skl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IPerson.h"

@interface Employee : NSObject<IPerson>
{
    NSString *Marriage;//婚姻狀態
}
@property(nonatomic) int basesalary;//預設薪資
@property(nonatomic) NSString *title;
@property(nonatomic) NSString *skill;

-(id)initWthFirstName:(NSString *)fname LastName : (NSString *)lname Sex:(NSString *)se Age:(int)ag Salary:(int) salar;

-(void)description;//員工描述

-(void)setMarriage:(NSString *)marry;//設定婚姻狀態

-(NSString *)Marriage;//回傳婚姻狀態



@end
