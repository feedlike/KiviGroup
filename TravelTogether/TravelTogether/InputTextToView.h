//
//  InputTextToView.h
//  Dolpirog
//
//  Created by Виктор Мишустин on 21/07/16.
//  Copyright © 2016 Виктор Мишустин. All rights reserved.
//

//Класс кастомного текст вью для ввода комментариев в приложении
//Шрифт плейсхолдера дублирыуется из основного текст вью (размер шрифта так же дублируется)

#import <UIKit/UIKit.h>
#import "CustomTextView.h"

@interface InputTextToView : UIView

@property (strong, nonatomic) NSString * placeholder; //Текст плейсхолдера
@property (strong, nonatomic) CustomTextView * mainTextView; //Текст Филд
@property (strong, nonatomic) UILabel * placeHolderLabel;


- (instancetype)initWithTextViewFrame:(CGRect)frame; //Метод инициализации
- (void) backAnimation;

@end
