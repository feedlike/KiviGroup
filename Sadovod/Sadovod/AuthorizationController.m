//
//  AuthorizationController.m
//  Sadovod
//
//  Created by Виктор Мишустин on 08/09/16.
//  Copyright © 2016 Виктор Мишустин. All rights reserved.
//

#import "AuthorizationController.h"
#import "CatalogController.h"
#import "AuthorizationView.h"
#import "SingleTone.h"
#import "CatalogController.h"
#import "RegistrationController.h"

@interface AuthorizationController () <AuthorizationViewDelegate>

@end

@implementation AuthorizationController

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    if ([[[SingleTone sharedManager] countType] isEqualToString:@"0"]) {
        self.mainViewOrder.alpha = 0.f;
    } else {
        if (![[[SingleTone sharedManager] typeMenu] isEqualToString:@"0"]) {
        self.mainViewOrder.alpha = 1.f;
        } else {
          self.mainViewOrder.alpha = 0.f;
        }
    }
}

- (void) viewDidLoad {
    [super viewDidLoad];
    
    if ([[[SingleTone sharedManager] typeMenu] isEqualToString:@"0"]) {
    [self setCustomTitle:@"Войти" andBarButtonAlpha: YES andButtonBasket: YES]; //Ввод заголовка
    } else {
       [self setCustomTitle:@"Профиль" andBarButtonAlpha: YES andButtonBasket: YES]; //Ввод заголовка 
    }
    //Кнопка Назад---------------------------------------------
    UIButton * buttonBack = [UIButton createButtonBack];
    [buttonBack addTarget:self action:@selector(buttonBackAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *mailbuttonBack =[[UIBarButtonItem alloc] initWithCustomView:buttonBack];
    self.navigationItem.leftBarButtonItem = mailbuttonBack;
    
#pragma mark - View
    
    AuthorizationView * mainView = [[AuthorizationView alloc] initWithView:self.view andData:nil];
    mainView.delegate = self;
    [self.view addSubview:mainView];
    
    [self createMainBasketWithCount:[[SingleTone sharedManager] countType] andPrice:@"5700"];
    if ([[[SingleTone sharedManager] countType]integerValue] == 0) {
        self.mainViewOrder.alpha = 0.f;
    } else {
        self.mainViewOrder.alpha = 1.f;
    }
    
}

#pragma mark - Actions

- (void) buttonBackAction {
    CatalogController * detail = [self.storyboard instantiateViewControllerWithIdentifier:@"CatalogController"];
    [self.navigationController pushViewController:detail animated:NO];
}

#pragma mark - AuthorizationViewDelegate

- (void) methodInput: (AuthorizationView*) authorizationView {
    [self buttonBackAction];
}

- (void) methodRegistration: (AuthorizationView*) authorizationView {
    RegistrationController * detail = [self.storyboard instantiateViewControllerWithIdentifier:@"RegistrationController"];
    [self.navigationController pushViewController:detail animated:NO];
}


@end