# Получение refresh_token из Google в Power BI

### Наши курсы:
1) Основы Power BI (3 часа): https://directprorf.ru/basics?utm_source=github
2) Курс по коннекторам в Excel (4 часа): https://directprorf.ru/excel?utm_source=github
3) Большой курс по обработке данных в Power Query (8 часов): https://directprorf.ru/pq?utm_source=github

По всем вопросам, связанным с курсами и коннекторами: https://t.me/alexdirect или +79169787746.

### Как воспользоваться коннектором:

1) Скачайте файл коннектора googleToken.mez и поместите в папку C:\Users\USERNAME\Documents\Power BI Desktop\Custom Connectors, подставив USERNAME своего компьютера.: 
https://github.com/morinad/google_token-oauth_by_link/raw/main/googleToken.mez

2) Откройте Power BI, зайдите в Файл -> Параметры и настройки -> Параметры -> Глобальные -> Безопасность, выберите "Разрешить загрузку любого расширения без проверок и предупреждений".

3) Выберите сервис - Google Ads, Google Analytics или Google Search Console. Для каждого сервиса будет своя ссылка.

Google Ads: https://accounts.google.com/ServiceLogin?continue=https://accounts.google.com/o/oauth2/auth?scope%3Dhttps://www.googleapis.com/auth/adwords%26response_type%3Dcode%26access_type%3Doffline%26redirect_uri%3Durn:ietf:wg:oauth:2.0:oob%26client_id%3D915356191438-3cj8gu3ddocdrhpm18q2vcrqf25pk8mo.apps.googleusercontent.com%26from_login%3D1

Google Analytics: https://accounts.google.com/ServiceLogin?continue=https://accounts.google.com/o/oauth2/auth?scope%3Dhttps://www.googleapis.com/auth/analytics.readonly%26response_type%3Dcode%26access_type%3Doffline%26redirect_uri%3Durn:ietf:wg:oauth:2.0:oob%26client_id%3D299222177909-8mvc09uilhdrick7kqjvf4hsi3tp4duc.apps.googleusercontent.com%26from_login%3D1

Google Search Console: https://accounts.google.com/ServiceLogin?continue=https://accounts.google.com/o/oauth2/auth?scope%3Dhttps://www.googleapis.com/auth/webmasters.readonly%26response_type%3Dcode%26access_type%3Doffline%26redirect_uri%3Durn:ietf:wg:oauth:2.0:oob%26client_id%3D184724904685-9djgus8luf6ksjoc06ae8absssum5mf9.apps.googleusercontent.com%26from_login%3D1

4) Нажмите на кнопку "Получить данные", в поиске найдите коннектор googleToken. Выбрав коннектор, укажите нужное API и код, полученный в пункте 3. На выходе вы получите refresh_token.

5) Используйте refresh_token в соответствующем коннекторе для получения данных. 

