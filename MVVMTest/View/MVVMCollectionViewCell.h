//
//  MVVMCollectionViewCell.h
//  MVVMTest
//
//  Created by HYG_IOS on 16/7/11.
//  Copyright © 2016年 magic. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DataModel;

typedef void(^AddShoppingCarBlock)(void);
@interface MVVMCollectionViewCell : UICollectionViewCell

@property(nonatomic, strong) AddShoppingCarBlock addShoppingCarBlock;
@property(nonatomic, strong)  DataModel * model;

+ (CGFloat)getCellHeight;

@end
