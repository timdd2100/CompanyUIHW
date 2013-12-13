//
//  LDetailViewController.h
//  CompanyUIHW
//
//  Created by timkao on 13/12/6.
//  Copyright (c) 2013年 skl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EmployeeViewController.h"

@interface LDetailViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIToolbar *LDetailToolbar;

@property (weak, nonatomic) IBOutlet UITextField *LDFirstName;

@property (weak, nonatomic) IBOutlet UITextField *LDLastName;

@property (weak, nonatomic) IBOutlet UITextField *LDSalary;

@property (weak, nonatomic) IBOutlet UITextField *LDAge;

@property (weak, nonatomic) IBOutlet UISegmentedControl *LDSex;

@property (weak, nonatomic) IBOutlet UITextField *LDskill;

@property (weak, nonatomic) IBOutlet UITextView *LDdescription;

@property (weak, nonatomic) IBOutlet UISegmentedControl *LDType;

@property (nonatomic, strong) NSMutableDictionary *LDreceivedict;

@property (nonatomic) EmployeeViewController *parentLeader;
@end
