//
//  ListViewObjcViewController.m
//  AndesUI-demoapp
//
//  Created by Jonathan Alonso Pinto on 21/10/20.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

#import "ListObjcViewController.h"
#import <AndesUI-Swift.h>

@interface ListObjcViewController ()
@property (weak, nonatomic) IBOutlet AndesList *listView;

@end

@implementation ListObjcViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _listView.delegate = self;
    _listView.dataSource = self;
    _listView.separatorStyle = AndesSeparatorStyleSingleLine;
    titleArray = [[NSMutableArray alloc] initWithObjects:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                  @"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                  @"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                  @"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", nil];
}

- (AndesListCell * _Nonnull)andesList:(AndesList * _Nonnull)tableView cellForRowAt:(NSIndexPath * _Nonnull)indexPath {
    
    AndesThumbnail *thumbnail = [[AndesThumbnail alloc]initWithHierarchy:AndesThumbnailHierarchyLoud
                                                                    type:AndesThumbnailTypeIcon
                                                                    size:AndesThumbnailSizeSize24
                                                                   state:AndesThumbnailStateEnabled
                                                                   image:[UIImage imageNamed:@"andes"]
                                                             accentColor:[UIColor clearColor]];
    
    AndesSimpleCell *cell = [[AndesSimpleCell alloc]
                             initWithTitle:[titleArray objectAtIndex:indexPath.row]
                             size:AndesListSizeLarge
                             subTitle: @"Lorem ipsum dolor sit amet"
                             thumbnail: thumbnail
                             numberOfLines: 2];
    
    AndesChevronCell *chevronCell = [[AndesChevronCell alloc]initWithTitle:[titleArray objectAtIndex:indexPath.row]
                                                                      size:AndesListSizeMedium
                                                                  subTitle:@"Lorem ipsum dolor sit amet"
                                                                 thumbnail:thumbnail
                                                             numberOfLines: 0];
    
    
    return cell;
}

- (NSInteger)andesList:(AndesList * _Nonnull)listView numberOfRowsInSection:(NSInteger)section {
    return titleArray.count;
}


- (NSInteger)numberOfSections:(AndesList * _Nonnull)listView {
    return 1;
}

@end
