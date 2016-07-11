//
//  DataModel.h
//  MVVMTest
//
//  Created by HYG_IOS on 16/7/11.
//  Copyright © 2016年 magic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject

@property(nonatomic, copy) NSString * m_imageUrl;/**<商品图片*/
@property(nonatomic, copy) NSString * m_name;/**<商品名*/
@property(nonatomic, copy) NSString * m_price;/**<商品价格*/

@end
