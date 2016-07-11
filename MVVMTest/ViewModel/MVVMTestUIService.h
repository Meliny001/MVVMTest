//
//  MVVMTestUIService.h
//  MVVMTest
//
//  Created by HYG_IOS on 16/7/11.
//  Copyright © 2016年 magic. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MVVMTestViewModel;

@interface MVVMTestUIService : NSObject
<
UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout
>

@property(nonatomic, strong) MVVMTestViewModel * viewModel;

@end
