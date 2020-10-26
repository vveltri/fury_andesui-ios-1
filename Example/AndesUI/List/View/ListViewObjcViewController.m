//
//  ListViewObjcViewController.m
//  AndesUI-demoapp
//
//  Created by Jonathan Alonso Pinto on 21/10/20.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

#import "ListViewObjcViewController.h"
#import <AndesUI-Swift.h>

@interface ListViewObjcViewController ()
@property (weak, nonatomic) IBOutlet AndesListView *listView;

@end

@implementation ListViewObjcViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _listView.delegate = self;
    _listView.dataSource = self;
    _listView.separatorStyle = AndesSeparatorStyleListViewSingleLine;
    titleArray = [[NSMutableArray alloc] initWithObjects:@"AndesList 1 -- Andes Default Cell -- Andes Default Cell -- Andes Default Cell -- Andes Default Cell -- Andes Default Cell -- Andes Default Cell -- Andes Default Cell -- Andes Default Cell",
                  @"Titulo 2",
                  @"Titulo 3",
                  @"Titulo 4", nil];
    
    _listView.numberOfRows = titleArray.count;
    [_listView reloadData];
    
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

- (AndesListViewCell * _Nonnull)andesListView:(AndesListView * _Nonnull)tableView cellForRowAt:(NSIndexPath * _Nonnull)indexPath {
    AndesSimpleViewCellConfig *cell = [[AndesSimpleViewCellConfig alloc]
                                        initWithTitle:[titleArray objectAtIndex:indexPath.row]
                                        size:AndesListSizeLarge
                                        subTitle: @"Descripción de la fila"];
    return cell;
}


@end
