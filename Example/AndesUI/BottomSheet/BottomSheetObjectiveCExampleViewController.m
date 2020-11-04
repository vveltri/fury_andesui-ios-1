//
//  BottomSheetObjectiveCExampleViewController.m
//  AndesUI-demoapp
//
//  Created by Tomi De Lucca on 29/10/2020.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

#import "BottomSheetObjectiveCExampleViewController.h"

#import <AndesUI/AndesUI-Swift.h>
#import "AndesUI_DemoApp-Swift.h"

@interface BottomSheetObjectiveCExampleViewController ()

@end

@implementation BottomSheetObjectiveCExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self view] setBackgroundColor:[UIColor whiteColor]];
    
    AndesButton* button = [[AndesButton alloc] initWithText:@"Open sheet"
                                                  hierarchy:AndesButtonHierarchyLoud
                                                       size:AndesButtonSizeLarge
                                                       icon:nil];
    [button setTranslatesAutoresizingMaskIntoConstraints:NO];
    [button addTarget:self action:@selector(openSheet) forControlEvents:UIControlEventTouchUpInside];
    [[self view] addSubview:button];
    
    [NSLayoutConstraint activateConstraints:@[
        [[button topAnchor] constraintEqualToAnchor:[[[self view] layoutMarginsGuide] topAnchor] constant:16],
        [[button leftAnchor] constraintEqualToAnchor:[[self view] leftAnchor] constant:16],
        [[button rightAnchor] constraintEqualToAnchor:[[self view] rightAnchor] constant:-16]
    ]];
    
    AndesButton* scrollable = [[AndesButton alloc] initWithText:@"Open scrollable sheet"
                                                  hierarchy:AndesButtonHierarchyLoud
                                                       size:AndesButtonSizeLarge
                                                       icon:nil];
    [scrollable setTranslatesAutoresizingMaskIntoConstraints:NO];
    [scrollable addTarget:self action:@selector(openScrollableSheet) forControlEvents:UIControlEventTouchUpInside];
    [[self view] addSubview:scrollable];
    
    [NSLayoutConstraint activateConstraints:@[
        [[scrollable topAnchor] constraintEqualToAnchor:[button bottomAnchor] constant:16],
        [[scrollable leftAnchor] constraintEqualToAnchor:[[self view] leftAnchor] constant:16],
        [[scrollable rightAnchor] constraintEqualToAnchor:[[self view] rightAnchor] constant:-16]
    ]];
}

- (void)openSheet {
    AndesBottomSheetViewController* sheet = [[AndesBottomSheetViewController alloc] initWithRootViewController: [BottomSheetExampleContentViewController new]];
    [[sheet titleBar] setText:@"Elige una categoría es un texto muy muy muy largo y quiero ver los puntos"];
    [[sheet titleBar] setTextAlignment:NSTextAlignmentRight];
    [self presentViewController:sheet animated:YES completion:nil];
}

- (void)openScrollableSheet {
    AndesBottomSheetViewController* sheet = [[AndesBottomSheetViewController alloc] initWithRootViewController: [BottomSheetExampleScrollableContentViewController new]];
    [[sheet titleBar] setText:@"Rainbow 🌈"];
    [[sheet titleBar] setTextAlignment:NSTextAlignmentLeft];
    [self presentViewController:sheet animated:YES completion:nil];
}

@end
