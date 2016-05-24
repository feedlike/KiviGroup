//
//  OpenSubjectView.m
//  PsychologistIOS
//
//  Created by Viktor on 05.04.16.
//  Copyright © 2016 KiviLab. All rights reserved.
//

#import "OpenSubjectView.h"
#import "UIColor+HexColor.h"
#import "Macros.h"
#import "StringImage.h"
#import "ViewSectionTable.h"
#import "TextMethodClass.h"

@implementation OpenSubjectView
{
    UIScrollView * mainScrollView;
    CGFloat selfHeight;
    UITextView * textViewText;
    UIButton * buttonHeight;
    UIButton * buttonLink;
    BOOL mainAnim;
    NSDictionary * mainDict;
    
    CGFloat countFor;  
}

- (instancetype)initWithView: (UIView*) view andDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, view.frame.size.width, view.frame.size.height);
        mainAnim = YES;
        selfHeight = view.frame.size.height - 64;
        mainDict = dict;
        self.userInteractionEnabled = YES;

#pragma mark - Chat View
        
        //Вью чата--------------------------------------------------------------------
        UIView * viewChat = [[UIView alloc] initWithFrame:CGRectMake(0, 368, self.frame.size.width, self.frame.size.height - 368)];
        viewChat.userInteractionEnabled = YES;
        if (isiPhone6) {
            viewChat.frame = CGRectMake(0, 300, self.frame.size.width, self.frame.size.height - 300);
        } else if (isiPhone5) {
            viewChat.frame = CGRectMake(0, 240, self.frame.size.width, self.frame.size.height - 240);
        }
        
        if (isiPhone4s) {
            viewChat.frame = CGRectMake(0, 150, self.frame.size.width, self.frame.size.height - 250);
        }
        
//        for (NSInteger i = array.count; i > (array.count - 3); i--) {
//            NSDictionary * dictChat = [array objectAtIndex:i - 1];
//            if ([[dictChat objectForKey:@"Users"] isEqualToString:@"Пользователь 1"]) {
//                // Имя пользователя---------------
//                UILabel * labelUser = [[UILabel alloc] initWithFrame:CGRectMake(viewChat.frame.size.width - 32 - 73, 8 + countFor, 88, 12)];
//                labelUser.textColor = [UIColor colorWithHexString:@"8e8e93"];
//                labelUser.font = [UIFont fontWithName:FONTLITE size:12];
//                if (isiPhone5) {
//                    labelUser.font = [UIFont fontWithName:FONTLITE size:10];
//                }
//                labelUser.text = [dictChat objectForKey:@"Users"];
//                [viewChat addSubview:labelUser];
//                
//                //Текст сообщения------------------
//                UILabel * labelText = [[UILabel alloc] initWithFrame:CGRectMake(viewChat.frame.size.width - 24, 32 + countFor, 300, 12)];
//                labelText.numberOfLines = 0;
//                labelText.textColor = [UIColor whiteColor];
//                labelText.text = [dictChat objectForKey:@"Message"];
//                labelText.font = [UIFont fontWithName:FONTLITE size:18];
//                if (isiPhone6) {
//                    labelText.font = [UIFont fontWithName:FONTLITE size:16];
//                } else if (isiPhone5) {
//                    labelText.font = [UIFont fontWithName:FONTLITE size:12];
//                    labelText.frame = CGRectMake(viewChat.frame.size.width - 24, 28 + countFor, 200, 12);
//                }
//                
//                [labelText sizeToFit];
//                labelText.frame = CGRectMake((viewChat.frame.size.width - labelText.frame.size.width) - 32, labelText.frame.origin.y, labelText.frame.size.width, labelText.frame.size.height);
//                
//                //Вью сообщения----------------------
//                UIView * viewMessage = [[UIView alloc] initWithFrame:CGRectMake(labelText.frame.origin.x - 10, labelText.frame.origin.y - 5, labelText.frame.size.width + 20, labelText.frame.size.height + 10)];
//                if (isiPhone6) {
//                    viewMessage.frame = CGRectMake(labelText.frame.origin.x - 10, labelText.frame.origin.y - 3, labelText.frame.size.width + 20, labelText.frame.size.height + 6);
//                } else if (isiPhone5) {
//                    viewMessage.frame = CGRectMake(labelText.frame.origin.x - 10, labelText.frame.origin.y - 3, labelText.frame.size.width + 20, labelText.frame.size.height + 6);
//                }
//                viewMessage.backgroundColor = [UIColor colorWithHexString:@"f69679"];
//                viewMessage.layer.cornerRadius = 7.f;
//                [viewChat addSubview:viewMessage];
//                [viewChat addSubview:labelText];
//                
//                //Создаем хвостик--------------------
//                UIImageView * bubbleView = [[UIImageView alloc] initWithFrame:CGRectMake(viewMessage.frame.origin.x + viewMessage.frame.size.width - 9, viewMessage.frame.origin.y + viewMessage.frame.size.height - 7, 16, 8)];
//                bubbleView.image = [UIImage imageNamed:@"bubble.png"];
//                [viewChat addSubview:bubbleView];
//                
//                //Лейбл даты-----------------------
//                UILabel * labelData = [[UILabel alloc] initWithFrame:CGRectMake(viewChat.frame.size.width - 32 - 40, viewMessage.frame.origin.y + viewMessage.frame.size.height + 5, 40, 12)];
//                labelData.textColor = [UIColor colorWithHexString:@"8e8e93"];
//                labelData.font = [UIFont fontWithName:FONTLITE size:12];
//                if (isiPhone5) {
//                    labelData.font = [UIFont fontWithName:FONTLITE size:10];
//                }
//                labelData.text = [dictChat objectForKey:@"Data"];
//                [labelData sizeToFit];
//                labelData.frame = CGRectMake(viewChat.frame.size.width - 24 - labelData.frame.size.width, labelData.frame.origin.y, labelData.frame.size.width, labelData.frame.size.height);
//                [viewChat addSubview:labelData];
//                
//                countFor += viewMessage.frame.size.height + 30;
//
//            } else {
//                // Имя пользователя---------------
//                UILabel * labelUser = [[UILabel alloc] initWithFrame:CGRectMake(28, 8 + countFor, 88, 12)];
//                labelUser.textColor = [UIColor colorWithHexString:@"8e8e93"];
//                labelUser.font = [UIFont fontWithName:FONTLITE size:12];
//                if (isiPhone5) {
//                    labelUser.font = [UIFont fontWithName:FONTLITE size:10];
//                }
//                labelUser.text = [dictChat objectForKey:@"Users"];
//                [viewChat addSubview:labelUser];
//                
//                UILabel * labelText = [[UILabel alloc] initWithFrame:CGRectMake(38, 28 + countFor, 40, 12)];
//                labelText.text = [dictChat objectForKey:@"Message"];
//                labelText.font = [UIFont fontWithName:FONTLITE size:18];
//                if (isiPhone6) {
//                    labelText.font = [UIFont fontWithName:FONTLITE size:16];
//                } else if (isiPhone5) {
//                    labelText.font = [UIFont fontWithName:FONTLITE size:12];
//                }
//                [labelText sizeToFit];
//                
//                //Вью Сообщения---------------------
//                UIView * viewMessage = [[UIView alloc] initWithFrame:CGRectMake(labelText.frame.origin.x - 10, labelText.frame.origin.y - 5, labelText.frame.size.width + 20, labelText.frame.size.height + 10)];
//                if (isiPhone6) {
//                    viewMessage.frame = CGRectMake(labelText.frame.origin.x - 10, labelText.frame.origin.y - 3, labelText.frame.size.width + 20, labelText.frame.size.height + 6);
//                } else if (isiPhone5) {
//                    viewMessage.frame = CGRectMake(labelText.frame.origin.x - 10, labelText.frame.origin.y - 3, labelText.frame.size.width + 20, labelText.frame.size.height + 6);
//                }
//                viewMessage.backgroundColor = [UIColor colorWithHexString:@"e5e5ea"];
//                viewMessage.layer.cornerRadius = 7.f;
//                [viewChat addSubview:viewMessage];
//                [viewChat addSubview:labelText];
//                
//                //Создаем хвостик------------------
//                UIImageView * bubbleView = [[UIImageView alloc] initWithFrame:CGRectMake(32 - 7, viewMessage.frame.origin.y + viewMessage.frame.size.height - 7, 16, 8)];
//                bubbleView.image = [UIImage imageNamed:@"bubble - gray.png"];
//                [viewChat addSubview:bubbleView];
//                
//                //Лейбл даты-----------------------
//                UILabel * labelData = [[UILabel alloc] initWithFrame:CGRectMake(28, viewMessage.frame.origin.y + viewMessage.frame.size.height + 5, 40, 12)];
//                labelData.textColor = [UIColor colorWithHexString:@"8e8e93"];
//                labelData.font = [UIFont fontWithName:FONTLITE size:12];
//                if (isiPhone5) {
//                    labelData.font = [UIFont fontWithName:FONTLITE size:10];
//                }
//                labelData.text = [dictChat objectForKey:@"Data"];
//                [viewChat addSubview:labelData];
//                
//                countFor += viewMessage.frame.size.height + 30;
//                
//            }
//        }
        
        [self addSubview:viewChat];
        
        //Кнопка обсудить---------------------------
        UIButton * buttonPush = [UIButton buttonWithType:UIButtonTypeSystem];
        buttonPush.frame = CGRectMake(viewChat.frame.size.width / 2 - 168, 615, 336, 48);
        buttonPush.backgroundColor = [UIColor colorWithHexString:@"e54444"];
        buttonPush.layer.cornerRadius = 24;
        [buttonPush setTitle:@"ОБСУДИТЬ" forState:UIControlStateNormal];
        [buttonPush setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        buttonPush.titleLabel.font = [UIFont fontWithName:FONTLITE size:16];
        if (isiPhone6) {
            buttonPush.frame = CGRectMake(viewChat.frame.size.width / 2 - 168, 530, 336, 48);
        } else if (isiPhone5) {
            buttonPush.frame = CGRectMake(viewChat.frame.size.width / 2 - 140, 450, 280, 40);
            buttonPush.titleLabel.font = [UIFont fontWithName:FONTLITE size:16];
            buttonPush.layer.cornerRadius = 20;
        }
        
        if (isiPhone4s) {
            buttonPush.frame = CGRectMake(viewChat.frame.size.width / 2 - 140, 350, 280, 40);
        }
        [buttonPush addTarget:self action:@selector(buttonPushAction) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:buttonPush];
        
#pragma mark - MainView
        
        NSString * stringText = [TextMethodClass stringByStrippingHTML:[mainDict objectForKey:@"text"]];
        ViewSectionTable * imagePost = [[ViewSectionTable alloc] initWithPostImageURL:[StringImage createStringImageURLWithString:[mainDict objectForKey:@"media_path"]] andView:self andContentMode:UIViewContentModeScaleAspectFill];
        [self addSubview:imagePost];
        
        mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 170, view.frame.size.width, 220)];
        if (isiPhone6) {
            mainScrollView.frame = CGRectMake(0, 150, view.frame.size.width, 168);
        } else if (isiPhone5) {
            mainScrollView.frame = CGRectMake(0, 100, view.frame.size.width, 160);
        }
        
        if (isiPhone4s) {
            mainScrollView.frame = CGRectMake(0, 110, view.frame.size.width, 80);
        }
        mainScrollView.backgroundColor = [UIColor whiteColor];
        [self addSubview:mainScrollView];
        
        //Текст------------------------------------------------
        textViewText = [[UITextView alloc] initWithFrame:CGRectMake(16, 22, self.frame.size.width - 32, 152)];
        textViewText.text = stringText;
        textViewText.backgroundColor = nil;
        textViewText.textColor = [UIColor colorWithHexString:@"838484"];
        textViewText.font = [UIFont fontWithName:FONTLITE size:13];
        if (isiPhone6) {
            textViewText.frame = CGRectMake(16, 8, self.frame.size.width - 32, 125);
            textViewText.font = [UIFont fontWithName:FONTLITE size:12];
        } else if (isiPhone5) {
            textViewText.frame = CGRectMake(16, 8, self.frame.size.width - 32, 115);
            textViewText.font = [UIFont fontWithName:FONTLITE size:10];
        }
        
        if (isiPhone4s) {
            textViewText.frame = CGRectMake(16, 8, self.frame.size.width - 32, 45);
        }
        textViewText.userInteractionEnabled = NO;
        textViewText.editable = NO;
        textViewText.showsVerticalScrollIndicator = NO;
        [mainScrollView addSubview:textViewText];
        
        //Кнопка изменения высоты первого скрола
        buttonHeight = [UIButton buttonWithType:UIButtonTypeCustom];
        buttonHeight.frame = CGRectMake(16, 180, 65.5, 35);
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 13, 65.5, 10)];
        if (isiPhone6) {
            buttonHeight.frame = CGRectMake(16, 140, 65.5, 35);
            imageView.frame = CGRectMake(0, 13, 65.5, 10);
        } if (isiPhone5) {
            buttonHeight.frame = CGRectMake(20, 130, 60, 30);
            imageView.frame = CGRectMake(0, 10, 60, 9);
        }
        
        if (isiPhone4s) {
            buttonHeight.frame = CGRectMake(20, 55, 60, 30);
            imageView.frame = CGRectMake(0, 10, 60, 9);
        }
        
        UIImage * imageButtonHeight = [UIImage imageNamed:@"buttonHight.png"];
        
        imageView.image = imageButtonHeight;
        [buttonHeight addSubview:imageView];
//        [buttonHeight setImage:imageButtonHeight forState:UIControlStateNormal];
        [buttonHeight addTarget:self action:@selector(buttonHeightAction) forControlEvents:UIControlEventTouchUpInside];
        [mainScrollView addSubview:buttonHeight];
        
        //Кнопка перехода по ссылке
        buttonLink = [UIButton buttonWithType:UIButtonTypeSystem];
        buttonLink.frame = CGRectMake(self.frame.size.width - 125, 180, 105.5, 35);
        [buttonLink setTitle:@"Подробнее" forState:UIControlStateNormal];
        [buttonLink setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        buttonLink.titleLabel.font = [UIFont fontWithName:FONTBOND size:16];
        if (isiPhone6) {
            buttonLink.frame = CGRectMake(self.frame.size.width - 125, 140, 105.5, 35);
            buttonLink.titleLabel.font = [UIFont fontWithName:FONTBOND size:16];
        } if (isiPhone5) {
            buttonLink.frame = CGRectMake(self.frame.size.width - 120, 130, 100, 30);
            buttonLink.titleLabel.font = [UIFont fontWithName:FONTBOND size:14];
        }
        if (isiPhone4s) {
            buttonLink.frame = CGRectMake(self.frame.size.width - 120, 55, 100, 30);
            buttonLink.titleLabel.font = [UIFont fontWithName:FONTBOND size:14];
        }
        [buttonLink addTarget:self action:@selector(buttonLinkAction) forControlEvents:UIControlEventTouchUpInside];
        [mainScrollView addSubview:buttonLink];
        
        
        
    }
    return self;
}


#pragma mark - Action Methods
//Дествие кнопки удлинения скрол вью
- (void) buttonHeightAction
{
    if (mainAnim) {
        [UIView animateWithDuration:0.5 animations:^{
            
            //Скролл
            CGRect newRectScroll = mainScrollView.frame;
            if (isiPhone4s) {
                newRectScroll.size.height += 230;
            } else {
            if (isiPhone6) {
                newRectScroll.size.height += 275;
            } else if (isiPhone5) {
                newRectScroll.size.height += 240;
            } else {
                newRectScroll.size.height += 280;
            }
            }
            mainScrollView.frame = newRectScroll;
            //Кнопка
            CGRect newRectButton = buttonHeight.frame;
            if (isiPhone4s) {
                newRectButton.origin.y += 230;
            } else {
            if (isiPhone6) {
                newRectButton.origin.y += 275;
            } else if (isiPhone5) {
                newRectButton.origin.y += 240;
            } else {
                newRectButton.origin.y += 280;
            }
            }
            buttonHeight.frame = newRectButton;
            //Линк
            CGRect newRectLink = buttonLink.frame;
            if (isiPhone4s) {
                newRectLink.origin.y += 230;
            } else {
                if (isiPhone6) {
                    newRectLink.origin.y += 275;
                } else if (isiPhone5) {
                    newRectLink.origin.y += 240;
                } else {
                    newRectLink.origin.y += 280;
                }
            }
            buttonLink.frame = newRectLink;
            //Лейбл
            CGRect newRectLabel = textViewText.frame;
            if (isiPhone4s) {
                newRectLabel.size.height += 230;
            } else {
            if (isiPhone6) {
                newRectLabel.size.height += 275;
            } else if (isiPhone5) {
                newRectLabel.size.height += 240;
            } else {
                newRectLabel.size.height += 280;
            }
            }
            textViewText.frame = newRectLabel;
        } completion:^(BOOL finished) {
            textViewText.userInteractionEnabled = YES;
        }];
        mainAnim = NO;
    } else {
        [UIView animateWithDuration:0.5 animations:^{
            //Скролл
            CGRect newRectScroll = mainScrollView.frame;
            if (isiPhone4s) {
                newRectScroll.size.height -= 230;
            } else {
                if (isiPhone6) {
                    newRectScroll.size.height -= 275;
                } else if (isiPhone5) {
                    newRectScroll.size.height -= 240;
                } else {
                    newRectScroll.size.height -= 280;
                }
            }
            mainScrollView.frame = newRectScroll;
            //Кнопка
            CGRect newRectButton = buttonHeight.frame;
            if (isiPhone4s) {
                newRectButton.origin.y -= 230;
            } else {
                if (isiPhone6) {
                    newRectButton.origin.y -= 275;
                } else if (isiPhone5) {
                    newRectButton.origin.y -= 240;
                } else {
                    newRectButton.origin.y -= 280;
                }
            }
            buttonHeight.frame = newRectButton;
            //Линк
            CGRect newRectLink = buttonLink.frame;
            if (isiPhone4s) {
                newRectLink.origin.y -= 230;
            } else {
                if (isiPhone6) {
                    newRectLink.origin.y -= 275;
                } else if (isiPhone5) {
                    newRectLink.origin.y -= 240;
                } else {
                    newRectLink.origin.y -= 280;
                }
            }
            buttonLink.frame = newRectLink;
            //Лейбл
            CGRect newRectLabel = textViewText.frame;
            if (isiPhone4s) {
                newRectLabel.size.height -= 230;
            } else {
                if (isiPhone6) {
                    newRectLabel.size.height -= 275;
                } else if (isiPhone5) {
                    newRectLabel.size.height -= 240;
                } else {
                    newRectLabel.size.height -= 280;
                }
            }            textViewText.frame = newRectLabel;
        } completion:^(BOOL finished) {
            textViewText.userInteractionEnabled = NO;
        }];
        mainAnim = YES;
    }
}

- (void) buttonPushAction
{
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_OPEN_SUBJECT_PUSH_TU_DISCUSSIONS object:nil];
}

- (void) buttonLinkAction
{
    NSString * stringURL = [NSString stringWithFormat:@"http://%@", [mainDict objectForKey:@"link"]];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:stringURL]];
}

@end
