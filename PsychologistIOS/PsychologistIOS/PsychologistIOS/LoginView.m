//
//  LoginView.m
//  PsychologistIOS
//
//  Created by Viktor on 31.03.16.
//  Copyright © 2016 KiviLab. All rights reserved.
//

#import "LoginView.h"
#import "UIColor+HexColor.h"
#import "Macros.h"

@implementation LoginView
{
    
    UIScrollView * mainScrollView;
    
    UITextField * textFieldPhone;
    UITextField * textFieldSMS;
    UILabel * labelPlaceHolderPhone;
    UILabel * labelPlaceHoldSMS;
    BOOL isBool;
    BOOL isBoolSMS;
    
    UIView * viewPhone;
    UIView * viewSMS;
    UIButton * buttonLogin;
    UIButton * buttonInput;
}

- (instancetype)initButtonLogin
{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(16, 520, 382, 64);
        
        //Кнопка меню---------------------------------------------------------------------
        buttonInput = [UIButton buttonWithType:UIButtonTypeSystem];
        buttonInput.frame = CGRectMake(0, 0, 382, 64);
        buttonInput.backgroundColor = [UIColor colorWithHexString:@"48709d"];
        buttonInput.layer.borderColor = [UIColor whiteColor].CGColor;
        buttonInput.layer.cornerRadius = 30;
        [buttonInput setTitle:@"ВОЙТИ" forState:UIControlStateNormal];
        [buttonInput setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        buttonInput.titleLabel.font = [UIFont fontWithName:FONTREGULAR size:17];
        [buttonInput addTarget:self action:@selector(buttonInputAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:buttonInput];
        
        
        //Кнопка входа---------------------------------------------------------------------
        buttonLogin = [UIButton buttonWithType:UIButtonTypeSystem];
        buttonLogin.frame = CGRectMake(0, 0, 382, 64);
        buttonLogin.backgroundColor = [UIColor colorWithHexString:@"3cc354"];
        buttonLogin.layer.borderColor = [UIColor whiteColor].CGColor;
        buttonLogin.layer.cornerRadius = 30;
        [buttonLogin setTitle:@"ПОЛУЧИТЬ КОД СМС" forState:UIControlStateNormal];
        [buttonLogin setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        buttonLogin.titleLabel.font = [UIFont fontWithName:FONTREGULAR size:17];
        [buttonLogin addTarget:self action:@selector(buttonLoginAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:buttonLogin];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationAnimationMethodButton) name:NOTIFICATION_LOGIN_VIEW_ANIMATION_BUTTON object:nil];
    }
    return self;
}

- (instancetype)initWithBackgroundView: (UIView*) view
{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, view.frame.size.width, view.frame.size.height);
        
        //Основной фон---------------------
        UIImageView * mainImageView = [[UIImageView alloc] initWithFrame:self.frame];
        mainImageView.image = [UIImage imageNamed:@"mainFone.png"];
        [self addSubview:mainImageView];
    }
    return self;
}


- (instancetype)initWithContentView: (UIView*) view
{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, view.frame.size.width, view.frame.size.height);
        isBool = YES;
        isBoolSMS = YES;
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationAnimationMethod) name:NOTIFICATION_LOGIN_VIEW_ANIMATION object:nil];
        
        mainScrollView = [[UIScrollView alloc] initWithFrame:self.frame];
        [self addSubview:mainScrollView];
        
        //Массив картинок-------------------
        NSArray * arrayImage = [NSArray arrayWithObjects:@"VK.png", @"facebook.png", @"Email.png", nil];
        
        //Вью ввода телефона----------------
        viewPhone = [[UIView alloc] initWithFrame:CGRectMake(16, 440, self.frame.size.width - 32, 64)];
        viewPhone.backgroundColor = [UIColor colorWithHexString:@"a04c43"];
        viewPhone.layer.borderColor = [UIColor colorWithHexString:@"e18c82"].CGColor;
        viewPhone.layer.borderWidth = 0.4f;
        viewPhone.layer.cornerRadius = 5;
        [mainScrollView addSubview:viewPhone];
        
        //Ввод телефона-----------------------------------------------------------------
        textFieldPhone = [[UITextField alloc] initWithFrame:CGRectMake(24, 0, viewPhone.frame.size.width - 48, viewPhone.frame.size.height)];
        textFieldPhone.delegate = self;
        textFieldPhone.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
        textFieldPhone.autocorrectionType = UITextAutocorrectionTypeNo;
        textFieldPhone.font = [UIFont fontWithName:FONTLITE size:19];
        textFieldPhone.textColor = [UIColor colorWithHexString:@"b3b3b4"];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(animationLabelPhone:) name:UITextFieldTextDidChangeNotification object:textFieldPhone];
        [viewPhone addSubview:textFieldPhone];
        
        //Плэйс холдер телефона----------------------------------------------------------
        labelPlaceHolderPhone = [[UILabel alloc] initWithFrame:CGRectMake(24, 0, viewPhone.frame.size.width - 48, viewPhone.frame.size.height)];
        labelPlaceHolderPhone.tag = 3022;
        labelPlaceHolderPhone.text = @"Телефон";
        labelPlaceHolderPhone.textColor = [UIColor colorWithHexString:@"b3b3b4"];
        labelPlaceHolderPhone.font = [UIFont fontWithName:FONTLITE size:19];
        [viewPhone addSubview:labelPlaceHolderPhone];
        
        //Вью ввода телефона----------------
        viewSMS = [[UIView alloc] initWithFrame:CGRectMake(800, 440, self.frame.size.width - 32, 64)];
        viewSMS.backgroundColor = [UIColor colorWithHexString:@"a04c43"];
        viewSMS.layer.borderColor = [UIColor colorWithHexString:@"e18c82"].CGColor;
        viewSMS.layer.borderWidth = 0.4f;
        viewSMS.layer.cornerRadius = 5;
        [mainScrollView addSubview:viewSMS];
        
        //Ввод телефона-----------------------------------------------------------------
        textFieldSMS = [[UITextField alloc] initWithFrame:CGRectMake(24, 0, viewPhone.frame.size.width - 48, viewPhone.frame.size.height)];
        textFieldSMS.delegate = self;
        textFieldSMS.tag = 120;
        textFieldSMS.keyboardType = UIKeyboardTypeDefault;
        textFieldSMS.autocorrectionType = UITextAutocorrectionTypeNo;
        textFieldSMS.font = [UIFont fontWithName:FONTLITE size:19];
        textFieldSMS.textColor = [UIColor colorWithHexString:@"b3b3b4"];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(animationLabelSMS:) name:UITextFieldTextDidChangeNotification object:textFieldSMS];
        [viewSMS addSubview:textFieldSMS];
        
        //Плесхолдер СМС-------------------------------------------------------------------
        labelPlaceHoldSMS = [[UILabel alloc] initWithFrame:CGRectMake(24, 0, viewPhone.frame.size.width - 48, viewPhone.frame.size.height)];
        labelPlaceHoldSMS.tag = 3021;
        labelPlaceHoldSMS.text = @"Введите код";
        labelPlaceHoldSMS.textColor = [UIColor colorWithHexString:@"b3b3b4"];
        labelPlaceHoldSMS.font = [UIFont fontWithName:FONTLITE size:19];
        [viewSMS addSubview:labelPlaceHoldSMS];
        
        //Лейбл возможности регистрации другим путем---------------------------------------
        UILabel * labelOtherInput = [[UILabel alloc] initWithFrame:CGRectMake(0, viewPhone.frame.size.height + viewPhone.frame.origin.y + 96, self.frame.size.width, 16)];
        labelOtherInput.text = @"ВОЙТИ ЧЕРЕЗ АККАУНТ";
        labelOtherInput.textColor = [UIColor whiteColor];
        labelOtherInput.textAlignment = NSTextAlignmentCenter;
        labelOtherInput.font = [UIFont fontWithName:FONTREGULAR size:15.6];
        [self addSubview:labelOtherInput];
        
        for (int i = 0; i < 3; i++) {
            UIButton * buttonOtherInput = [UIButton buttonWithType:UIButtonTypeCustom];
            buttonOtherInput.frame = CGRectMake(120 + 60 * i, labelOtherInput.frame.origin.y + labelOtherInput.frame.size.height + 12, 56, 56);
            buttonOtherInput.layer.cornerRadius = 28;
            UIImage *btnImage = [UIImage imageNamed:[arrayImage objectAtIndex:i]];
            [buttonOtherInput setImage:btnImage forState:UIControlStateNormal];
            [self addSubview:buttonOtherInput];
        }
        
        //Кнопка условия лицензионного соглашения
        UIButton * buttonLicense = [UIButton buttonWithType:UIButtonTypeSystem];
        buttonLicense.frame = CGRectMake(136, labelOtherInput.frame.size.height + labelOtherInput.frame.origin.y + 72, 152, 24);
        [buttonLicense setTitle:@"Условия соглашения" forState:UIControlStateNormal];
        [buttonLicense setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        buttonLicense.titleLabel.font = [UIFont fontWithName:FONTREGULAR size:13];
        [self addSubview:buttonLicense];
        
        
        
    }
    return self;
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

//Анимация Лейблов при вводе SMS-------------------------
- (void) animationLabelSMS: (NSNotification*) notification
{
    UITextField * testField = notification.object;
    if (testField.text.length != 0 && isBoolSMS) {
        [UIView animateWithDuration:0.3 animations:^{
            CGRect rect;
            rect = labelPlaceHoldSMS.frame;
            rect.origin.x = rect.origin.x + 100.f;
            labelPlaceHoldSMS.frame = rect;
            labelPlaceHoldSMS.alpha = 0.f;
            isBoolSMS = NO;
        }];
    } else if (testField.text.length == 0 && !isBoolSMS) {
        [UIView animateWithDuration:0.3 animations:^{
            CGRect rect;
            rect = labelPlaceHoldSMS.frame;
            rect.origin.x = rect.origin.x - 100.f;
            labelPlaceHoldSMS.frame = rect;
            labelPlaceHoldSMS.alpha = 1.f;
            isBoolSMS = YES;
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
    
    [UIView animateWithDuration:0.3 animations:^{
        mainScrollView.contentOffset = (CGPoint){
            0, // ось x нас не интересует
            30 // Скроллим скролл к верхней границе текстового поля - Вы можете настроить эту величину по своему усмотрению
        };
    }];

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
    
    [UIView animateWithDuration:0.3 animations:^{
            mainScrollView.contentOffset = (CGPoint){0, 0}; // Возвращаем скролл в начало, так как редактирование текстового поля закончено
    }];
    textField.textAlignment = NSTextAlignmentCenter;
}

//Отвязка от всех нотификаций------------------------------
- (void) dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Buttons Methods
- (void) buttonLoginAction
{

    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_LOGIN_VIEW_ANIMATION object:nil];
}

- (void) buttonInputAction
{
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_LOGIN_VIEW_PUSH_MAIN_VIEW object:nil];
}

- (void) notificationAnimationMethod
{
    if (textFieldPhone.text.length < 12) {
        NSLog(@"%lu", textFieldPhone.text.length);
    } else {
    [UIView animateWithDuration:0.5 animations:^{
        CGRect rectPhone = viewPhone.frame;
        rectPhone.origin.x -= 500;
        viewPhone.frame = rectPhone;
        
        CGRect rectSMS = viewSMS.frame;
        rectSMS.origin.x -= 784;
        viewSMS.frame = rectSMS;
        
        [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_LOGIN_VIEW_ANIMATION_BUTTON object:nil];
    }];
}
}

- (void) notificationAnimationMethodButton
{
    [UIView transitionFromView:buttonLogin
                        toView:buttonInput
                      duration:0.5
                       options:UIViewAnimationOptionTransitionFlipFromBottom
                    completion:nil];
}

@end
