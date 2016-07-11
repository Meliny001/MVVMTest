//
//  ViewController.m
//  MVVMTest
//
//  Created by HYG_IOS on 16/7/11.
//  Copyright © 2016年 magic. All rights reserved.
//

#import "ViewController.h"

#import "MVVMTestUIService.h"
#import "MVVMTestViewModel.h"

@interface ViewController ()

@property(nonatomic,strong) UICollectionView * collectionView;
@property(nonatomic,strong) MVVMTestUIService * service;
@property(nonatomic,strong) MVVMTestViewModel * viewModel;

@end

@implementation ViewController

#pragma mark - lazyMethod
- (MVVMTestUIService *)service
{
    if (!_service) {
        _service = [[MVVMTestUIService alloc]init];
        _service.viewModel = self.viewModel;
    }
    return _service;
}
- (MVVMTestViewModel *)viewModel
{
    if (!_viewModel) {
        _viewModel = [[MVVMTestViewModel alloc]init];
    }
    return _viewModel;
}
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
        _collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
        _collectionView.dataSource = self.service;
        _collectionView.delegate = self.service;
        [_collectionView registerClass:NSClassFromString(@"MVVMCollectionViewCell") forCellWithReuseIdentifier:@"MVVMCollectionViewCell"];
        _collectionView.backgroundColor = [UIColor whiteColor];
        
    }
    return _collectionView;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.viewModel getDataModel];
    [self.collectionView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = YES;
    [self.view addSubview:self.collectionView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
