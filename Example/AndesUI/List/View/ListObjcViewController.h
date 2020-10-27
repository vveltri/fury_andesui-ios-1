//
//  ListViewObjcViewController.h
//  AndesUI-demoapp
//
//  Created by Jonathan Alonso Pinto on 21/10/20.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AndesUI-Swift.h>

NS_ASSUME_NONNULL_BEGIN

@interface ListObjcViewController : UIViewController <AndesListViewDataSource, AndesListViewDelegate> {
    NSMutableArray *titleArray;
}

@end

NS_ASSUME_NONNULL_END
