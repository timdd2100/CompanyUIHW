//
//  Member.m
//  SKCU9015_Chapter4and5
//
//  Created by timkao on 13/11/28.
//  Copyright (c) 2013年 skl. All rights reserved.
//

#import "Member.h"

@implementation Member
@synthesize salary,age,basesalary,firstname,lastname,m_delegate,sex,skill,title;

-(id) initWthFirstName:(NSString *)fname LastName:(NSString *)lname Sex:(NSString *)se Age:(int)ag Salary:(int)sa
{
    self = [super init];
    if(self)
    {
        self.firstname = fname ;
        self.lastname = lname;
        self.sex = se;
        self.age = ag;
        self.basesalary = sa;
        self.salary = sa *1.2;
    }
    return self;
}

#pragma -mark ---- delegate
-(void)adjSalary
{
    self.salary = [self.m_delegate adjustSalary:self];
    NSLog(@"員工 %@ 薪資調整後為 %i \n ---------------------" , [self getFullName], self.salary);
}


@end
