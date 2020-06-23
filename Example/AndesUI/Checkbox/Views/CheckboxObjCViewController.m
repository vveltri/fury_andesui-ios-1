//
//  AndesObjCCheckboxViewController.m
//  AndesUI-demoapp
//
//  Created by Rodrigo Pintos Costa on 6/22/20.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

#import "CheckboxObjCViewController.h"
#import <AndesUI/AndesUI-Swift.h>

@interface CheckboxObjCViewController ()
@property (weak, nonatomic) IBOutlet UIStackView *stackView;


@end

@implementation CheckboxObjCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup];
}

- (void)setup {
    _stackView.translatesAutoresizingMaskIntoConstraints = false;
    [self setupCheckbox];
}

- (void)setupCheckbox {
        
    _stackView.axis = UILayoutConstraintAxisHorizontal;
    _stackView.alignment = UIStackViewAlignmentCenter;

    UIStackView* checkboxIdledStack = [[UIStackView alloc] init];
    checkboxIdledStack.axis = UILayoutConstraintAxisVertical;
    checkboxIdledStack.alignment = UIStackViewAlignmentCenter;
    checkboxIdledStack.distribution = UIStackViewDistributionFillProportionally;
    checkboxIdledStack.spacing = 6.0;
    
    UILabel* idelTitle = [[UILabel alloc] initWithFrame:CGRectZero];
    idelTitle.text = @"Idle Checkbox";
    idelTitle.font = [UIFont systemFontOfSize:24];
    [checkboxIdledStack addArrangedSubview:idelTitle];
    
    [self addIdelCheckboxes: checkboxIdledStack];

    UIStackView* checkboxDisabledErrorStack = [[UIStackView alloc] init];
    checkboxDisabledErrorStack.axis = UILayoutConstraintAxisVertical;
    checkboxDisabledErrorStack.alignment = UIStackViewAlignmentCenter;
    checkboxDisabledErrorStack.distribution = UIStackViewDistributionEqualCentering;
    checkboxDisabledErrorStack.spacing = 6.0;

    [self addDisabledAndErrorCheckbox:checkboxDisabledErrorStack];
    
    [_stackView addArrangedSubview:checkboxIdledStack];
    [_stackView addArrangedSubview:checkboxDisabledErrorStack];
}

- (void)addIdelCheckboxes : (UIStackView *)stackView
    {
    //LEFT
    AndesCheckbox* selectedStack =[[AndesCheckbox alloc] initWithType:(AndesCheckboxTypeIdle) align:(AndesCheckboxAlignLeft) status:(AndesCheckboxStatusSelected) title:(@"Idle Selected")];

    [stackView addArrangedSubview:selectedStack];
    
    AndesCheckbox* unselectedStack =[[AndesCheckbox alloc] initWithType:(AndesCheckboxTypeIdle) align:(AndesCheckboxAlignLeft) status:(AndesCheckboxStatusUnselected) title:(@"Idle Unselected")];
    
    [stackView addArrangedSubview:unselectedStack];

    AndesCheckbox* undefinedStack =[[AndesCheckbox alloc] initWithType:(AndesCheckboxTypeIdle) align:(AndesCheckboxAlignLeft) status:(AndesCheckboxStatusUndefined) title:(@"Idle Undefined")];
    
    [stackView addArrangedSubview:undefinedStack];
    
    //RIGHT
    AndesCheckbox* selectedRightStack =[[AndesCheckbox alloc] initWithType:(AndesCheckboxTypeIdle) align:(AndesCheckboxAlignRight) status:(AndesCheckboxStatusSelected) title:(@"Idle Selected")];
    
    [stackView addArrangedSubview:selectedRightStack];
        
    AndesCheckbox* unselectedRightStack =[[AndesCheckbox alloc] initWithType:(AndesCheckboxTypeIdle) align:(AndesCheckboxAlignRight) status:(AndesCheckboxStatusUnselected) title:(@"Idle Unselected")];
        
    [stackView addArrangedSubview:unselectedRightStack];

    AndesCheckbox* undefinedRightStack =[[AndesCheckbox alloc] initWithType:(AndesCheckboxTypeIdle) align:(AndesCheckboxAlignRight) status:(AndesCheckboxStatusUndefined) title:(@"Idle Undefined")];
        
    [stackView addArrangedSubview:undefinedRightStack];
    
}

- (void)addDisabledAndErrorCheckbox:(UIStackView *)stackView
{
    UILabel* disabledTitle = [[UILabel alloc] initWithFrame:CGRectZero];
    disabledTitle.text = @"Disabled and Error";
    disabledTitle.font = [UIFont systemFontOfSize:24];
    [stackView addArrangedSubview:disabledTitle];
    
    //DISABLED
    AndesCheckbox* selectedStack =[[AndesCheckbox alloc] initWithType:(AndesCheckboxTypeDisabled) align:(AndesCheckboxAlignLeft) status:(AndesCheckboxStatusSelected) title:(@"Disabled Selected")];
    
    [stackView addArrangedSubview:selectedStack];
    
    AndesCheckbox* selectedRightStack =[[AndesCheckbox alloc] initWithType:(AndesCheckboxTypeDisabled) align:(AndesCheckboxAlignRight) status:(AndesCheckboxStatusSelected) title:(@"Disabled Selected")];
    
    [stackView addArrangedSubview:selectedRightStack];
        
    AndesCheckbox* unselectedStack =[[AndesCheckbox alloc] initWithType:(AndesCheckboxTypeDisabled) align:(AndesCheckboxAlignLeft) status:(AndesCheckboxStatusUnselected) title:(@"Disabled Unselected")];
        
    [stackView addArrangedSubview:unselectedStack];

    AndesCheckbox* undefinedStack =[[AndesCheckbox alloc] initWithType:(AndesCheckboxTypeDisabled) align:(AndesCheckboxAlignLeft) status:(AndesCheckboxStatusUndefined) title:(@"Disabled Undefined")];
        
    [stackView addArrangedSubview:undefinedStack];
            
    //ERROR
    AndesCheckbox* unselectedErrorStack =[[AndesCheckbox alloc] initWithType:(AndesCheckboxTypeError) align:(AndesCheckboxAlignLeft) status:(AndesCheckboxStatusUnselected) title:(@"Error Unselected")];
    
    [stackView addArrangedSubview:unselectedErrorStack];
    
    AndesCheckbox* unselectedErrorRightStack =[[AndesCheckbox alloc] initWithType:(AndesCheckboxTypeError) align:(AndesCheckboxAlignRight) status:(AndesCheckboxStatusUnselected) title:(@"Error Unselected")];
    
    [stackView addArrangedSubview:unselectedErrorRightStack];
}

@end
