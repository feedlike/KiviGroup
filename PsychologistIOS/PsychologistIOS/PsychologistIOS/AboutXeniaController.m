//
//  AboutXeniaController.m
//  PsychologistIOS
//
//  Created by Viktor on 10.04.16.
//  Copyright © 2016 KiviLab. All rights reserved.
//

#import "AboutXeniaController.h"
#import "SWRevealViewController.h"
#import "UIColor+HexColor.h"
#import "Macros.h"
#import "TitleClass.h"
#import "SubCategoryView.h"
#import "AboutXeniaView.h"
#import "RecommendController.h"

@implementation AboutXeniaController

- (void) viewDidLoad
{
#pragma mark - Header
    
    self.navigationController.navigationBarHidden = NO;
    //Заголовок-----------------------------------------------
    TitleClass * title = [[TitleClass alloc]initWithTitle:@"О КСЕНИИ"];
    self.navigationItem.titleView = title;
    
    //Задаем цвет бара----------------------------------------
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithHexString:@"d46559"];
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    
    //Пареметры кнопки меню------------------------------------
    UIImage *imageBarButton = [UIImage imageNamed:@"menuIcon.png"];
    [_buttonMenu setImage:imageBarButton];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.bounds = CGRectMake(0, 0, 32, 24);
    CGRect rect = button.frame;
    rect.origin.y += 16;
    button.frame = rect;
    [button setImage:imageBarButton forState:UIControlStateNormal];
    [button addTarget:self.revealViewController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    _buttonMenu.customView=button;
    //    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
#pragma mark - Initialization View
    
    //Задаем бэкграугд---------------------------
    SubCategoryView * background = [[SubCategoryView alloc] initWithBackgroundView:self.view];
    [self.view addSubview:background];
    
    //Основной вью контент-----------------------
    AboutXeniaView * mainContentView = [[AboutXeniaView alloc] initWithView:self.view];
    [self.view addSubview:mainContentView];
    
    //Нотификация перехода в рекомендуемые-------
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationPushWithRecommend) name:NOTIFICATION_PUSH_ABOUT_XENIA_WITH_RECOMMEND object:nil];

}

#pragma mark - ACTION METHODS

//Действие метода нотификации перехода в рекомендуеммые
- (void) notificationPushWithRecommend
{
    RecommendController * detail = [self.storyboard instantiateViewControllerWithIdentifier:@"RecommendController"];
    [self.navigationController pushViewController:detail animated:YES];
}

#pragma mark - DEALLOC
- (void) dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end