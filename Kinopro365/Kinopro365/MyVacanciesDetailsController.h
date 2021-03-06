//
//  MyVacanciesDetailsController.h
//  Kinopro365
//
//  Created by Мишустин Сергеевич on 02.03.17.
//  Copyright © 2017 kiviLab.com. All rights reserved.
//

#import "MainViewController.h"
#import "CustomButton.h"

@interface MyVacanciesDetailsController : MainViewController

@property (strong, nonatomic) NSString * vacancyID;
@property (strong, nonatomic) NSString * vacancyName;
@property (strong, nonatomic) NSString * vacancyURL;

@property (strong, nonatomic) NSString * profID;
@property (strong, nonatomic) NSString * profName;

@property (weak, nonatomic) IBOutlet UIScrollView *mainScrollView;
@property (weak, nonatomic) IBOutlet UIView *viewForPerson;
@property (weak, nonatomic) IBOutlet UITextView *mainTextView;
@property (weak, nonatomic) IBOutlet CustomButton *buttonAddText;
@property (weak, nonatomic) IBOutlet UIView *viewForMainText;
@property (weak, nonatomic) IBOutlet UIView *shadowView;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollViewForVacansies;

@property (weak, nonatomic) IBOutlet UIImageView *mainImageVacancies;
@property (weak, nonatomic) IBOutlet UILabel *titleVacancies;
@property (weak, nonatomic) IBOutlet UILabel *countryLabel;
@property (weak, nonatomic) IBOutlet UILabel *activelyLabel;
@property (weak, nonatomic) IBOutlet UILabel *labelNumberRecall;
@property (weak, nonatomic) IBOutlet UIImageView *imageHide;

- (IBAction)actionBackButton:(id)sender;
- (IBAction)actionButtonTextAdd:(CustomButton*)sender;
- (IBAction)actionEditButton:(id)sender;
- (IBAction)actionDeleteButton:(id)sender;


@end
