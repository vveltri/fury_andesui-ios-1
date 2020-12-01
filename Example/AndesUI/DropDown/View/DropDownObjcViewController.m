//
//  DropDownObjcViewController.m
//  AndesUI-demoapp
//
//  Created by Jonathan Alonso Pinto on 30/11/20.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

#import "DropDownObjcViewController.h"

@interface DropDownObjcViewController ()

@property(weak, nonatomic) IBOutlet AndesDropdown *andesDropdown;
@property(weak, nonatomic) IBOutlet AndesRadioButton *radioButtonForm;
@property(weak, nonatomic) IBOutlet AndesRadioButton *radioButtonStandAlone;
@property(nonatomic) AndesDropDownMenuCell *cell;
@property(nonatomic) NSMutableArray *cellArray;

@end

@implementation DropDownObjcViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self config];
    [self setup];
    [_radioButtonForm setRadioButtonTappedWithCallback:^(AndesRadioButton *selected) {
        [self didTapped:selected];
    }];
    [_radioButtonStandAlone setRadioButtonTappedWithCallback:^(AndesRadioButton *selected) {
        [self didTapped:selected];
    }];
}

- (void) setup {
    _andesDropdown.delegate = self;
    [_andesDropdown setTriggerType:[[FormDropdownTrigger alloc]initWithTitle:@"Title" placeholder:@"Placeholder"]];
    [_andesDropdown setMenuType:[[DropdownBottomSheetMenu alloc]initWithSeparatorStyle:AndesSeparatorStyleSingleLine
                                                                         numberOfLines:1
                                                                                  rows:_cellArray
                                                                        selectionStyle:AndesSelectionStyleDefaultStyle]];
}

- (void)config {
    AndesDropDownMenuCell *mastercard = [[AndesDropDownMenuCell alloc] initWithTitle:@"Dinero en cuenta"
                                                                     thumbnail:[[AndesThumbnail alloc] initWithHierarchy: AndesThumbnailHierarchyDefaultHierarchy
                                                                                                                    type:AndesThumbnailTypeImageCircle
                                                                                                                    size:AndesThumbnailSizeSize80
                                                                                                                   state:AndesThumbnailStateEnabled
                                                                                                                   image:[UIImage imageNamed:@"mastercard"]
                                                                                                             accentColor:NULL]];
    AndesDropDownMenuCell *visa = [[AndesDropDownMenuCell alloc] initWithTitle:@"Visa debito **** 0899"
                                                                     thumbnail:[[AndesThumbnail alloc] initWithHierarchy: AndesThumbnailHierarchyDefaultHierarchy
                                                                                                                    type:AndesThumbnailTypeImageCircle
                                                                                                                    size:AndesThumbnailSizeSize80
                                                                                                                   state:AndesThumbnailStateEnabled
                                                                                                                   image:[UIImage imageNamed:@"visa"]
                                                                                                             accentColor:NULL]];
    AndesDropDownMenuCell *bbva1 = [[AndesDropDownMenuCell alloc] initWithTitle:@"BBVA **** 7788"
                                                                     thumbnail:[[AndesThumbnail alloc] initWithHierarchy: AndesThumbnailHierarchyDefaultHierarchy
                                                                                                                    type:AndesThumbnailTypeImageCircle
                                                                                                                    size:AndesThumbnailSizeSize80
                                                                                                                   state:AndesThumbnailStateEnabled
                                                                                                                   image:[UIImage imageNamed:@"american"]
                                                                                                             accentColor:NULL]];
    AndesDropDownMenuCell *bbva2 = [[AndesDropDownMenuCell alloc] initWithTitle:@"BBVA **** 4545"
                                                                     thumbnail:[[AndesThumbnail alloc] initWithHierarchy: AndesThumbnailHierarchyDefaultHierarchy
                                                                                                                    type:AndesThumbnailTypeImageCircle
                                                                                                                    size:AndesThumbnailSizeSize80
                                                                                                                   state:AndesThumbnailStateEnabled
                                                                                                                   image:[UIImage imageNamed:@"american"]
                                                                                                             accentColor:NULL]];
    AndesDropDownMenuCell *mercadoCreditos = [[AndesDropDownMenuCell alloc] initWithTitle:@"Mercado Créditos"
                                                                     thumbnail:[[AndesThumbnail alloc] initWithHierarchy: AndesThumbnailHierarchyDefaultHierarchy
                                                                                                                    type:AndesThumbnailTypeImageCircle
                                                                                                                    size:AndesThumbnailSizeSize80
                                                                                                                   state:AndesThumbnailStateEnabled
                                                                                                                   image:[UIImage imageNamed:@"mercadocredito"]
                                                                                                             accentColor:NULL]];
    
    _cellArray = [[NSMutableArray alloc]init];
    [_cellArray addObject:mastercard];
    [_cellArray addObject:visa];
    [_cellArray addObject:bbva1];
    [_cellArray addObject:bbva2];
    [_cellArray addObject:mercadoCreditos];
}

- (void)didTapped:(AndesRadioButton *)radioButton {
    if (radioButton == _radioButtonForm) {
        _radioButtonForm.status = AndesRadioButtonStatusSelected;
        _radioButtonStandAlone.status = AndesRadioButtonStatusUnselected;
        [_andesDropdown setTriggerType:[[FormDropdownTrigger alloc]initWithTitle:@"Title" placeholder:@"Placeholder"]];
    }
    else if (radioButton == _radioButtonStandAlone) {
        _radioButtonForm.status = AndesRadioButtonStatusUnselected;
        _radioButtonStandAlone.status = AndesRadioButtonStatusSelected;
        [_andesDropdown setTriggerType:[[StandaloneDropdownTrigger alloc]initWithSize:AndesTextSizeLarge]];
    }
}

- (void)didSelectRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath {
    NSLog(@"%ld", (long)indexPath.row);
}

@end
