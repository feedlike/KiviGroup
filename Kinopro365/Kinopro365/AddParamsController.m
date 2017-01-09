//
//  AddParamsController.m
//  Kinopro365
//
//  Created by Виктор Мишустин on 20.12.16.
//  Copyright © 2016 kiviLab.com. All rights reserved.
//

#import "AddParamsController.h"
#import "AddParamsModel.h"
#import "ChooseProfessionViewController.h"
#import "SingleTone.h"

@interface AddParamsController () <ChooseProfessionViewControllerDelegate>

@end

@implementation AddParamsController

- (void) loadView {
    [super loadView];
    
    [self.navigationController setNavigationBarHidden: NO animated:YES];
    self.mainTopView.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    self.mainTopView.layer.shadowOffset = CGSizeMake(0.0f, 1.0f);
    self.mainTopView.layer.shadowOpacity = 1.0f;
    self.mainTopView.layer.shadowRadius = 4.0f;
    
    self.buttonSave.layer.cornerRadius = 5.f;
    
    UILabel * CustomText = [[UILabel alloc]initWithTitle:@"Доп. параметры"];
    self.navigationItem.titleView = CustomText;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)actionBackBarButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)actionButtonsChooseParams:(UIButton *)sender {
    
    for (int i = 0; i < self.buttonsChooseParams.count; i++) {
       
        UIButton * buttonParams = [self.buttonsChooseParams objectAtIndex:i];
        if ([buttonParams isEqual:sender]) {
            NSArray * needArray = [[AddParamsModel setArrayHeight] objectAtIndex:i];
            NSString * alertTitl = [[AddParamsModel setArrayTitl] objectAtIndex:i];
            [self showViewPickerWithButton:sender andTitl:alertTitl andArrayData:needArray];
        }
    }
}

- (IBAction)actionButtonLanguages:(UIButton *)sender {
    
    ChooseProfessionViewController * detai = [self.storyboard
                                              instantiateViewControllerWithIdentifier:@"ChooseProfessionViewController"];
    detai.mainArrayData = [AddParamsModel setArrayData];
    [[SingleTone sharedManager] setProfessionControllerCode:@"1"];
    detai.delegate = self;
    [self.navigationController pushViewController:detai animated:YES];
    
}

- (IBAction)actionButtonInternationalPass:(id)sender {
    
    for (UIButton * button in self.buttonsInternationalPass) {
        if ([button isEqual:sender]) {
            [UIView animateWithDuration:0.3 animations:^{
                button.titleLabel.font = [UIFont fontWithName:FONT_ISTOK_BOLD size:button.titleLabel.font.pointSize];
                [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                button.userInteractionEnabled = NO;
            }];
        } else {
            [UIView animateWithDuration:0.3 animations:^{
                button.titleLabel.font = [UIFont fontWithName:FONT_ISTOK_REGULAR size:button.titleLabel.font.pointSize];
                [button setTitleColor:[UIColor hx_colorWithHexRGBAString:COLOR_PLACEHOLDER] forState:UIControlStateNormal];
                button.userInteractionEnabled = YES;
            }];
        }
    }
}

- (IBAction)actionButtonSave:(UIButton *)sender {
    [self createActivitiIndicatorAlertWithView];
    [self performSelector:@selector(testMethod) withObject:nil afterDelay:3.f];
}

#pragma mark - ChooseProfessionalViewControllerDelegate

- (void) setTitlForButtonDelegate: (ChooseProfessionViewController*) chooseProfessionViewController
                         withTitl: (NSString*) titl {
    
    [self.buttonLanguages setTitle:titl forState:UIControlStateNormal];    
    
}

#pragma mark - Other

- (void) testMethod {
    [self deleteActivitiIndicator];
}

@end