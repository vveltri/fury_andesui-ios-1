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
    _stackView.axis = UILayoutConstraintAxisVertical;
    _stackView.alignment = UIStackViewAlignmentCenter;
    _stackView.distribution = UIStackViewDistributionFillProportionally;

    AndesCheckbox* checkbox =[[AndesCheckbox alloc] initWithType:(AndesCheckboxTypeIdle) align:(AndesCheckboxAlignLeft) status:(AndesCheckboxStatusSelected) title:(@"Idle Selected")];
        
    AndesCheckbox* checkboxUnselected =[[AndesCheckbox alloc] initWithType:(AndesCheckboxTypeIdle) align:(AndesCheckboxAlignLeft) status:(AndesCheckboxStatusUnselected) title:(@"Idle Unselected")];
    
    [_stackView addArrangedSubview:checkbox];
    [_stackView addArrangedSubview:checkboxUnselected];

    }

@end
