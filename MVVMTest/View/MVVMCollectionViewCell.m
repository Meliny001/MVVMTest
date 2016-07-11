//
//  MVVMCollectionViewCell.m
//  MVVMTest
//
//  Created by HYG_IOS on 16/7/11.
//  Copyright © 2016年 magic. All rights reserved.
//

#import "MVVMCollectionViewCell.h"
#import "DataModel.h"

@interface MVVMCollectionViewCell ()

@property (nonatomic,weak) UIImageView * imageView;
@property (nonatomic,weak) UILabel * name;
@property (nonatomic,weak) UIButton * addShoppingBtn;

@end

@implementation MVVMCollectionViewCell

- (void)awakeFromNib
{
    //1.创建UI
    [self setInitView];
    //2.设置约束
    [self setAutoLayout];
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        //1.创建UI
        [self setInitView];
        //2.设置约束
        [self setAutoLayout];
    }
    return self;
}

- (void)setInitView
{
    //1.商品图片
    UIImageView * imageView = [UIImageView new];
    _imageView = imageView;
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:_imageView];
    
    //2.商品名
    UILabel * label = [UILabel new];
    _name = label;
    _name.font = [UIFont systemFontOfSize:15.0f];
    [self.contentView addSubview:_name];
    
    //3.加入购物车按钮
    UIButton * btn = [UIButton new];
    _addShoppingBtn  = btn;
    [_addShoppingBtn addTarget:self action:@selector(addBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [_addShoppingBtn setImage:[UIImage imageNamed:@"js_addcart"]
                    forState:UIControlStateNormal];
    [self.contentView addSubview:_addShoppingBtn];
}
- (void)setAutoLayout
{
    //1.商品图片
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(5);
        make.left.mas_equalTo(5);
        make.right.mas_equalTo(-5);
        make.height.mas_equalTo(self.width - 10);
    }];
    
    //2.商品名
    [_name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_imageView.mas_bottom).with.offset(0);
        make.left.mas_equalTo(3);
        make.right.mas_equalTo(-3);
    }];
    
    //3.加入购物车按钮
    [_addShoppingBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-5);
        make.right.mas_equalTo(-5);
    }];

    [self layoutSubviews];
}

- (void)addBtnClicked
{
    if (self.addShoppingCarBlock) {
        self.addShoppingCarBlock();
    }
}

- (void)setModel:(DataModel *)model
{
    [_imageView sd_setImageWithURL:[NSURL URLWithString:model.m_imageUrl] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (cacheType == SDImageCacheTypeNone || cacheType == SDImageCacheTypeDisk) {
            _imageView.image = image;
            _imageView.alpha = 0;
            _imageView.scale = 1.25;
            [UIView animateWithDuration:0.4
                             animations:^{
                                 _imageView.alpha = 1;
                                 _imageView.scale = 1;
                             }];
        } else {
            _imageView.image = image;
            _imageView.alpha = 1;
            _imageView.scale = 1;
        }
    }];
    _name.text = model.m_name;
    
}
+ (CGFloat)getCellHeight
{
    return (((ZGWindowWidth-15)/2)+65);
}
@end
