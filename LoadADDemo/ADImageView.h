//
//  ADImageView.h
//  HKHouse591
//
//  Created by Addcn on 16/6/29.
//  Copyright © 2016年 guojian. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^adPicClick)(void);

@interface ADImageView : UIImageView

@property (nonatomic, copy) adPicClick adPicTapClick;

@end
