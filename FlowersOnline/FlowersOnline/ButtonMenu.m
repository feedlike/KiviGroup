//
//  ButtonMenu.m
//  FlowersOnline
//
//  Created by Viktor on 30.04.16.
//  Copyright © 2016 datastore24. All rights reserved.
//

#import "ButtonMenu.h"

@implementation ButtonMenu

+ (UIButton*) createButtonMenu
{
    UIImage *imageBarButton = [UIImage imageNamed:@"IconButtonMenu.png"];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.bounds = CGRectMake(0, 0, 17, 14);
    CGRect rect = button.frame;
    rect.origin.y += 16;
    button.frame = rect;
    [button setImage:imageBarButton forState:UIControlStateNormal];
    
    return button;
}

+ (UIButton*) createButtonRegistrationWithName: (NSString*) title
                                andColor: (NSString*) color
                               andPointY: (CGFloat) pointY
                                 andView: (UIView*) view
{
    UIButton * buttonRegistration = [UIButton buttonWithType:UIButtonTypeSystem];
    buttonRegistration.frame = CGRectMake(20, pointY, view.frame.size.width - 40, 60);
    buttonRegistration.layer.borderColor = [UIColor colorWithHexString:COLORGRAY].CGColor;
    buttonRegistration.layer.borderWidth = 1.f;
    buttonRegistration.layer.cornerRadius = 30;
    buttonRegistration.backgroundColor = [[UIColor colorWithHexString:color] colorWithAlphaComponent:0.5];
    [buttonRegistration setTitle:title forState:UIControlStateNormal];
    [buttonRegistration setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    buttonRegistration.titleLabel.font = [UIFont fontWithName:FONTBOND size:17];
    
    return buttonRegistration;
}

@end
