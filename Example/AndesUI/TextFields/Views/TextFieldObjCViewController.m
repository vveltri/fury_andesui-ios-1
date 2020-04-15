//
//  TextFieldObjCViewController.m
//  AndesUI-demoapp
//
//  Created by Martin Damico on 13/03/2020.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

#import "TextFieldObjCViewController.h"

#import <AndesUI-Swift.h>

@interface TextFieldObjCViewController ()
@property (weak, nonatomic) IBOutlet AndesTextField *textField1;
@property (weak, nonatomic) IBOutlet AndesTextField *textField2;
@property (weak, nonatomic) IBOutlet AndesTextField *textField3;

@end

@implementation TextFieldObjCViewController

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
    _textField1.rightContent = [[AndesTextFieldComponentCheck alloc] init];
    _textField2.rightContent = [[AndesTextFieldComponentClear alloc] init];
    _textField3.rightContent = [[AndesTextFieldComponentAction alloc] init:@"ACTION!"];
    _textField3.leftContent = [[AndesTextFieldComponentLabel alloc] initWithText:@"PREFIX?"];
    _textField3.delegate = self;
}

- (void)andesTextFieldDidTapRightAction: (AndesTextField*) field {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Action Pressed"
                                                                   message:@""
                                                            preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:nil];

    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

@end

