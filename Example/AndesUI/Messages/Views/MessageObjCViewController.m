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
@property (weak, nonatomic) IBOutlet AndesMessage *highlightQuiet;
@property (weak, nonatomic) IBOutlet AndesMessage *errorLoud;
@property (weak, nonatomic) IBOutlet AndesMessage *successQuiet;

@end

@implementation MessageObjCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup];
}

- (void)setup {
    [self setupStyles];
    [self setupTexts];
}

- (void)setupTexts {
    [[self.highlightQuiet setTitle:@"Highlight"] setBody:@"This is a quiet/highlight message"];
    [[self.errorLoud setTitle:@"Error"] setBody:@"This is a loud/error message"];
    [[self.successQuiet setTitle:@"Success"] setBody:@"This is a quiet/success message"];
}

- (void)setupStyles {
    [self.highlightQuiet setHierarchy:AndesMessageHierarchyLoud];
    [self.errorLoud setType:AndesMessageTypeError];
    [[self.successQuiet setType:AndesMessageTypeSuccess] setHierarchy:AndesMessageHierarchyQuiet];
}

@end
