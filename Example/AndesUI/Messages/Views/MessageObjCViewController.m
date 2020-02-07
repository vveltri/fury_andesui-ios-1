//
//  MessageObjCViewController.m
//  AndesUI_Example
//
//  Created by Nicolas Rostan Talasimov on 1/17/20.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//


#import "MessageObjCViewController.h"

#import <AndesUI-Swift.h>

@interface MessageObjCViewController ()
@property (weak, nonatomic) IBOutlet UIStackView *stackView;

@end

@implementation MessageObjCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup];
}

- (void) handleActionTap:(AndesMessage*)message {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Action Pressed"
                                                                   message:@""
                                                            preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:nil];

    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)setup {
    __weak typeof(self) weakSelf = self;

    _stackView.translatesAutoresizingMaskIntoConstraints = false;
    AndesMessage* view = [[AndesMessage alloc] initWithHierarchy:AndesMessageHierarchyQuiet type:AndesMessageTypeSuccess title:@"Message title" body:@"Message body\nSuccess - Quiet"];
    [_stackView addArrangedSubview:view];
    [view.widthAnchor constraintEqualToAnchor:_stackView.widthAnchor].active = YES;
    
    view = [[AndesMessage alloc] initWithHierarchy:AndesMessageHierarchyLoud type:AndesMessageTypeNeutral title:@"Message title" body:@"Message body\nNeutral - Quiet - With Actions"];
    [view setPrimaryAction:@"Action" handler: ^(AndesMessage* message){
        [weakSelf handleActionTap:message];
    }];
    [view setSecondaryAction:@"Secondary Action" handler: ^(AndesMessage* message){
        [weakSelf handleActionTap:message];
    }];
    [_stackView addArrangedSubview:view];
    [view.widthAnchor constraintEqualToAnchor:_stackView.widthAnchor].active = YES;
    
    view = [[AndesMessage alloc] initWithHierarchy:AndesMessageHierarchyQuiet type:AndesMessageTypeError title:@"" body:@"Message Without title\nError - Quiet"];
    [view setPrimaryAction:@"Just Primary" handler: ^(AndesMessage* message){
        [weakSelf handleActionTap:message];
    }];
    [_stackView addArrangedSubview:view];
    [view.widthAnchor constraintEqualToAnchor:_stackView.widthAnchor].active = YES;
    
    view = [[AndesMessage alloc] initWithHierarchy:AndesMessageHierarchyLoud type:AndesMessageTypeWarning title:@"Message title" body:@"Message body\nWarning - Loud"];
    [_stackView addArrangedSubview:view];
    [view.widthAnchor constraintEqualToAnchor:_stackView.widthAnchor].active = YES;
    
}

@end
