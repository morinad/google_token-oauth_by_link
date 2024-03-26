// This file contains your Data Connector logic
section googleToken;

gsc_client_id = "184724904685-9djgus8luf6ksjoc06ae8absssum5mf9.apps.googleusercontent.com"; 
gsc_client_secret = "7hcVi_TEl5wmELtC4UIQQGNL";

ads_client_id = "13860562608-rolk2hhj4tecggm0k1odjrfo5m905hce.apps.googleusercontent.com";
ads_client_secret = "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";

analytics_client_id = "341719649792-bepi5bhc9lgip47apa14537jm5hm0k0h.apps.googleusercontent.com";
analytics_client_secret = "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";

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
            Code = "https://accounts.google.com/ServiceLogin?continue=https://accounts.google.com/o/oauth2/auth?scope%3Dhttps://www.googleapis.com/auth/adwords%26response_type%3Dcode%26access_type%3Doffline%26redirect_uri%3Dhttp%3A//127.0.0.1%3A9004%26client_id%3D282667056363-mse7dsjoo2i2pjkd5elqd3okvsdt7mqf.apps.googleusercontent.com%26from_login%3D1",
            Result ="Code"
        ],
        [
            Description = "Ссылка для Google Analytics",
            Code = "https://accounts.google.com/ServiceLogin?continue=https://accounts.google.com/o/oauth2/auth?scope%3Dhttps://www.googleapis.com/auth/analytics.readonly%26response_type%3Dcode%26access_type%3Doffline%26redirect_uri%3Dhttp%3A//127.0.0.1%3A9004%26client_id%3D341719649792-bepi5bhc9lgip47apa14537jm5hm0k0h.apps.googleusercontent.com%26from_login%3D1",
            Result ="Code"
        ],
        [
            Description = "Ссылка для Google Search Console",
            Code = "https://accounts.google.com/ServiceLogin?continue=https://accounts.google.com/o/oauth2/auth?scope%3Dhttps://www.googleapis.com/auth/webmasters.readonly%26response_type%3Dcode%26access_type%3Doffline%26redirect_uri%3Dhttp%3A//127.0.0.1%3A9004%26client_id%3D184724904685-9djgus8luf6ksjoc06ae8absssum5mf9.apps.googleusercontent.com%26from_login%3D1",
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

    url = code & "&" & app_credentials & "&redirect_uri=http%3A//127.0.0.1%3A9004&grant_type=authorization_code",
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
