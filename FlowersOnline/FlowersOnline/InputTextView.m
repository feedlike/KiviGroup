//
//  InputTextView.m
//  FlowersOnline
//
//  Created by Viktor on 02.05.16.
//  Copyright © 2016 datastore24. All rights reserved.
//

#import "InputTextView.h"
#import "CustomTextField.h"

@implementation InputTextView
{
    CustomTextField * textFieldInput;
    UILabel * labelPlaceHoldInput;
    UIView * mainView;
    BOOL keyboardUp;
}

- (instancetype)initWithView: (UIView*) view
                      PointY: (CGFloat) pointY
                    andImage: (NSString*) imageName
          andTextPlaceHolder: (NSString*) placeHolder
{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(20, pointY, view.frame.size.width - 40, 60);
        self.layer.cornerRadius = 30.f;
        self.backgroundColor = [UIColor colorWithRed:1.f green:1.f blue:1.f alpha:0.5];
        keyboardUp = NO;
        
        mainView = view;
        
        //Картинка объекта--------
        UIImageView * imageViewInput = [[UIImageView alloc] initWithFrame:CGRectMake(20, 10, 40, 40)];
        imageViewInput.image = [UIImage imageNamed:imageName];
        imageViewInput.alpha = 0.5;
        [imageViewInput sizeThatFits:CGSizeMake(40, 40)];
        [self addSubview:imageViewInput];
        
        //Ввод текста-------------
        textFieldInput = [[CustomTextField alloc] initWithFrame:CGRectMake(70, 0, self.frame.size.width - 70, 60)];
        textFieldInput.delegate = self;
        textFieldInput.isBoll = YES;
        textFieldInput.keyboardType = UIKeyboardTypeDefault;
        textFieldInput.autocorrectionType = UITextAutocorrectionTypeNo;
        textFieldInput.font = [UIFont fontWithName:FONTREGULAR size:17];
        textFieldInput.textColor = [UIColor whiteColor];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(animationLabel:) name:UITextFieldTextDidChangeNotification object:textFieldInput];
        [self addSubview:textFieldInput];
        
        //Плесхолдер --------------
        labelPlaceHoldInput = [[UILabel alloc] initWithFrame:textFieldInput.frame];
        labelPlaceHoldInput.text = placeHolder;
        labelPlaceHoldInput.textColor = [UIColor whiteColor];
        labelPlaceHoldInput.font = [UIFont fontWithName:FONTREGULAR size:17];
        [self addSubview:labelPlaceHoldInput];
        
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

//Анимация Лейблов при вводе SMS-------------------------
- (void) animationLabel: (NSNotification*) notification
{
    CustomTextField * testField = notification.object;
    if (testField.text.length != 0 && testField.isBoll) {
        [UIView animateWithDuration:0.2 animations:^{
            CGRect rect;
            rect = labelPlaceHoldInput.frame;
            rect.origin.x = rect.origin.x + 100.f;
            labelPlaceHoldInput.frame = rect;
            labelPlaceHoldInput.alpha = 0.f;
            testField.isBoll = NO;
        }];
    } else if (testField.text.length == 0 && !testField.isBoll) {
        [UIView animateWithDuration:0.25 animations:^{
            CGRect rect;
            rect = labelPlaceHoldInput.frame;
            rect.origin.x = rect.origin.x - 100.f;
            labelPlaceHoldInput.frame = rect;
            labelPlaceHoldInput.alpha = 1.f;
            testField.isBoll = YES;
        }];
    }
}

//Поднимаем текст вверх--------------------------------------
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [UIView animateWithDuration:0.25 animations:^{
        CGRect rectAnimation = mainView.frame;
        rectAnimation.origin.y -= 90;
        mainView.frame = rectAnimation;
    } completion:^(BOOL finished) {
    }];
}

//Восстанавливаем стандартный размер-----------------------
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [UIView animateWithDuration:0.25 animations:^{
        CGRect rectAnimation = mainView.frame;
        rectAnimation.origin.y += 90;
        mainView.frame = rectAnimation;
    } completion:^(BOOL finished) {
    }];
}


//Отвязка от всех нотификаций------------------------------
- (void) dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end