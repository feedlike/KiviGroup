//
//  ModelRuler.m
//  mykamchatka
//
//  Created by Viktor on 15.03.16.
//  Copyright © 2016 KiviLab. All rights reserved.
//

#import "ModelRuler.h"

@implementation ModelRuler

- (NSArray*) addArrayName
{
    NSArray * nameArray = [NSArray arrayWithObjects:
                           @"Общие положения",
                           @"Цели Фотоконкурса ",
                           @"Оргкомитет Фотоконкурса",
                           @"Проведение Фотоконкурса",
                           @"Требования к фотоработам",
                           @"Критерии оценки работ",
                           @"Организатор обязуется",
                           @"Участник гарантирует", nil];
    return nameArray;
}


- (NSArray*) addArrayData
{
    NSArray * dataArray = [NSArray arrayWithObjects:
                           @"- Настоящее Положение регламентирует порядок проведения конкурса любительских фотографий, отражающих красоту и привлекательность Камчатского края \n- «Моя любимая Камчатка – приглашение к путешествию» (далее Фотоконкурс).\n- Автором проекта фотоконкурса «Моя любимая Камчатка – приглашение к путешествию» является депутат Государственной Думы РФ Яровая Ирина Анатольевна.\n- Фотоконкурс проводится в соответствии с настоящим Положением, условия которого при его проведении являются обязательными.",
                           
                           @"- Целями Фотоконкурса являются:\n• популяризация природной красоты Камчатского края, памятников истории и культуры;\n• создание условий для творческой самореализации детей и молодежи;\n• поддержка творческих инициатив;\n• формирование имиджа Камчатского края как территории, привлекательной для гостей и туристов со всего мира.",
                           
                           @"- Состав Оргкомитета Фотоконкурса определяется автором Проекта.\n- Функции Оргкомитета:\n• организация и проведение Фотоконкурса;\n• организация работы жюри;\n• организация размещения работ финалистов Фотоконкурса в бортовом журнале и других рекламных продуктах авиакомпании «Аэрофлот – Российские авиалинии»;\n• организация фотовыставки финалистов проекта Фотоконкурса «Моя любимая Камчатка приглашение к путешествию»;\n• выпуск серии открыток и другой продукции с работами-победителями;\n• организация церемонии награждения победителей Фотоконкурса;\n• организация мастер-класса для победителей и номинантов Фотоконкурса.",
                           
                           @"- В Фотоконкурсе могут принять участие молодые фотографы-любители Камчатского края в возрасте до 21 года, согласные с условиями Фотоконкурса и настоящим Положением.\n- Условия конкурса, требования к фотографиям, подробная информация о номинациях, призах размещена на официальном сайте Фотоконкурса photokamchatka.irinayarovaya.ru\n- Для участия в Фотоконкурсе необходимо до 18 мая 2016 г. сделать постановочные и/или репортажные, и/или выбранные из семейного архива фотографии соответствующие заявленной теме фотоконкурса, прислать работы в электронном виде по электронному адресу: photokamchatka@irinayarovaya.ru\nс пометкой Фотоконкурс «Моя любимая Камчатка – приглашение к путешествию». В сопроводительном письме указать контактную информацию об авторе-участнике (контактное лицо, возраст, номер телефона).\n- Количество фоторабот от одного участника не может быть более трех .\n- Все присланные на Фотоконкурс работы не возвращаются и не рецензируются. Работы участников могут использоваться организаторами для популяризации Фотоконкурса и для освещения заданных тем с обязательным указанием авторства.\n- Ответственность за несоблюдение авторства присылаемых фоторабот несут участники Фотоконкурса, представившие данную работу.\n- Организаторы Фотоконкурса не несут ответственности за нарушение участниками авторских прав третьих лиц.\n- Фотоконкурс проводится в один этап по четырем номинациям:\n• «Зима»\n• «Весна»\n• «Лето»\n• «Осень»\n- Отбор победителя, призеров Фотоконкурса, а также победителей по номинациям осуществляется членами жюри по завершении приёма работ на Фотоконкурс./n- Состав жюри:\n•  Яровая Ирина Анатольевна;\n•  Говорухин Станислав Сергеевич;\n•  Савельев Виталий Геннадьевич;\n•  Фетисов Вячеслав Александрович;\n•  Горшков Сергей Владимирович;\n•  Шпиленок Игорь Петрович.\n- Победитель и призеры будут награждены дипломами и памятными подарками.\n- Права на использование фотографий, поступивших на Фотоконкурс, переходят к Организатору Фотоконкурса.",
                           
                           @"•   Формат файла: JPG, TIFF;\n•   Разрешение изображения: 300 dpi;\n•   Принимаются фотографии как вертикальной, так и горизонтальной расположенности;\n•  Размер изображения: основным критерием является возможность распечатать фотографию размером 40х60 см. высокого качества;\n•   Размер файла желательно не превышать 10 Мб;\n•  Рассматриваются исключительно фотографии без дополнительных надписей, рамок, подписей и прочих элементов, добавленных поверх фото, полученного с камеры или после базовой постобработки.\n•  Допускается обработка фотографий, направляемых на Фотоконкурс, с помощью компьютерных программ (графических редакторов).",
                           
                           @"- При отборе работ для участия в финале Фотоконкурса жюри будет оценивать:\n•   соответствие фоторабот заявленной тематике Фотоконкурса;\n•   содержание;\n•   информативность фотоматериала;\n•   художественное качество исполнения.",
                           
                           @"- Контролировать и координировать проведение Фотоконкурса.\n- Оценивать представленные на Фотоконкурс/nработы в соответствии с требованиями настоящего Положения.\n- Подводить итоги и награждать победителей Фотоконкурса./n- Распространять информацию о Фотоконкурсе и его итогах в СМИ и социальных сетях.",
                           
                           @"- Что он является автором работ и не нарушает авторских прав.\n- Что авторское произведение ранее не принимало участие в фотоконкурсах.\n- Контактная информация Оргкомитета Фотоконкурса «Моя любимая Камчатка – приглашение к путешествию»\n• e-mail: photokamchatka@irinayarovaya.ru", nil];
    return dataArray;
}

@end
