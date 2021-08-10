﻿// This file contains your Data Connector logic
section googleToken;

gsc_client_id = "184724904685-9djgus8luf6ksjoc06ae8absssum5mf9.apps.googleusercontent.com";
gsc_client_secret = "7hcVi_TEl5wmELtC4UIQQGNL";

ads_client_id = "915356191438-3cj8gu3ddocdrhpm18q2vcrqf25pk8mo.apps.googleusercontent.com";
ads_client_secret = "RnRikyaGJJPNERlOvEwIlz2t";

analytics_client_id = "299222177909-8mvc09uilhdrick7kqjvf4hsi3tp4duc.apps.googleusercontent.com";
analytics_client_secret = "ELtgNWb9teqd20vCqDdARaok";

[DataSource.Kind="googleToken", Publish="googleToken.Publish"]


shared  googleToken.Links =  Value.ReplaceType(googleToken.Get, FuncType);


FuncType =  type function (
     srvc   as (type text meta [
        Documentation.FieldCaption = "API type:",
        Documentation.FieldDescription = "Choose google API type.",
        Documentation.AllowedValues = { "Google Ads", "Google Analytics", "Google Search Console"}
    ]),
    code   as (type text meta [
        Documentation.FieldCaption = "Enter your code:",
        Documentation.FieldDescription = "Enter the code you received from the link.",
        Documentation.SampleValues = {"123asdet;lekj456"}
    ])
    )
    as table meta [
        Documentation.Name = "Get google refresh token",
       Documentation.LongDescription = "",
        Documentation.Examples = {
        [
            Description = "Ссылка для Google Ads",
            Code = "https://accounts.google.com/ServiceLogin?continue=https://accounts.google.com/o/oauth2/auth?scope%3Dhttps://www.googleapis.com/auth/adwords%26response_type%3Dcode%26access_type%3Doffline%26redirect_uri%3Durn:ietf:wg:oauth:2.0:oob%26client_id%3D915356191438-3cj8gu3ddocdrhpm18q2vcrqf25pk8mo.apps.googleusercontent.com%26from_login%3D1",
            Result ="Code"
        ],
        [
            Description = "Ссылка для Google Analytics",
            Code = "https://accounts.google.com/ServiceLogin?continue=https://accounts.google.com/o/oauth2/auth?scope%3Dhttps://www.googleapis.com/auth/analytics.readonly%26response_type%3Dcode%26access_type%3Doffline%26redirect_uri%3Durn:ietf:wg:oauth:2.0:oob%26client_id%3D299222177909-8mvc09uilhdrick7kqjvf4hsi3tp4duc.apps.googleusercontent.com%26from_login%3D1",
            Result ="Code"
        ],
        [
            Description = "Ссылка для Google Search Console",
            Code = "https://accounts.google.com/ServiceLogin?continue=https://accounts.google.com/o/oauth2/auth?scope%3Dhttps://www.googleapis.com/auth/webmasters.readonly%26response_type%3Dcode%26access_type%3Doffline%26redirect_uri%3Durn:ietf:wg:oauth:2.0:oob%26client_id%3D184724904685-9djgus8luf6ksjoc06ae8absssum5mf9.apps.googleusercontent.com%26from_login%3D1",
            Result ="Code"
        ]
        }
    ]
;


googleToken.Get = (srvc as text,  code as text ) =>
  let
   app_credentials= 
    if srvc = "Google Ads" then "client_id="&ads_client_id&"&client_secret=" & ads_client_secret else
    if srvc = "Google Analytics" then "client_id="&analytics_client_id&"&client_secret=" & analytics_client_secret else
    if srvc = "Google Search Console" then "client_id="&gsc_client_id&"&client_secret=" & gsc_client_secret else "",

    code = "code=" & code,

    url = code & "&" & app_credentials & "&redirect_uri=urn:ietf:wg:oauth:2.0:oob&grant_type=authorization_code",
    GetJson = Web.Contents("https://accounts.google.com",
      [
        RelativePath = "/o/oauth2/token",
        Headers = [#"Content-Type"="application/x-www-form-urlencoded"],
        Content = Text.ToBinary(url),
        ManualStatusHandling = {400,404}
      ]
    ),
    Json2 = Json.Document(GetJson),
    refreshTokenOutput = try Json2[refresh_token] otherwise Text.Combine({Json2[error]?, Json2[error_description]?, "Bad authToken"}, " / ")
    
in
    refreshTokenOutput;


googleToken = [
    Authentication = [
        // Key = [],
        // UsernamePassword = [],
        // Windows = [],
        Implicit = []
    ],
    Label = Extension.LoadString("DataSourceLabel")
];

// Data Source UI publishing description
googleToken.Publish = [
    Beta = false,
    Category = "Other",
    ButtonText = { "GoogleToken Connector", "Help" },
    LearnMoreUrl = "http://directprobi.ru/",
    SourceImage = googleToken.Icons,
    SourceTypeImage = googleToken.Icons
];
googleToken.Icons = [
    Icon16 = { Extension.Contents("googleToken16.png"), Extension.Contents("googleToken20.png"), Extension.Contents("googleToken24.png"), Extension.Contents("googleToken32.png") },
    Icon32 = { Extension.Contents("googleToken32.png"), Extension.Contents("googleToken40.png"), Extension.Contents("googleToken48.png"), Extension.Contents("googleToken64.png") }
];