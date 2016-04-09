//
//  SubCategoryView.m
//  PsychologistIOS
//
//  Created by Viktor on 04.04.16.
//  Copyright © 2016 KiviLab. All rights reserved.
//

#import "SubCategoryView.h"
#import "UIColor+HexColor.h"
#import "Macros.h"
#import "SingleTone.h"

@interface SubCategoryView () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation SubCategoryView
{
    UITableView * mainTableView;
    NSMutableArray * mainArray;
    
    UIImageView * alertView;
    UIView * darkView;
    UIImageView * mainMoneyImage;
    UILabel * alertTitleLabel;
    UILabel * mainAlertText;
    
    UIButton * buttonToFavorites;
    UIButton * buttonBuy;
    UIButton * buttonOpenCategory;
}

- (instancetype)initWithBackgroundView: (UIView*) view
{
    self = [super init];
    if (self) {
        //Фоновая картинка--------------------
        self.frame = CGRectMake(0, 0, view.frame.size.width, view.frame.size.height - 64);
        UIImageView * backgroundView = [[UIImageView alloc] initWithFrame:self.frame];
        backgroundView.image = [UIImage imageNamed:@"fonSubImage.png"];
        [self addSubview:backgroundView];
    }
    return self;
}


- (instancetype)initWithContent: (UIView*) view andArray: (NSMutableArray*) array
{
    self = [super init];
    if (self) {
        
        //Основной контент---------------------
        self.frame = CGRectMake(0, 0, view.frame.size.width, view.frame.size.height - 64);
        mainArray = array;
        
        

        
        mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 40, self.frame.size.width, self.frame.size.height - 40) style:UITableViewStylePlain];
        //Убираем полосы разделяющие ячейки------------------------------
        mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        mainTableView.backgroundColor = [UIColor clearColor];
        mainTableView.dataSource = self;
        mainTableView.delegate = self;
        mainTableView.showsVerticalScrollIndicator = NO;
        [self addSubview:mainTableView];
        
        //Затемнение-----------------------------------------------------
        darkView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        darkView.backgroundColor = [UIColor blackColor];
        darkView.alpha = 0.0;
        [self addSubview:darkView];
        
#pragma mark - Create Alert
        
        //Создаем алерт---------------------------------------------------
        alertView = [[UIImageView alloc] initWithFrame:CGRectMake(24, -600, self.frame.size.width - 48, 408)];
        alertView.image = [UIImage imageNamed:@"alertViewImage.png"];
        alertView.userInteractionEnabled = YES;
        [self addSubview:alertView];
        
        //Кнопка отмены--------------------------------------------------
        UIButton * buttonCancel = [UIButton buttonWithType:UIButtonTypeCustom];
        buttonCancel.frame = CGRectMake(24, 56, 32, 32);
        UIImage *btnImage = [UIImage imageNamed:@"imageCancel.png"];
        [buttonCancel setImage:btnImage forState:UIControlStateNormal];
        [buttonCancel addTarget:self action:@selector(buttonCancelAction) forControlEvents:UIControlEventTouchUpInside];
        [alertView addSubview:buttonCancel];
        
        //Значек денег----------------------------------------------------
        mainMoneyImage = [[UIImageView alloc] initWithFrame:CGRectMake(alertView.frame.size.width / 2 - 20, 16, 40, 40)];
        [alertView addSubview:mainMoneyImage];
        
        //Заголовок алерта-----------------------------------------------
        alertTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(64, 72, alertView.frame.size.width - 128, 16)];
        alertTitleLabel.numberOfLines = 0;
        alertTitleLabel.textAlignment = NSTextAlignmentCenter;
        alertTitleLabel.textColor = [UIColor colorWithHexString:@"c0c0c0"];
        alertTitleLabel.font = [UIFont fontWithName:FONTREGULAR size:16];
        [alertView addSubview:alertTitleLabel];
        
        //Основной текст--------------------------------------------------
        mainAlertText = [[UILabel alloc] initWithFrame:CGRectMake(30, alertTitleLabel.frame.origin.y + alertTitleLabel.frame.size.height + 8, alertView.frame.size.width - 60, 120)];
        mainAlertText.numberOfLines = 0;
        mainAlertText.textAlignment = NSTextAlignmentCenter;
        mainAlertText.textColor = [UIColor colorWithHexString:@"c0c0c0"];
        mainAlertText.font = [UIFont fontWithName:FONTLITE size:13];
        [alertView addSubview:mainAlertText];
        
        //Кнопка открыть категорию--------------------------------------
        buttonOpenCategory = [UIButton buttonWithType:UIButtonTypeSystem];
        buttonOpenCategory.frame = CGRectMake(24, 230, alertView.frame.size.width - 48, 48);
        buttonOpenCategory.backgroundColor = nil;
        buttonOpenCategory.layer.cornerRadius = 25;
        buttonOpenCategory.layer.borderColor = [UIColor colorWithHexString:@"36b34c"].CGColor;
        buttonOpenCategory.layer.borderWidth = 1.f;
        [buttonOpenCategory setTitle:@"ОТКРЫТЬ ТЕМУ" forState:UIControlStateNormal];
        [buttonOpenCategory setTitleColor:[UIColor colorWithHexString:@"36b34c"] forState:UIControlStateNormal];
        buttonOpenCategory.titleLabel.font = [UIFont fontWithName:FONTLITE size:16];
        [buttonOpenCategory addTarget:self action:@selector(buttonOpenCategoryAction) forControlEvents:UIControlEventTouchUpInside];
        [alertView addSubview:buttonOpenCategory];
        
        //Кнопка добавить в игранное--------------------------------------
        buttonToFavorites = [UIButton buttonWithType:UIButtonTypeSystem];
        buttonToFavorites.frame = CGRectMake(24, 286, alertView.frame.size.width - 48, 48);
        buttonToFavorites.backgroundColor = nil;
        buttonToFavorites.layer.cornerRadius = 25;
        buttonToFavorites.layer.borderColor = [UIColor colorWithHexString:@"147ab4"].CGColor;
        buttonToFavorites.layer.borderWidth = 1.f;
        [buttonToFavorites setTitle:@"ДОБАВИТЬ В ИЗБРАННОЕ" forState:UIControlStateNormal];
        [buttonToFavorites setTitleColor:[UIColor colorWithHexString:@"147ab4"] forState:UIControlStateNormal];
        buttonToFavorites.titleLabel.font = [UIFont fontWithName:FONTLITE size:16];
        [buttonToFavorites addTarget:self action:@selector(buttonToFavoritesAction) forControlEvents:UIControlEventTouchUpInside];
        [alertView addSubview:buttonToFavorites];
        
        //Добавить в избранное----------------------------------------------
        buttonBuy = [UIButton buttonWithType:UIButtonTypeSystem];
        buttonBuy.frame = CGRectMake(24, 342, alertView.frame.size.width - 48, 48);
        buttonBuy.backgroundColor = [UIColor colorWithHexString:@"ee5a59"];
        buttonBuy.layer.cornerRadius = 25;
        buttonBuy.layer.borderColor = [UIColor colorWithHexString:@"ee5a59"].CGColor;
        buttonBuy.layer.borderWidth = 1.f;
        [buttonBuy setTitle:@"КУПИТЬ ТЕМУ" forState:UIControlStateNormal];
        [buttonBuy setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        buttonBuy.titleLabel.font = [UIFont fontWithName:FONTLITE size:16];
        [buttonBuy addTarget:self action:@selector(buttonBuyAction) forControlEvents:UIControlEventTouchUpInside];
        [alertView addSubview:buttonBuy];
        
        
        
    }
    return self;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"newFriendCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    cell.backgroundColor = nil;
    
    NSDictionary * dictCell = [mainArray objectAtIndex:indexPath.row];
    
    [cell addSubview:[self setTableCellWithTitle:[dictCell objectForKey:@"title"]
                                     andSubTitle:[dictCell objectForKey:@"subTitle"]
                                        andMoney:[[dictCell objectForKey:@"money"] boolValue]
                                        andImage:[dictCell objectForKey:@"image"]]];
    
    return cell;
}

#pragma mark - UITableViewDelegate
//Анимация нажатия ячейки--------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSDictionary * dictCell = [mainArray objectAtIndex:indexPath.row];
    alertTitleLabel.text = [dictCell objectForKey:@"title"];
    
    mainAlertText.text = @"Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только";
    
    if ([[dictCell objectForKey:@"money"] boolValue]) {
        buttonBuy.alpha = 1.f;
        mainMoneyImage.image = [UIImage imageNamed:@"imageMoney.png"];
        mainMoneyImage.layer.cornerRadius = 0;
        
        
    } else {
        buttonBuy.alpha = 0.f;
        mainMoneyImage.image = [UIImage imageNamed:[dictCell objectForKey:@"image"]];
        mainMoneyImage.layer.cornerRadius = 20;
        
    }
    
    [[SingleTone sharedManager] setTitleSubCategory:[dictCell objectForKey:@"title"]];
    
    
    //Анимация алерта---------------------------------------------
    [UIView animateWithDuration:0.1 animations:^{
        darkView.alpha = 0.4f;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3 animations:^{
            CGRect rectAlert = alertView.frame;
            rectAlert.origin.y += 760;
            alertView.frame = rectAlert;
        }];
    }];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 128;
}

#pragma mark - CustomCell

//Кастомная ячейка---------------------------------------
- (UIView*) setTableCellWithTitle: (NSString*) string
                      andSubTitle: (NSString*) subTitle
                         andMoney: (BOOL) money
                         andImage: (NSString*) image
{
    //Основное окно ячейки--------------------------------
    UIView * cellView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 128)];
    cellView.backgroundColor = nil;
    
    //Создаем картинку------------------------------------
    UIImageView * imageViewCategory = [[UIImageView alloc] initWithFrame:CGRectMake(16, 16, 96, 96)];
    imageViewCategory.layer.cornerRadius = 0.5;
    imageViewCategory.image = [UIImage imageNamed:image];
    [cellView addSubview:imageViewCategory];
    
    //Заголовок-------------------------------------------
    UILabel * labelTitle = [[UILabel alloc] initWithFrame:CGRectMake(136, 16, 216, 24)];
    labelTitle.text = string;
    labelTitle.numberOfLines = 0;
    labelTitle.textColor = [UIColor colorWithHexString:@"d46458"];
    labelTitle.font = [UIFont fontWithName:FONTLITE size:23];
    [labelTitle sizeToFit];
    [cellView addSubview:labelTitle];
    
    //Подзаголовок----------------------------------------
    UILabel * labelSubTitle = [[UILabel alloc] initWithFrame:CGRectMake(136, 16 + labelTitle.frame.size.height, 216, 16)];
    labelSubTitle.text = subTitle;
    labelSubTitle.textColor = [UIColor colorWithHexString:@"c0c0c0"];
    labelSubTitle.numberOfLines = 0;
    labelSubTitle.font = [UIFont fontWithName:FONTLITE size:16];
    [labelSubTitle sizeToFit];
    [cellView addSubview:labelSubTitle];
    
    //Платная или нет-------------------------------------
    UIImageView * moneyImage = [[UIImageView alloc] initWithFrame:CGRectMake(80, 8, 40, 40)];
    moneyImage.image = [UIImage imageNamed:@"imageMoney.png"];
    [cellView addSubview:moneyImage];
    if (!money) {
        moneyImage.alpha = 0.f;
    }
    
    //Стрелка перехода------------------------------------
    UIImageView * arrowImage = [[UIImageView alloc] initWithFrame:CGRectMake(cellView.frame.size.width - 48, 40, 16, 48)];
    arrowImage.image = [UIImage imageNamed:@"arrowImage.png"];
    [cellView addSubview:arrowImage];
    
    //Граница ячейки--------------------------------------
    UIView * viewBorder = [[UIView alloc] initWithFrame:CGRectMake(16, 127, cellView.frame.size.width - 32, 1)];
    viewBorder.backgroundColor = [UIColor colorWithHexString:@"c0c0c0"];
    [cellView addSubview:viewBorder];
    
    return cellView;
}

#pragma mark - Buttons Methods
//Действие кнопки закрыть алерт
- (void) buttonCancelAction
{
    [UIView animateWithDuration:0.3 animations:^{
        CGRect rectAlert = alertView.frame;
        rectAlert.origin.y -= 760;
        alertView.frame = rectAlert;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 animations:^{
            darkView.alpha = 0;
        }];
    }];
}
//Действие кнопки добавить в избранное
- (void) buttonToFavoritesAction
{
    NSLog(@"ДОБАВИТЬ В ИЗБРАННОЕ");
}
//Действие кнопки открыть категорию
- (void) buttonOpenCategoryAction
{
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_SUB_CATEGORY_PUSH_TU_SUBCATEGORY object:nil];
    NSLog(@"Категория");
    [self performSelector:@selector(buttonCancelAction) withObject:nil afterDelay:0.5];
}

//Действие кнопки купить тему
-(void) buttonBuyAction
{
    NSLog(@"КУПИТЬ ТЕМУ");
}



@end