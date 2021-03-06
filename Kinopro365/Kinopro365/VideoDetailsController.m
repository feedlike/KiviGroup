//
//  VideoDetailsController.m
//  Kinopro365
//
//  Created by Виктор Мишустин on 2/6/17.
//  Copyright © 2017 kiviLab.com. All rights reserved.
//

#import "VideoDetailsController.h"
#import "VideoDetailsModel.h"
#import "VideoDetailsView.h"

@interface VideoDetailsController () <VideoDetailsModelDelegate, VideoDetailsViewDelegate>

@property (assign, nonatomic) NSInteger x; //-----------
@property (assign, nonatomic) NSInteger y; //Числовые параметры для отрисовки таблицы

@property (assign, nonatomic) BOOL actionButton; //если YES фото переходят в режим редактирования
@property (assign, nonatomic) NSInteger countDelete; //Колличество выбранных объектов на удаление
@property (strong, nonatomic) NSMutableArray *arrayDelete; //Массив для удаления объектов

@property (strong, nonatomic) NSMutableArray * arrayViews;

@property (strong, nonatomic) NSArray * arrayData;

@property (strong, nonatomic) VideoDetailsModel * videoDetailsModel;


@end

@implementation VideoDetailsController

- (void) loadView {
    [super loadView];
    
    [self.navigationController setNavigationBarHidden: NO animated:YES];
    
    UILabel * CustomText = [[UILabel alloc]initWithTitle:@"Видео"];
    self.navigationItem.titleView = CustomText;
    
    
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.videoDetailsModel = [[VideoDetailsModel alloc] init];
    self.arrayViews = [NSMutableArray array];
    self.videoDetailsModel.delegate = self;
    
    
    self.actionButton = NO;
    self.countDelete = 0;
    self.arrayDelete = [NSMutableArray array];
    
    

}

-(void) loadViewCustom {
    
    [self.arrayDelete removeAllObjects];
    
    self.countDelete = 0;
    
    self.buttonConfDelete.alpha = 0;
    
    [self createActivitiIndicatorAlertWithView];
    
    [self.videoDetailsModel getVideoArrayWithOffset:@"0" andCount:@"1000"];
    
    [self creationViews];
    
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
    [self loadViewCustom];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






#pragma mark - Actions

- (IBAction)actionButtonBack:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)actionButtonAddVideo:(UIBarButtonItem *)sender {
        self.actionButton = NO;
    
        [self pushCountryControllerWithIdentifier:@"VideoViewController"];
}

- (IBAction)actionButtonDelete:(UIBarButtonItem *)sender {
    NSLog(@"arrayViews %@", self.arrayViews);
    if (self.arrayViews.count != 0) {
        if (!self.actionButton) {
            [sender setImage:[UIImage imageNamed:@"buttonDeleteOff"] ];
            self.actionButton = YES;
        } else {
            [sender setImage:[UIImage imageNamed:@"buttonDeleteOn"]];
            self.actionButton = NO;
            [self allClear];
        }
    } else {
        [self showAlertWithMessage:@"У вас нет не одного видео для удаления"];
    }
}

- (IBAction)actionButtonConfDelete:(UIButton *)sender {
    self.actionButton = NO;
    [self.videoDetailsModel deleteVideos:self.arrayDelete];
    [self.buttonDelete setImage:[UIImage imageNamed:@"buttonDeleteOn"]];
    
    
}

#pragma mark - VideoDetailsModelDelegate

- (void) loadVideo: (NSArray *) array{
    
    self.arrayData = array;
    [self creationViews];

}

#pragma mark - VideoDetailsViewDelegate

- (void) actionButton: (VideoDetailsView*) videoDetailsView andButton: (CustomButton*) button {
    
    if (!self.actionButton) {
        [videoDetailsView playVideo];
    } else {
        if (!button.isBool) {
            button.isBool = YES;
            videoDetailsView.imageViewDelete.alpha = 1.f;
            self.countDelete += 1;
            [self.arrayDelete addObject:videoDetailsView];
        } else {
            videoDetailsView.imageViewDelete.alpha = 0.f;
            button.isBool = NO;
            self.countDelete -= 1;
            [self.arrayDelete removeObject:videoDetailsView];
        }
    }
    if (self.countDelete > 0) {
        self.buttonConfDelete.alpha = 1;
    } else {
        self.buttonConfDelete.alpha = 0;
    }
    
    
    
}

#pragma mark - CreationvViews

- (void) creationViews {
    
    for (UIView * view in self.mainScrollView.subviews) {
        [view removeFromSuperview];
        [self.arrayViews removeAllObjects];
    }
    self.x = 0;
    self.y = 0;
    
    
    for (int i = 0; i < self.arrayData.count; i++) {
        
        NSDictionary * dict = [self.arrayData objectAtIndex:i];
        
        CGRect rectView = CGRectMake(15 + 155 * self.x, 15 + 94 * self.y, 140, 79);
        if (isiPhone6) {
            rectView = CGRectMake(15 + 181.5 * self.x, 15 + 110.5 * self.y, 166, 95.5);
        }  else if (isiPhone6Plus) {
            rectView = CGRectMake(20 + 194.5 * self.x, 15 + 127.5 * self.y, 179.5, 101);
        }
        
        VideoDetailsView * view = [[VideoDetailsView alloc] initWithCustonFrame: rectView
                                                                          andID:[dict objectForKey:@"id"]
                                                                         andURL:[dict objectForKey:@"link"]];
        [self.arrayViews addObject:view];
        view.delegateView = self;
        
        [self.mainScrollView addSubview:view];
        
        self.x += 1;
        if (self.x > 1) {
            self.x = 0;
            self.y += 1;
        }
        
    }
    [self deleteActivitiIndicator];
}

- (void) desableActivityIndicator {
    
    [self deleteActivitiIndicator];
    
}

- (void) allClear {
    
    self.countDelete = 0;
    self.buttonConfDelete.alpha = 0;
    
    for (VideoDetailsView * view in self.arrayViews) {
        view.imageViewDelete.alpha = 0;
        view.button.isBool = NO;
    }
    
    [self.arrayDelete removeAllObjects];
}


@end
