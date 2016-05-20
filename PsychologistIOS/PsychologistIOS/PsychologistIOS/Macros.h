//
//  Macros.h
//  ITDolgopa
//
//  Created by Viktor on 05.02.16.
//  Copyright © 2016 datastore24. All rights reserved.
//

#ifndef Macros_h
#define Macros_h

//Список кастомных тегов объектов приложени--------------------------------


//Макросы для приложения ---------------------------------------------------
//Тут записанны общие данные о хар-ках приложения---------------------------

//Шрифты и размеры в зависимости от устройства------------------------------

#define isiPhone5  ([[UIScreen mainScreen] bounds].size.height <= 568)?TRUE:FALSE

#define isiPhone6  ([[UIScreen mainScreen] bounds].size.height == 667)?TRUE:FALSE

#define isiPhone4s  ([[UIScreen mainScreen] bounds].size.height == 480)?TRUE:FALSE

//Шрифты--------------------------------------------------------------------------
#define FONTREGULAR @"SFUIDisplay-Regular"
#define FONTLITE @"SFUIDisplay-Light"
#define FONTBOND @"SFUIDisplay-Bold"
#define FONTULTRALIGHT @"SFUIDisplay-Ultralight.otf"


//Нотиикации----------------------------------------------------------------------
#define NOTIFICATION_LOGIN_VIEW_ANIMATION @"NOTIFICATION_LOGIN_VIEW_ANIMATION"
#define NOTIFICATION_LOGIN_VIEW_ANIMATION_BUTTON @"NOTIFICATION_LOGIN_VIEW_ANIMATION_BUTTON"
#define NOTIFICATION_LOGIN_VIEW_PUSH_MAIN_VIEW @"NOTIFICATION_LOGIN_VIEW_PUSH_MAIN_VIEW"
#define NOTIFICATION_SEND_SMS_CODE @"NOTIFICATION_SEND_SMS_CODE"
#define NOTIFICATION_SEND_EMAIL_CODE @"NOTIFICATION_SEND_EMAIL_CODE"

#define NOTIFICATION_SEND_EMAIL_XENIA @"NOTIFICATION_SEND_EMAIL_XENIA"
#define NOTIFICATION_SEND_EMAIL_SUPPORT @"NOTIFICATION_SEND_EMAIL_SUPPORT"
#define NOTIFICATION_SEND_PERSONAL_SMS @"NOTIFICATION_SEND_PERSONAL_SMS"
#define NOTIFICATION_SAVE_PROFILE @"NOTIFICATION_SAVE_PROFILE"




#define NOTIFICATION_CATEGORY_PUSH_TU_SUBCATEGORY @"NOTIFICATION_CATEGORY_PUSH_TU_SUBCATEGORY"
#define NOTIFICATION_SUB_CATEGORY_PUSH_TU_SUBCATEGORY @"NOTIFICATION_SUB_CATEGORY_PUSH_TU_SUBCATEGORY"
#define NOTIFICATION_SUBJECT_PUSH_TU_SUBCATEGORY @"NOTIFICATION_SUBJECT_PUSH_TU_SUBCATEGORY"
#define NOTIFICATION_OPEN_SUBJECT_PUSH_TU_DISCUSSIONS @"NOTIFICATION_OPEN_SUBJECT_PUSH_TU_DISCUSSIONS"

#define NOTIFICATION_REQUEST_IMAGE_FOR_DUSCUSSIONS @"NOTIFICATION_REQUEST_IMAGE_FOR_DUSCUSSIONS"
#define NOTIFICATION_SEND_IMAGE_FOR_DUSCUSSIONS_VIEW @"NOTIFICATION_SEND_IMAGE_FOR_DUSCUSSIONS_VIEW"

#define NOTIFICATION_PUSH_ABOUT_XENIA_WITH_RECOMMEND @"NOTIFICATION_PUSH_ABOUT_XENIA_WITH_RECOMMEND"
#define NOTIFICATION_PUSH_BOOKMARKS_WITH_OPENSUBJECT @"NOTIFICATION_PUSH_BOOKMARKS_WITH_OPENSUBJECT"

#define NOTIFICATION_PUSH_SUBSCRIPTION_WITH_OPENSUBJECT @"NOTIFICATION_PUSH_SUBSCRIPTION_WITH_OPENSUBJECT"

#define NOTIFICATION_PUSH_INSTRUCTIONS_WITH_INSTRUCTION_DETAILS @"NOTIFICATION_PUSH_INSTRUCTIONS_WITH_INSTRUCTION_DETAILS"
#define NOTIFICATION_PUSH_FAMELE_WITH_CHAT @"NOTIFICATION_PUSH_FAMELE_WITH_CHAT"

#define NOTIFICATION_PUSH_SUBSCRIPTION @"NOTIFICATION_PUSH_SUBSCRIPTION"
#define NOTIFICATION_PUSH_BUY_CATEGORY @"NOTIFICATION_PUSH_BUY_CATEGORY"

#define NOTIFICATION_REQUEST_IMAGE_FOR_CHAT @"NOTIFICATION_REQUEST_IMAGE_FOR_CHAT"
#define NOTIFICATION_SEND_IMAGE_FOR_CHAT_VIEW @"NOTIFICATION_SEND_IMAGE_FOR_CHAT_VIEW"

//Нотификации записи аудиофайлов--------------
#define NOTIFICATION_AUDIO_START_RECORD @"NOTIFICATION_AUDIO_START_RECORD"
#define NOTIFICATION_AUDIO_STOP_RECORD @"NOTIFICATION_AUDIO_STOP_RECORD"
#define NOTIFICATION_AUDIO_POST @"NOTIFICATION_AUDIO_POST"

//Нотификации отправки сообщений с данными-----
#define NOTIFICATION_POST_MESSAGE_IN_CHAT @"NOTIFICATION_POST_MESSAGE_IN_CHAT"
#define NOTIFICATION_POST_IMAGE_IN_CHAT @"NOTIFICATION_POST_IMAGE_IN_CHAT"
#define NOTIFICATION_POST_AUDIO_IN_CHAT @"NOTIFICATION_POST_AUDIO_IN_CHAT"


//Нотификация поднимает вью нотификации вверх----
#define NOTIFICATION_UP_VIEW_NOTIFICATION @"NOTIFICATION_UP_VIEW_NOTIFICATION"

//Закладки---------------------------------------
#define NOTIFICATION_SEND_BOOKMARK_CATEGORY @"NOTIFICATION_SEND_BOOKMARK_CATEGORY"
#define NOTIFICATION_SEND_BOOKMARK_SUB_CATEGORY @"NOTIFICATION_SEND_BOOKMARK_SUB_CATEGORY"
#define NOTIFICATION_SEND_BOOKMARK_SUBJECT @"NOTIFICATION_SEND_BOOKMARK_SUBJECT"

//Нотификации перехода из закладки------------
#define NOTIFICATION_PUSH_BOOKMARK_CATEGORY @"NOTIFICATION_PUSH_BOOKMARK_CATEGORY"
#define NOTIFICATION_PUSH_BOOKMARK_SUB_CATEGORY @"NOTIFICATION_PUSH_BOOKMARK_SUB_CATEGORY"
#define NOTIFICATION_PUSH_BOOKMARK_SUBJECT @"NOTIFICATION_PUSH_BOOKMARK_SUBJECT"

#define NOTIFICATION_DELET_CELL_BOOKMARK @"NOTIFICATION_DELET_CELL_BOOKMARK"




#endif /* Macros_h */
