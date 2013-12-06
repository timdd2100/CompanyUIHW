//
//  Leader.h
//  SKCU9015_Chapter4and5
//
//  Created by timkao on 13/11/28.
//  Copyright (c) 2013年 skl. All rights reserved.
//

#import "Employee.h"
#import "AdjSalary.h"
#import "Member.h"

@interface Leader : Employee<AdjSalary>
@property int salary;//實際薪資
@property NSMutableDictionary *members;//成員集合

-(void)addMembers: (id)member;//加入成員

-(int)getMemberCount;//回傳成員數量

-(void)showMembers;//列出成員

@end
