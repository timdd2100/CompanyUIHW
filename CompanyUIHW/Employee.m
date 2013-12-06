//
//  Employee.m
//  SKCU9015_Chapter4and5
//
//  Created by timkao on 13/11/28.
//  Copyright (c) 2013年 skl. All rights reserved.
//

#import "Employee.h"

@implementation Employee
@synthesize age,basesalary,firstname,lastname,sex,skill,title;

//overwrite
-(id) initWthFirstName:(NSString *)fname LastName:(NSString *)lname Sex:(NSString *)se Age:(int)ag Salary:(int)salary
{
    self = [super init];
    if(self)
    {
        self.firstname = fname ;
        self.lastname = lname;
        self.sex = se;
        self.age = ag;
        self.basesalary = salary;
    }
      return self;
}

#pragma mark ----self method

-(void)setMarriage:(NSString *)marry
{
    Marriage = marry;
}


-(void)description
{
    NSLog(@"各位同仁好！我的名字是 %@ 我的職稱是 %@ 我的能力是 %@ 我的年齡是%i 我的婚姻狀態是%@",self.getFullName,self.title,self.skill,self.age,self.Marriage);
}


-(NSString *)Marriage
{
    return Marriage;
}


-(NSString *)getFullName{
    return [NSString stringWithFormat:@"%@ %@",self.firstname,self.lastname];
}

@end
