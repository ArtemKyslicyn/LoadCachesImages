//
//  ImagesViewController.m
//  LightImageShowing
//
//  Created by Artem Kislitsyn on 2/2/14.
//  Copyright (c) 2014 Artem Kislitsyn. All rights reserved.
//

#import "ImagesViewController.h"
#import  "ImagesView.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface ImagesViewController ()

@end

@implementation ImagesViewController{
    NSArray * _imagesURLStringsArray;
    ImagesView *_view;
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self initData];
    }
    return self;
}

-(void)loadView{
   _view = [[ImagesView alloc] init];
	self.view = _view;
}

-(void)initData{
     _imagesURLStringsArray = @[@"http://upload.wikimedia.org/wikipedia/commons/f/fa/T-72_Ajeya1.jpg",@"http://upload.wikimedia.org/wikipedia/commons/f/fa/T-72_Ajeya1.jpg"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _view.tableView.delegate = self;
    _view.tableView.dataSource = self;
    [_view.deleteCacheButton addTarget:self action:@selector(deleteCacheAction:) forControlEvents:UIControlEventTouchUpInside];
	// Do any additional setup after loading the view.
}

-(void)deleteCacheAction:(UIButton*)button{
    SDImageCache *imageCache = [SDImageCache sharedImageCache];
    [imageCache clearMemory];
    [imageCache clearDisk];
    [imageCache cleanDisk];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;    //count of section
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [_imagesURLStringsArray count];    //count number of row from counting array hear cataGorry is An Array
}



- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"MyIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier:MyIdentifier] ;
    }
    
    
    
    cell.textLabel.text = @"My Text";
    NSString * imageUrlString = [_imagesURLStringsArray objectAtIndex:indexPath.row];
    NSURL * imageUrl = [NSURL URLWithString:imageUrlString];
    
    [cell.imageView setImageWithURL:imageUrl
                   placeholderImage:[UIImage imageNamed:@"placeholder.png"]];

    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
