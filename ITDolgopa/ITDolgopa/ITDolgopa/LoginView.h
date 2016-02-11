//
//  LoginView.h
//  ITDolgopa
//
//  Created by Viktor on 05.02.16.
//  Copyright © 2016 datastore24. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString* const LoginViewAnimationLeftNotification;
extern NSString* const LoginViewAnimationWriteNotification;

@interface LoginView : UIView

- (instancetype)initWithView: (UIView*) view;

@end