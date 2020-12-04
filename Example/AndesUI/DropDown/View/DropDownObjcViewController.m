//
//  DropDownObjcViewController.m
//  AndesUI-demoapp
//
//  Created by Jonathan Alonso Pinto on 30/11/20.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

#import "DropDownObjcViewController.h"

@interface DropDownObjcViewController () <AndesTextFieldDelegate>

@property(weak, nonatomic) IBOutlet AndesDropdown *andesDropdown;
@property(weak, nonatomic) IBOutlet AndesRadioButton *radioButtonForm;
@property(weak, nonatomic) IBOutlet AndesRadioButton *radioButtonStandAlone;
@property(weak, nonatomic) IBOutlet AndesTextField *textField;
@property(weak, nonatomic) IBOutlet AndesTextField *placelholderField;
@property(weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

@property(nonatomic) AndesDropDownMenuCell *cell;
@property(nonatomic) NSMutableArray *cellArray;

@end

@implementation DropDownObjcViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _textField.delegate = self;
    _placelholderField.delegate = self;
    [_segmentedControl setEnabled:false];
    
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
        _textField.state = AndesTextInputStateIdle;
        _placelholderField.state = AndesTextInputStateIdle;
        [_segmentedControl setEnabled:false];
        [self updateFormDropdownView:@"" placeholder:@"Placeholder para Dropdown"];
    }
    else if (radioButton == _radioButtonStandAlone) {
        _radioButtonForm.status = AndesRadioButtonStatusUnselected;
        _radioButtonStandAlone.status = AndesRadioButtonStatusSelected;
        _textField.state = AndesTextInputStateDisabled;
        _placelholderField.state = AndesTextInputStateDisabled;
        [_segmentedControl setEnabled:true];
        [self updateStandaloneDropdownView:AndesTextSizeMedium];
    }
    _textField.text = @"";
    _placelholderField.text = @"";
    _segmentedControl.selectedSegmentIndex = 1;
}

- (void)didSelectRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath {
    NSLog(@"%ld", (long)indexPath.row);
}

- (void)updateFormDropdownView:(NSString *)title placeholder: (NSString *)placeholder  {
    [_andesDropdown setTriggerType:[[FormDropdownTrigger alloc]initWithTitle:title placeholder:placeholder]];
}

- (void)updateStandaloneDropdownView:(AndesTextSize)size {
    [_andesDropdown setTriggerType:[[StandaloneDropdownTrigger alloc]initWithSize:size]];
}

- (IBAction)valueChangeSegmented {
    if (_segmentedControl.selectedSegmentIndex == 0) {
        [self updateStandaloneDropdownView:AndesTextSizeSmall];
    } else if (_segmentedControl.selectedSegmentIndex == 1) {
        [self updateStandaloneDropdownView:AndesTextSizeMedium];
    } else {
        [self updateStandaloneDropdownView:AndesTextSizeLarge];
    }
}

- (void)andesTextFieldDidEndEditing:(AndesTextField *)textField {
    if ([_andesDropdown.triggerType isMemberOfClass:[FormDropdownTrigger class]]) {
        [self updateFormDropdownView:_textField.text placeholder:_placelholderField.text];
    }
    else {
        [self updateStandaloneDropdownView:AndesTextSizeMedium];
    }
}

@end
