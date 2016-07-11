//
//  MVVMTestViewModel.m
//  MVVMTest
//
//  Created by HYG_IOS on 16/7/11.
//  Copyright © 2016年 magic. All rights reserved.
//

#import "MVVMTestViewModel.h"
#import "DataModel.h"

@interface MVVMTestViewModel ()

@property (nonatomic, assign) NSInteger random;

@property (nonatomic, strong) NSArray *nameArray;

@property (nonatomic, strong) NSArray *priceArray;

@property (nonatomic, strong) NSArray *imageUrlArray;

@end

@implementation MVVMTestViewModel
- (NSInteger)random{
    
    NSInteger from = 0;
    NSInteger to   = 4;
    
    return (NSInteger)(from + (arc4random() % (to - from + 1)));
    
}

- (NSArray *)nameArray{
    
    if (!_nameArray) {
        _nameArray = [NSArray array];
        _nameArray = @[@"端午节粽子大有优惠 买一增一",
                       @"端午节粽子大有优惠 买20增0",
                       @"端午节粽子大有优惠 买⑩增7",
                       @"端午节粽子大有优惠 买8增11",
                       @"端午节粽子大有优惠 买21增一"];
    }
    return _nameArray;
}

- (NSArray *)priceArray{
    
    if (!_priceArray) {
        _priceArray = [NSArray array];
        _priceArray = @[@"123.00",
                        @"893.00",
                        @"24.00",
                        @"12.00",
                        @"112.00"];
    }
    return _priceArray;
}
- (NSArray *)imageUrlArray{
    
    if (!_imageUrlArray) {
        _imageUrlArray = [NSArray array];
        _imageUrlArray = @[@"http://pic.5tu.cn/uploads/allimg/1606/pic_5tu_big_2016052901023305535.jpg",
                           @"http://pic.5tu.cn/uploads/allimg/1605/pic_5tu_big_2016052901023303745.jpg",
                           @"http://pic.5tu.cn/uploads/allimg/1605/pic_5tu_big_201605291711245481.jpg",
                           @"http://pic.5tu.cn/uploads/allimg/1605/pic_5tu_big_2016052901023285762.jpg",
                           @"http://pic.5tu.cn/uploads/allimg/1506/091630516760.jpg"];
    }
    return _imageUrlArray;
}


- (void)getDataModel{
    
    NSMutableArray *data = [NSMutableArray array];
    for (int i = 0; i<20; i++) {
        DataModel *model = [[DataModel alloc] init];
        model.m_name = self.nameArray[self.random];
        model.m_price = self.priceArray[self.random];
        model.m_imageUrl = self.imageUrlArray[self.random];
        [data addObject:model];
    }
    
    self.goodArrayData = data;
}
@end
