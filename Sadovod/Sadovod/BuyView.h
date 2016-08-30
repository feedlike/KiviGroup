//
//  BuyView.h
//  Sadovod
//
//  Created by Виктор Мишустин on 26/08/16.
//  Copyright © 2016 Виктор Мишустин. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BuyViewDelegate;

@interface BuyView : UIView

@property (weak, nonatomic) id <BuyViewDelegate> deleagte;

- (instancetype)initWithView: (UIView*) view
                     andData: (NSArray*) data;

@end

@protocol BuyViewDelegate <NSObject>

- (void) addCountOrder: (BuyView*) buyView;

- (void) hideCountOrder: (BuyView*) buyView;

@end