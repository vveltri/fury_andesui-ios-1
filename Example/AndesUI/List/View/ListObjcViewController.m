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
    titleArray = [[NSMutableArray alloc] initWithObjects:@"AndesList 1 -- Andes Default Cell -- Andes Default Cell -- Andes Default Cell -- Andes Default Cell -- Andes Default Cell -- Andes Default Cell -- Andes Default Cell -- Andes Default Cell",
                  @"Titulo 2",
                  @"Titulo 3",
                  @"Titulo 4", nil];
    // Do any additional setup after loading the view from its nib.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

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
                             subTitle: @"Descripción de la fila"
                             thumbnail: thumbnail
                             numberOfLines: 2];
    
    AndesChevronCell *chevronCell = [[AndesChevronCell alloc]initWithTitle:[titleArray objectAtIndex:indexPath.row]
                                                                      size:AndesListSizeMedium
                                                                  subTitle:@"Descripción de la fila"
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
