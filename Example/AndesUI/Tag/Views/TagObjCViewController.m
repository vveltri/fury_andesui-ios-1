//
//  TagObjCViewController.m
//  AndesUI-demoapp
//
//  Created by Samuel Sainz on 5/29/20.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

#import "TagObjCViewController.h"
#import <AndesUI/AndesUI-Swift.h>

@interface TagObjCViewController ()

@property (weak, nonatomic) IBOutlet UIStackView *stackView;

@end

@implementation TagObjCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup];
}

- (void)setup {
    _stackView.translatesAutoresizingMaskIntoConstraints = false;
    
    [self setupTags];
}

- (void)setupTags {
    UILabel* tagTitle = [[UILabel alloc] initWithFrame:CGRectZero];
    tagTitle.text = @"Tag Simple";
    tagTitle.font = [UIFont systemFontOfSize:24];
    [_stackView addArrangedSubview:tagTitle];
    
    UIStackView* tagsStack = [[UIStackView alloc] init];
    tagsStack.axis = UILayoutConstraintAxisHorizontal;
    tagsStack.spacing = 10.0;

    UIStackView* leftTags = [[UIStackView alloc] init];
    leftTags.axis = UILayoutConstraintAxisVertical;
    leftTags.alignment = UIStackViewAlignmentCenter;
    leftTags.distribution = UIStackViewDistributionFillProportionally;
    leftTags.spacing = 6.0;

    UILabel* smallTagsTitle = [[UILabel alloc] initWithFrame:CGRectZero];
    smallTagsTitle.text = @"Tag size: Small";
    smallTagsTitle.font = [UIFont systemFontOfSize:16];
    [leftTags addArrangedSubview:smallTagsTitle];
    
    AndesTagSimple *tag = [[AndesTagSimple alloc] initWithText:@"Small tag" size:AndesTagSizeSmall type:AndesTagTypeNeutral isDismissible:NO];
    [leftTags addArrangedSubview:tag];
    
    AndesTagSimple *dismissibleTag = [[AndesTagSimple alloc] initWithText:@"Dismissible" size:AndesTagSizeSmall type:AndesTagTypeNeutral isDismissible:YES];
    [leftTags addArrangedSubview:dismissibleTag];
    
    AndesTagSimple *successTag = [[AndesTagSimple alloc] initWithText:@"Success" size:AndesTagSizeSmall type:AndesTagTypeSuccess isDismissible:YES];
    [leftTags addArrangedSubview:successTag];
    
    AndesTagSimple *errorTag = [[AndesTagSimple alloc] initWithText:@"Error tag" size:AndesTagSizeSmall type:AndesTagTypeError isDismissible:NO];
    [leftTags addArrangedSubview:errorTag];
    
    AndesTagSimple *warningTag = [[AndesTagSimple alloc] initWithText:@"Warning tag" size:AndesTagSizeSmall type:AndesTagTypeWarning isDismissible:YES];
    [leftTags addArrangedSubview:warningTag];
    
    UIStackView* rightTags = [[UIStackView alloc] init];
    rightTags.axis = UILayoutConstraintAxisVertical;
    rightTags.alignment = UIStackViewAlignmentCenter;
    rightTags.distribution = UIStackViewDistributionFillProportionally;
    rightTags.spacing = 6.0;

    UILabel* imagesTagsTitle = [[UILabel alloc] initWithFrame:CGRectZero];
    imagesTagsTitle.text = @"Tag size: Large";
    imagesTagsTitle.font = [UIFont systemFontOfSize:16];
    [rightTags addArrangedSubview:imagesTagsTitle];
    
    [tagsStack addArrangedSubview:leftTags];
    [tagsStack addArrangedSubview:rightTags];
    [_stackView addArrangedSubview:tagsStack];
}

@end
