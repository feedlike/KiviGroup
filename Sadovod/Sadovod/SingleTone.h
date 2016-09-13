//
//  SingleTone.h
//  Sadovod
//
//  Created by Кирилл Ковыршин on 18.01.16.
//  Copyright © 2016 Viktor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SingleTone : NSObject

@property (strong,nonatomic) NSString* superKey;
@property (strong,nonatomic) NSString* catalogKey;
@property (strong, nonatomic) NSString * typeMenu;

+ (id)sharedManager;

@end
