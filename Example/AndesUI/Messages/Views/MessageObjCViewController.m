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
@property (weak, nonatomic) IBOutlet AndesMessage *neutralQuiet;
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
    [self setupActions];
}

- (void)setupTexts {
    [[self.neutralQuiet setTitle:@"Neutral"] setBody:@"This is a quiet/neutral message"];
    [[self.errorLoud setTitle:@"Error"] setBody:@"This is a loud/error message"];
    [[self.successQuiet setTitle:@"Success"] setBody:@"This is a quiet/success message"];
}

- (void)setupStyles {
    [self.neutralQuiet setHierarchy:AndesMessageHierarchyLoud];
    [self.errorLoud setType:AndesMessageTypeError];
    [[self.successQuiet setType:AndesMessageTypeSuccess] setHierarchy:AndesMessageHierarchyQuiet];
}

- (void)setupActions {
    [self.neutralQuiet setPrimaryAction:@"Primary" handler:^(AndesMessage* message){
        NSLog(@"Primary tapped");
    }];
    [self.neutralQuiet setSecondaryAction:@"Secondary" handler:^(AndesMessage* message){
        NSLog(@"Secondary tapped");
    }];
}

@end
