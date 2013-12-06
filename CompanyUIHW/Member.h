//
//  Member.h
//  SKCU9015_Chapter4and5
//
//  Created by timkao on 13/11/28.
//  Copyright (c) 2013年 skl. All rights reserved.
//

#import "Employee.h"
#import "AdjSalary.h"
@interface Member : Employee

@property int salary;//實際薪資

@property id m_delegate;//委派

//調整薪水
//此方法透遛delegate，呼叫由Leader實作的方法，來修改Member的薪水
-(void)adjSalary;


@end
