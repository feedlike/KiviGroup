//
//  MyVacanciesModel.m
//  Kinopro365
//
//  Created by Кирилл Ковыршин on 06.03.17.
//  Copyright © 2017 kiviLab.com. All rights reserved.
//

#import "MyVacanciesModel.h"
#import "APIManger.h"
#import "SingleTone.h"

@implementation MyVacanciesModel
@synthesize delegate;


-(void) loadVacanciesFromServerOffset: (NSString *) offset
                             andCount: (NSString *) count
                         andIsActive: (NSString *) isActive{
    
    APIManger * apiManager = [[APIManger alloc] init];
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                    offset,@"offset",
                                    count,@"count",
                                    isActive,@"is_active",nil];
    
    NSLog(@"PARAMS %@", params);
    
    
    [apiManager getDataFromSeverWithMethod:@"vacancy.getListAsAuthor" andParams:params andToken:[[SingleTone sharedManager] token] complitionBlock:^(id response) {
        NSLog(@"Vacancies %@",response);
        if([response objectForKey:@"error_code"]){
            
            NSLog(@"Ошибка сервера код: %@, сообщение: %@",[response objectForKey:@"error_code"],
                  [response objectForKey:@"error_msg"]);
            NSInteger errorCode = [[response objectForKey:@"error_code"] integerValue];
        }else{
            [self.delegate loadMyVacancies:[response objectForKey:@"response"]];
        }
        
        
    }];
    
    
}

@end
