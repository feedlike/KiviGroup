//
//  RecommendView.m
//  PsychologistIOS
//
//  Created by Viktor on 10.04.16.
//  Copyright © 2016 KiviLab. All rights reserved.
//

#import "RecommendView.h"
#import "UIColor+HexColor.h"
#import "Macros.h"
#import <AKPickerView/AKPickerView.h>

@interface RecommendView () <UITableViewDataSource, UITableViewDelegate, AKPickerViewDataSource, AKPickerViewDelegate>

@end

@implementation RecommendView
{
    UITableView * mainTableViewRecommend;
    
    //Массив кнопок------------------------
    NSMutableArray * arrayButtons;
    NSArray * arrayBool;
    NSInteger customTagCallButton;
    NSInteger customTagBackCallButton;
    
    //Алерт
    UIView * darkView;
    UIView * alertViewRecommend;
    UITextField * textFieldPhone;
    UILabel * labelPlaceHolderPhone;
    BOOL isBool;
    AKPickerView * pickerAlert;
    NSArray * titles;
    NSInteger row;
}

- (instancetype)initWithView: (UIView*) view andArray: (NSMutableArray*) array;
{
    self = [super init];
    if (self) {
        
        self.frame = CGRectMake(0, 0, view.frame.size.width, view.frame.size.height - 64);
        
        arrayButtons = [[NSMutableArray alloc] init];
        arrayBool = [NSArray arrayWithObjects:[NSNumber numberWithBool:NO], [NSNumber numberWithBool:YES],
                                              [NSNumber numberWithBool:YES], [NSNumber numberWithBool:NO], nil];
        customTagCallButton = 0;
        customTagBackCallButton = 0;
        isBool = YES;
        
        mainTableViewRecommend = [[UITableView alloc] initWithFrame:CGRectMake(0, 24, self.frame.size.width, self.frame.size.height - 24) style:UITableViewStylePlain];
        //Убираем полосы разделяющие ячейки------------------------------
        mainTableViewRecommend.separatorStyle = UITableViewCellSeparatorStyleNone;
        mainTableViewRecommend.dataSource = self;
        mainTableViewRecommend.delegate = self;
        mainTableViewRecommend.showsVerticalScrollIndicator = NO;
        //Очень полездное свойство, отключает дествие ячейки-------------
        mainTableViewRecommend.allowsSelection = NO;
        [self addSubview:mainTableViewRecommend];
        
#pragma mark - Create Alert
        
        //Затемнение-----------------------------------------------------
        darkView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        darkView.backgroundColor = [UIColor blackColor];
        darkView.alpha = 0.0;
        [self addSubview:darkView];
        
        //Создаем алерт---------------------------------------------------
        alertViewRecommend = [[UIView alloc] initWithFrame:CGRectMake(self.frame.size.width / 2 - 192, -600, 384, 368)];
        if (isiPhone6) {
            alertViewRecommend.frame = CGRectMake(self.frame.size.width / 2 - 162, -600, 324, 368);
        }
        alertViewRecommend.layer.cornerRadius = 5.f;
        alertViewRecommend.backgroundColor = [UIColor whiteColor];
        alertViewRecommend.userInteractionEnabled = YES;
        [self addSubview:alertViewRecommend];
        
        //Кнопка отмены--------------------------------------------------
        UIButton * buttonCancelRecommend = [UIButton buttonWithType:UIButtonTypeCustom];
        buttonCancelRecommend.frame = CGRectMake(10, 10, 24, 24);
        UIImage *btnImage = [UIImage imageNamed:@"imageCancel.png"];
        [buttonCancelRecommend setImage:btnImage forState:UIControlStateNormal];
        [buttonCancelRecommend addTarget:self action:@selector(buttonCancelAction) forControlEvents:UIControlEventTouchUpInside];
        [alertViewRecommend addSubview:buttonCancelRecommend];
        
        //Основной текст-------------------------------------------------
        UILabel * mainLabelText = [[UILabel alloc] initWithFrame:CGRectMake(32, 24, alertViewRecommend.frame.size.width - 64, 80)];
        mainLabelText.numberOfLines = 0;
        mainLabelText.text = @"Введите номер телефона и укажите время в которое вы хотите получить консультацию наших специалистов";
        mainLabelText.textColor = [UIColor colorWithHexString:@"4b4a4a"];
        mainLabelText.font = [UIFont fontWithName:FONTREGULAR size:14];
        [alertViewRecommend addSubview:mainLabelText];
        
        //Вью для телевона------------------------------------------------
        UIView * viewPhone = [[UIView alloc] initWithFrame:CGRectMake(32, 152, alertViewRecommend.frame.size.width - 64, 48)];
        if (isiPhone6) {
            viewPhone.frame = CGRectMake(32, 152, alertViewRecommend.frame.size.width - 64, 40);
        }
        viewPhone.layer.cornerRadius = 10.f;
        viewPhone.layer.borderColor = [UIColor colorWithHexString:@"a6a6a6"].CGColor;
        viewPhone.layer.borderWidth = 0.4f;
        [alertViewRecommend addSubview:viewPhone];
        
        //Ввод телефона-----------------------------------------------------------------
        textFieldPhone = [[UITextField alloc] initWithFrame:CGRectMake(24, 0, viewPhone.frame.size.width - 48, viewPhone.frame.size.height)];
        textFieldPhone.delegate = self;
        textFieldPhone.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
        textFieldPhone.autocorrectionType = UITextAutocorrectionTypeNo;
        textFieldPhone.font = [UIFont fontWithName:FONTREGULAR size:19];
        textFieldPhone.textColor = [UIColor colorWithHexString:@"a6a6a6"];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(animationLabelPhone:) name:UITextFieldTextDidChangeNotification object:textFieldPhone];
        [viewPhone addSubview:textFieldPhone];
        
        //Плэйс холдер телефона----------------------------------------------------------
        labelPlaceHolderPhone = [[UILabel alloc] initWithFrame:CGRectMake(24, 0, viewPhone.frame.size.width - 48, viewPhone.frame.size.height)];
        labelPlaceHolderPhone.tag = 3022;
        labelPlaceHolderPhone.text = @"Номер телефона";
        labelPlaceHolderPhone.textColor = [UIColor colorWithHexString:@"a6a6a6"];
        labelPlaceHolderPhone.font = [UIFont fontWithName:FONTREGULAR size:19];
        [viewPhone addSubview:labelPlaceHolderPhone];
        
        //Заголовок предпочитаемое время-------------------------------------------------
        UILabel * labelTime = [[UILabel alloc] initWithFrame:CGRectMake(0, viewPhone.frame.size.height + viewPhone.frame.origin.y + 16, alertViewRecommend.frame.size.width, 16)];
        labelTime.text = @"Предпочитаемое время";
        labelTime.textColor = [UIColor colorWithHexString:@"9f9f9f"];
        labelTime.textAlignment = NSTextAlignmentCenter;
        labelTime.font = [UIFont fontWithName:FONTREGULAR size:13];
        [alertViewRecommend addSubview:labelTime];
        
        //Вью предпочитаемое время--------------------------------------------------------
        UIView * viewTime = [[UIView alloc] initWithFrame:CGRectMake(alertViewRecommend.frame.size.width / 2 - 40, labelTime.frame.size.height + labelTime.frame.origin.y + 12, 80, 40)];
        viewTime.layer.cornerRadius = 8.f;
        viewTime.layer.borderColor = [UIColor colorWithHexString:@"a6a6a6"].CGColor;
        viewTime.layer.borderWidth = 0.4f;
        viewTime.backgroundColor = nil;
        [alertViewRecommend addSubview:viewTime];
        
        //Пикер------------------------------------------------------------------------------
        pickerAlert = [[AKPickerView alloc] initWithFrame:CGRectMake(32, labelTime.frame.size.height + labelTime.frame.origin.y + 8, alertViewRecommend.frame.size.width - 64, 48)];
        pickerAlert.dataSource = self;
        pickerAlert.delegate = self;
        pickerAlert.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [alertViewRecommend addSubview:pickerAlert];
        pickerAlert.font = [UIFont fontWithName:FONTLITE size:20];
        pickerAlert.highlightedFont = [UIFont fontWithName:FONTREGULAR size:20];
        pickerAlert.textColor = [UIColor colorWithHexString:@"9f9f9f"];
        pickerAlert.highlightedTextColor = [UIColor colorWithHexString:@"9f9f9f"];
        pickerAlert.interitemSpacing = 20.0;
        pickerAlert.fisheyeFactor = 0.001;
        pickerAlert.pickerViewStyle = AKPickerViewStyle3D;
        pickerAlert.maskDisabled = false;
        titles = @[@"12:00",
                   @"12:20",
                   @"12:40",
                   @"13:00",
                   @"13:20",
                   @"13:40",
                   @"14:20",
                   @"14:40",
                   @"15:20",
                   @"15:40"];
        
        [pickerAlert reloadData];
        NSInteger intCount = 3;
        [pickerAlert selectItem:intCount animated:NO];
        
        //Кнопка отправить-----------------------------------------------------
        //Кнопка открыть категорию--------------------------------------
        UIButton * buttonSend = [UIButton buttonWithType:UIButtonTypeSystem];
        buttonSend.frame = CGRectMake(40, pickerAlert.frame.origin.y + pickerAlert.frame.size.height + 16, alertViewRecommend.frame.size.width - 80, 48);
        buttonSend.backgroundColor = [UIColor colorWithHexString:@"44d05c"];
        buttonSend.layer.cornerRadius = 25;
        if (isiPhone6) {
            buttonSend.frame = CGRectMake(40, pickerAlert.frame.origin.y + pickerAlert.frame.size.height + 16, alertViewRecommend.frame.size.width - 80, 40);
            buttonSend.layer.cornerRadius = 20;
        }
        buttonSend.layer.borderColor = [UIColor colorWithHexString:@"a6a6a6"].CGColor;
        buttonSend.layer.borderWidth = 1.f;
        [buttonSend setTitle:@"ОТПРАВИТЬ" forState:UIControlStateNormal];
        [buttonSend setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [buttonSend addTarget:self action:@selector(buttonSendAction) forControlEvents:UIControlEventTouchUpInside];
        [alertViewRecommend addSubview:buttonSend];
        
        
        
    }
    return self;
}

- (UIView*) setTableCellWithImage: (NSString*) image
                         andTitle: (NSString*) title
                      andSubTitle: (NSString*) subTitle
                          ansSite: (NSString*) site
                          andMail: (NSString*) mail
                     andButtonTag: (NSInteger) buttonTag
                       andBoolParams: (BOOL) boolPrams
{
    //Основное вью ячейки-----------------------------------------
    UIView * viewCell = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 144)];
    
    //Картинка ячейки---------------------------------------------
    UIImageView * imageViewCell = [[UIImageView alloc] initWithFrame:CGRectMake(32, 16, 80, 80)];
    imageViewCell.image = [UIImage imageNamed:image];
    [viewCell addSubview:imageViewCell];
    
    //Заголовок---------------------------------------------------
    UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(144, 16, 200, 24)];
    titleLabel.text = title;
    titleLabel.textColor = [UIColor colorWithHexString:@"8a8a8a"];
    titleLabel.font = [UIFont fontWithName:FONTREGULAR size:22];
    [viewCell addSubview:titleLabel];
    
    //Подзаголовок-----------------------------------------------
    UILabel * subTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(144, 40, 200, 16)];
    subTitleLabel.text = subTitle;
    subTitleLabel.textColor = [UIColor colorWithHexString:@"f26e6e"];
    subTitleLabel.font = [UIFont fontWithName:FONTLITE size:12];
    [viewCell addSubview:subTitleLabel];
    
    //Сайт-------------------------------------------------------
    UILabel * labelSite = [[UILabel alloc] initWithFrame:CGRectMake(144, 56, 200, 16)];
    labelSite.text = site;
    labelSite.textColor = [UIColor colorWithHexString:@"777575"];
    labelSite.font = [UIFont fontWithName:FONTLITE size:12];
    [viewCell addSubview:labelSite];
    
    //Почта------------------------------------------------------
    UILabel * labelMail = [[UILabel alloc] initWithFrame:CGRectMake(32, 102, 90, 16)];
    labelMail.text = mail;
    labelMail.textColor = [UIColor colorWithHexString:@"f26e6e"];
    labelMail.font = [UIFont fontWithName:FONTLITE size:11];
    [viewCell addSubview:labelMail];
    
    if (boolPrams) {
        //Кнопка подвонить-------------------------------------------
        UIButton * callButton = [UIButton buttonWithType:UIButtonTypeSystem];
        callButton.frame = CGRectMake(144, 80, viewCell.frame.size.width - 32 - 144, 24);
        callButton.backgroundColor = [UIColor colorWithHexString:@"36b34c"];
        [callButton setTitle:@"ПОЗВОНИТЬ" forState:UIControlStateNormal];
        callButton.tag = buttonTag;
        callButton.layer.cornerRadius = 10.f;
        [callButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        callButton.titleLabel.font = [UIFont fontWithName:FONTREGULAR size:15];
        [callButton addTarget:self action:@selector(callButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [viewCell addSubview:callButton];
        
        [arrayButtons addObject:callButton];
    } else {
        //Кнопка обратный звонок----------------------------------------
        UIButton * backCallButton = [UIButton buttonWithType:UIButtonTypeSystem];
        backCallButton.frame = CGRectMake(144, 80, viewCell.frame.size.width - 32 - 144, 24);
        backCallButton.backgroundColor = [UIColor colorWithHexString:@"0076a2"];
        [backCallButton setTitle:@"ОБРАТНЫЙ ЗВОНОК" forState:UIControlStateNormal];
        backCallButton.tag = buttonTag;
        backCallButton.layer.cornerRadius = 10.f;
        [backCallButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        backCallButton.titleLabel.font = [UIFont fontWithName:FONTREGULAR size:15];
        [backCallButton addTarget:self action:@selector(backCallButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [viewCell addSubview:backCallButton];
        
        [arrayButtons addObject:backCallButton];
    }

    return viewCell;
}

#pragma mark - AKPickerViewDataSource

- (NSUInteger)numberOfItemsInPickerView:(AKPickerView *)pickerView
{
    return [titles count];
}


- (NSString *)pickerView:(AKPickerView *)pickerView titleForItem:(NSInteger)item
{
    return titles[item];
}



#pragma mark - AKPickerViewDelegate

- (void)pickerView:(AKPickerView *)pickerView didSelectItem:(NSInteger)item
{
    NSLog(@"%@", titles[item]);
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"newFriendCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    cell.backgroundColor = nil;
    
    if ([[arrayBool objectAtIndex:indexPath.row] boolValue]) {
        
        customTagCallButton += 1;

           [cell addSubview:[self setTableCellWithImage:@"imageCellRecommend.png" andTitle:@"Ксения Буракова" andSubTitle:@"Профессиональный психолог" ansSite:@"www.soulsite.com" andMail:@"Soul@gmail.com" andButtonTag:customTagCallButton andBoolParams:[[arrayBool objectAtIndex:indexPath.row] boolValue]]];
        
    } else {
        
        customTagBackCallButton += 1;
        
            [cell addSubview:[self setTableCellWithImage:@"imageCellRecommend.png" andTitle:@"Ксения Буракова" andSubTitle:@"Профессиональный психолог" ansSite:@"www.soulsite.com" andMail:@"Soul@gmail.com" andButtonTag:customTagBackCallButton andBoolParams:[[arrayBool objectAtIndex:indexPath.row] boolValue]]];

    }
    

     
     
    cell.editing = NO;

    
    return cell;
}


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 144;
}

#pragma mark - UITextFieldDelegate

//Скрытие клавиатуры----------------------------------------
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

//Метод ввода тоьлко чисел-----------------------------------
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    /* for backspace */
    if([string length]==0){
        return YES;
    }
    
    /*  limit to only numeric characters  */
    
    if ([textField isEqual:textFieldPhone]) {
        NSCharacterSet *myCharSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
        for (int i = 0; i < [string length]; i++) {
            unichar c = [string characterAtIndex:i];
            if ([myCharSet characterIsMember:c]) {
                
                
                /*  limit the users input to only 9 characters  */
                NSUInteger newLength = [textField.text length] + [string length] - range.length;
                return (newLength > 12) ? NO : YES;
            }
        }
        return NO;
    } else {
        /*  limit the users input to only 9 characters  */
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return (newLength > 5) ? NO : YES;
    }
    
    return NO;
}

//Анимация Лейблов при вводе Телефона------------------------
- (void) animationLabelPhone: (NSNotification*) notification
{
    UITextField * testField = notification.object;
    
    if (testField.text.length < 3) {
        testField.text = @"+7";
    }
    
    
    if (testField.text.length != 0 && isBool) {
        [UIView animateWithDuration:0.3 animations:^{
            CGRect rect;
            rect = labelPlaceHolderPhone.frame;
            rect.origin.x = rect.origin.x + 100.f;
            labelPlaceHolderPhone.frame = rect;
            labelPlaceHolderPhone.alpha = 0.f;
            isBool = NO;
        }];
    } else if (testField.text.length == 0 && !isBool) {
        [UIView animateWithDuration:0.3 animations:^{
            CGRect rect;
            rect = labelPlaceHolderPhone.frame;
            rect.origin.x = rect.origin.x - 100.f;
            labelPlaceHolderPhone.frame = rect;
            labelPlaceHolderPhone.alpha = 1.f;
            isBool = YES;
        }];
    }
}

//Поднимаем текст вверх--------------------------------------
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if ([textField isEqual:textFieldPhone]) {
        if ([textField.text isEqualToString:@""]) {
            textField.text = @"+7";
            if (textField.text.length != 0 && isBool) {
                [UIView animateWithDuration:0.3 animations:^{
                    CGRect rect;
                    rect = labelPlaceHolderPhone.frame;
                    rect.origin.x = rect.origin.x + 100.f;
                    labelPlaceHolderPhone.frame = rect;
                    labelPlaceHolderPhone.alpha = 0.f;
                    isBool = NO;
                }];
            }
            
        }
    }
    
    textField.textAlignment = NSTextAlignmentLeft;
}

//Восстанавливаем стандартный размер-----------------------
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if ([textField isEqual:textFieldPhone]) {
        if ([textField.text isEqualToString:@"+7"]) {
            textField.text = @"";
            if (textField.text.length == 0 && !isBool) {
                [UIView animateWithDuration:0.3 animations:^{
                    CGRect rect;
                    rect = labelPlaceHolderPhone.frame;
                    rect.origin.x = rect.origin.x - 100.f;
                    labelPlaceHolderPhone.frame = rect;
                    labelPlaceHolderPhone.alpha = 1.f;
                    isBool = YES;
                }];
            }
        }
    }
    
    textField.textAlignment = NSTextAlignmentCenter;
}

//Отвязка от всех нотификаций------------------------------
- (void) dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Action Methods

//Действие кнопки позвонить
- (void) callButtonAction: (UIButton*) button
{
    for (int i = 0; i < arrayButtons.count; i++) {
        if (button.tag == i + 1) {
            NSLog(@"Звоним на конкретный номер");
        }
    }
}

//Дествие кнопки обраный звонок
- (void) backCallButtonAction: (UIButton*) button
{
    for (int i = 0; i < arrayButtons.count; i++) {
        if (button.tag == i + 1) {
            //Анимация алерта---------------------------------------------
            [UIView animateWithDuration:0.1 animations:^{
                darkView.alpha = 0.4f;
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.3 animations:^{
                    CGRect rectAlert = alertViewRecommend.frame;
                    rectAlert.origin.y += 750;
                    alertViewRecommend.frame = rectAlert;
                }];
            }];
        }
    }
}

//Действие кнопки закрыть алерт
- (void) buttonCancelAction
{
    [UIView animateWithDuration:0.3 animations:^{
        CGRect rectAlert = alertViewRecommend.frame;
        rectAlert.origin.y -= 760;
        alertViewRecommend.frame = rectAlert;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 animations:^{
            darkView.alpha = 0;
        }];
    }];
}

//Действие кнопки отправить--------------------
- (void) buttonSendAction
{
    NSLog(@"Попросить перезвонить мне");
}



@end
