# Получение refresh_token из Google в Power BI

### Новые видео, статьи и полезности в Telegram-канале: https://t.me/+2kqVrjV5aXs0NTRi

### Все коннекторы и поддержка:
В рамках подписки "ПРО" на Boosty https://boosty.to/morinad вы получите:
1) Все коннекторы mez для Power BI. 
2) Поддержку и ответы на вопросы.
3) Полезные наработки, скрипты и файлы.

### Наши курсы по Power Query, Power BI и автоматизации:
1) Основы Power BI (бесплатный курс): https://directprorf.ru/basics?utm_source=github
2) Power BI для рекламных отчётов: https://directprorf.ru/powerbi?utm_source=github
3) Из API в Excel и Power BI + коннекторы: https://directprorf.ru/excel?utm_source=github
4) Коннекторы для Маркетплейсов: https://directprorf.ru/marketplaces?utm_source=github
5) Продвинутый Power Query: https://directprorf.ru/pro?utm_source=github
6) Создание коннекторов в Power Query: https://directprorf.ru/connectors?utm_source=github
7) API ChatGPT для автоматизации бизнеса: https://directprorf.ru/chatgpt?utm_source=github


### Как воспользоваться коннектором:

1) Скачайте файл коннектора googleToken.mez и поместите в папку C:\Users\USERNAME\Documents\Power BI Desktop\Custom Connectors, подставив USERNAME своего компьютера.: 
https://github.com/morinad/google_token-oauth_by_link/raw/main/googleToken.mez

2) Откройте Power BI, зайдите в Файл -> Параметры и настройки -> Параметры -> Глобальные -> Безопасность, выберите "Разрешить загрузку любого расширения без проверок и предупреждений".

3) Выберите сервис - Google Ads, Google Analytics или Google Search Console. Для каждого сервиса будет своя ссылка.


Google Ads: https://accounts.google.com/ServiceLogin?continue=https://accounts.google.com/o/oauth2/auth?scope%3Dhttps://www.googleapis.com/auth/adwords%26response_type%3Dcode%26access_type%3Doffline%26redirect_uri%3Dhttp%3A//127.0.0.1%3A9004%26client_id%3D282667056363-mse7dsjoo2i2pjkd5elqd3okvsdt7mqf.apps.googleusercontent.com%26from_login%3D1

Google Analytics: https://accounts.google.com/ServiceLogin?continue=https://accounts.google.com/o/oauth2/auth?scope%3Dhttps://www.googleapis.com/auth/analytics.readonly%26response_type%3Dcode%26access_type%3Doffline%26redirect_uri%3Dhttp%3A//127.0.0.1%3A9004%26client_id%3D341719649792-bepi5bhc9lgip47apa14537jm5hm0k0h.apps.googleusercontent.com%26from_login%3D1

Google Search Console: https://accounts.google.com/ServiceLogin?continue=https://accounts.google.com/o/oauth2/auth?scope%3Dhttps://www.googleapis.com/auth/webmasters.readonly%26response_type%3Dcode%26access_type%3Doffline%26redirect_uri%3Dhttp%3A//127.0.0.1%3A9004%26client_id%3D184724904685-9djgus8luf6ksjoc06ae8absssum5mf9.apps.googleusercontent.com%26from_login%3D1

4) Нажмите на кнопку "Получить данные", в поиске найдите коннектор googleToken. Выбрав коннектор, укажите нужное API и код, полученный в пункте 3. На выходе вы получите refresh_token.

5) Используйте refresh_token в соответствующем коннекторе для получения данных. 

