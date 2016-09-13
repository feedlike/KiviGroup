//
//  RegistrationController.m
//  Sadovod
//
//  Created by Виктор Мишустин on 08/09/16.
//  Copyright © 2016 Виктор Мишустин. All rights reserved.
//

#import "RegistrationController.h"
#import "CatalogController.h"
#import "RegistrationView.h"
#import "SingleTone.h"

@implementation RegistrationController

- (void) viewDidLoad {
    [super viewDidLoad];
    if ([[[SingleTone sharedManager] typeMenu] isEqualToString:@"0"]) {
    [self setCustomTitle:@"Регистрация" andBarButtonAlpha: YES andButtonBasket: YES]; //Ввод заголовка
    } else {
    [self setCustomTitle:@"Мои заказы" andBarButtonAlpha: YES andButtonBasket: YES]; //Ввод заголовка
    }
    //Кнопка Назад---------------------------------------------
    UIButton * buttonBack = [UIButton createButtonBack];
    [buttonBack addTarget:self action:@selector(buttonBackAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *mailbuttonBack =[[UIBarButtonItem alloc] initWithCustomView:buttonBack];
    self.navigationItem.leftBarButtonItem = mailbuttonBack;
    
#pragma mark - View
    
    RegistrationView * mainView = [[RegistrationView alloc] initWithView:self.view andData:nil];
    [self.view addSubview:mainView];
    
}

#pragma mark - Actions

- (void) buttonBackAction {
    CatalogController * detail = [self.storyboard instantiateViewControllerWithIdentifier:@"CatalogController"];
    [self.navigationController pushViewController:detail animated:NO];
}

@end
