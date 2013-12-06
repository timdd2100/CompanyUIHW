//
//  Leader.m
//  SKCU9015_Chapter4and5
//
//  Created by timkao on 13/11/28.
//  Copyright (c) 2013年 skl. All rights reserved.
//

#import "Leader.h"

@implementation Leader
@synthesize salary,title,skill,sex,lastname,firstname,basesalary,age,members;


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
        self.salary = basesalary*1.8;
    }
     return self;
}

//overwrite
-(NSString *)Marriage
{
    return @"Secret";
}

#pragma mark ----self method

-(void)addMembers:(id)member
{
    if (!members) {
        members = [[NSMutableDictionary alloc] init];
    }
    [members setObject:member forKey:[(id<IPerson>)member getFullName]];
}

-(int)getMemberCount
{
    return (int)[members count];
    
}

-(void)showMembers
{
    if(members)
    {
        NSArray *emp = [members allValues];
        NSLog(@"主管的成員如下：");
        for (int i = 0 ; i < [members count]; i++) {
        NSLog(@"%@", [(id<IPerson>)emp[[members count] - (i+1)] getFullName]);
        }
    }
    else
    {
        NSLog(@"Leader %@ has no members yet.",[self getFullName]);
    }

}

#pragma -mark----委派（看老闆心情決定員工薪水漲幅）
-(int)adjustSalary:(id)emp
{
    if ([emp isKindOfClass:[Member class]]) {
           int rnd = arc4random()%10;
        if (rnd > 6) {
            NSLog(@"主管 %@ 心情大好薪水加碼！", self.getFullName);
            return ((Member *)emp).salary *1.05;
        }
        else if (rnd > 3 )
        {
            NSLog(@"主管 %@ 心情普普薪水不加價！", self.getFullName);
            return ((Member *)emp).salary;
        }
        else
        {
            NSLog(@"主管 %@ 心情極差薪水打折！", self.getFullName);
            return  ((Member *)emp).salary *0.95;
        }
    }
    else
    {
        return ((Member *)emp).basesalary*1.2;//員工薪水 不變
    }
}

@end
