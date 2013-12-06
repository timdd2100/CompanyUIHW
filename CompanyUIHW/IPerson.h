//
//  IPerson.h
//  SKCU9015_Chapter4and5
//
//  Created by timkao on 13/11/28.
//  Copyright (c) 2013年 skl. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IPerson<NSObject>
@property NSString *firstname;
@property NSString *lastname;
@property NSString *sex;
@property int age;
-(NSString *) getFullName;
@end
