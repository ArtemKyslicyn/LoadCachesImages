//
//  ImagesView.m
//  LightImageShowing
//
//  Created by Artem Kislitsyn on 2/2/14.
//  Copyright (c) 2014 Artem Kislitsyn. All rights reserved.
//

#import "ImagesView.h"
const float kDeleteButtonCacheHeight  = 40;
const float kDeleteButtonCacheWidth  = 80;
const float kDeleteButtonOffsetFromTable  = 10;
@implementation ImagesView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self createTableView];
        [self createButton];
    }
    return self;
}

-(void)createTableView{
    
    _tableView = [[UITableView alloc] init];
    _tableView.bounces = NO;
    _tableView.separatorColor = [[UIColor darkGrayColor] colorWithAlphaComponent:0.3f];
    [self addSubview:_tableView];
    
    if ([_tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [_tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    
}

-(void)createButton{
    _deleteCacheButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_deleteCacheButton setTitle:@"Delete Cache" forState:UIControlStateNormal];
    [self addSubview:_deleteCacheButton];
    
}

-(void)layoutSubviews{
    [super layoutSubviews];
    _tableView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height - kDeleteButtonCacheHeight-kDeleteButtonOffsetFromTable);
    
    _deleteCacheButton.frame = CGRectMake(self.frame.size.width/2-kDeleteButtonCacheWidth/2,
                                          _tableView.frame.origin.y+_tableView.frame.size.height+kDeleteButtonOffsetFromTable,
                                           kDeleteButtonCacheWidth,
                                           kDeleteButtonCacheHeight);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
