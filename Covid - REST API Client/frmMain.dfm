object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Corona V'#237'rus'
  ClientHeight = 618
  ClientWidth = 1384
  Color = clBackground
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel
    Left = 25
    Top = 16
    Width = 54
    Height = 15
    Caption = 'Atualizar'
    Font.Charset = ANSI_CHARSET
    Font.Color = 49663
    Font.Height = -13
    Font.Name = 'Roboto Bk'
    Font.Style = []
    ParentFont = False
  end
  object leftMenu: TPanel
    Left = 0
    Top = 41
    Width = 249
    Height = 577
    Align = alLeft
    BevelOuter = bvNone
    Color = clBackground
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    object globalCases: TPanel
      AlignWithMargins = True
      Left = 5
      Top = 0
      Width = 239
      Height = 65
      Margins.Left = 5
      Margins.Top = 0
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alTop
      BevelOuter = bvNone
      Color = 2236962
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      StyleElements = [seFont, seClient]
      object lblGlobalCases: TLabel
        Left = 0
        Top = 22
        Width = 239
        Height = 27
        Align = alTop
        Alignment = taCenter
        Caption = '0'
        Color = clBackground
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -24
        Font.Name = 'Arial'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
        ExplicitWidth = 13
      end
      object lblTitleGlobalCases: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 233
        Height = 14
        Margins.Bottom = 5
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Caption = 'Casos globais'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12434877
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 8
      end
    end
    object casesByCountries: TPanel
      AlignWithMargins = True
      Left = 5
      Top = 70
      Width = 239
      Height = 432
      Margins.Left = 5
      Margins.Top = 0
      Margins.Right = 5
      Margins.Bottom = 0
      Align = alClient
      BevelOuter = bvNone
      Caption = 'casesByCountries'
      Color = 2236962
      Ctl3D = True
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 1
      object lblTitleCasesByCountry: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 233
        Height = 14
        Margins.Bottom = 5
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Caption = 'Casos por Pa'#237'ses'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12434877
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        ExplicitWidth = 85
      end
      object lstCountries: TListView
        Left = 0
        Top = 22
        Width = 239
        Height = 410
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alClient
        Anchors = []
        BevelEdges = []
        BevelInner = bvNone
        BevelOuter = bvNone
        BiDiMode = bdLeftToRight
        BorderStyle = bsNone
        Color = 2236962
        Columns = <
          item
            Caption = 'Casos'
            Width = 65
          end
          item
            Caption = 'Pa'#237's'
            Width = 156
          end>
        ColumnClick = False
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        GridLines = True
        HideSelection = False
        ReadOnly = True
        RowSelect = True
        ParentBiDiMode = False
        ParentFont = False
        ShowColumnHeaders = False
        ShowWorkAreas = True
        TabOrder = 0
        ViewStyle = vsReport
        OnAdvancedCustomDrawSubItem = lstCountriesAdvancedCustomDrawSubItem
        OnClick = lstCountriesClick
      end
    end
    object lastUpdate: TPanel
      AlignWithMargins = True
      Left = 5
      Top = 507
      Width = 239
      Height = 65
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alBottom
      BevelOuter = bvNone
      Color = 2236962
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 2
      StyleElements = [seFont, seClient]
      object lblLastUpdate: TLabel
        Left = 0
        Top = 22
        Width = 239
        Height = 24
        Align = alTop
        Alignment = taCenter
        Caption = '0'
        Color = clBackground
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
        ExplicitWidth = 12
      end
      object lblTitleLastUpdate: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 233
        Height = 14
        Margins.Bottom = 5
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Caption = #218'ltima atualiza'#231#227'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12434877
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 6
        ExplicitTop = 11
      end
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 0
    Width = 1384
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Panel4'
    TabOrder = 1
    object Panel5: TPanel
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 1374
      Height = 31
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alClient
      BevelOuter = bvNone
      Color = 2236962
      ParentBackground = False
      TabOrder = 0
      object lblTitle: TLabel
        AlignWithMargins = True
        Left = 50
        Top = 7
        Width = 1232
        Height = 21
        Margins.Left = 50
        Margins.Top = 7
        Align = alClient
        Caption = 
          'Plataforma de acompanhamento de casos de corona v'#237'rus em diferen' +
          'tes pa'#237'ses'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12434877
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        ExplicitWidth = 553
        ExplicitHeight = 18
      end
      object Label1: TLabel
        AlignWithMargins = True
        Left = 1285
        Top = 8
        Width = 59
        Height = 20
        Margins.Left = 0
        Margins.Top = 8
        Margins.Right = 0
        Align = alRight
        AutoSize = False
        Caption = 'Atualizar'
        Font.Charset = ANSI_CHARSET
        Font.Color = 49663
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = Label1Click
        ExplicitLeft = 1283
        ExplicitTop = 10
        ExplicitHeight = 18
      end
      object Image1: TImage
        AlignWithMargins = True
        Left = 1347
        Top = 3
        Width = 24
        Height = 25
        Align = alRight
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000180000
          00180806000000E0773DF80000000473424954080808087C0864880000000970
          485973000000A6000000A601DD7DFF380000001974455874536F667477617265
          007777772E696E6B73636170652E6F72679BEE3C1A000002764944415478DAB5
          554B68134118FE6657B36B7C80E01B0A16295E4411155B6B9BF5A0A0271F8827
          2DA8881E8328681114B447E95128422BC54305C58388E023DD94D2632B561445
          8A1429546FA649B6ED8CDF365133DB3CA63E36647666F69FEFFBDF23945258D0
          93765F418921B466AF98888B0513F8EECF039D68CD25FF278111497582947061
          3B0928B58BA23BB9C3373644A4AA9254261888EFC6ACEC81C0E69A5609D18196
          6CBB19C15B11C357F706A02E71659B3A8E5624CC087CF709C74386C0E13301A9
          F6C1CBBFAB4DE02F69A3E6DD65E442A1106090FF33A6E03A417AE97A28394AAC
          9511EC2148FB38BCA9F1A285CA145C27F09D1E2E4F453EDF4726771A0755BEC4
          8501C76F26E01102F733C7BA12CD09126C84A7BE6B27FADDFDACE40FF0B26326
          012A10A456AC82154CEA9E51ED48E43B4C406A13F8EE01CE9F695FA4DC0E2F18
          FE37046937C93CB9FD5704734A8A3D45D40CE2F94EEC50D34502E730FDFAE88F
          095EBA9BB008EF515A98429C6475F716085E2C5B8BC5331311E36EB2255F3322
          E877AE12F096AE201AE0E53E9666D1278EF5252253B0ED063467BE54057F2A1C
          C49D9148CF1A63EBA8FF1D83392DDC2E0A9DD50E2BD58B441056B7AC10428BF5
          D3C7C9317D1B5D68C99DD3090697AFC1CCF41BCE5647505E438A8BCCFBE7DA6E
          CAD9024BB029E268443E074B36626F30A213147C7984BE7C58C1193EC5C721E4
          2CDF75CC3AAFBC51B840EDEFFC5ACEEFA64E37B7DB6A06B63C7A1F13E384B633
          8FE081B0B12E7699697B9DAB9821B2E2EF2E543E196D2D556EB4D83648EB1E67
          5B6B408F4259E7D96D07CADA54F54E0E6FB749B79949DD44D126FAB71161FA2A
          065E08A6A61C463C781C566C25881F032923E019479F600000000049454E44AE
          426082}
        OnClick = Image1Click
        ExplicitLeft = 77
        ExplicitTop = 5
        ExplicitHeight = 23
      end
    end
  end
  object WebBrowser: TWebBrowser
    AlignWithMargins = True
    Left = 249
    Top = 41
    Width = 1130
    Height = 572
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alClient
    TabOrder = 2
    ExplicitLeft = 384
    ExplicitTop = 152
    ExplicitWidth = 446
    ExplicitHeight = 288
    ControlData = {
      4C000000CA7400001E3B00000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object RESTCountries: TRESTRequest
    Client = RESTClient
    Params = <>
    Resource = 'v3/covid-19/countries?sort=cases'
    Response = RESTResponse1
    Left = 336
    Top = 240
  end
  object RESTClient: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'https://corona.lmao.ninja'
    Params = <>
    Left = 360
    Top = 200
  end
  object FDMemTable1: TFDMemTable
    AutoCalcFields = False
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvLockPoint, uvLockWait, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable, uvAutoCommitUpdates]
    UpdateOptions.LockWait = True
    UpdateOptions.FetchGeneratorsPoint = gpNone
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 360
    Top = 360
  end
  object RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter
    Dataset = FDMemTable1
    FieldDefs = <>
    Response = RESTResponse1
    Left = 360
    Top = 320
  end
  object RESTResponse1: TRESTResponse
    Left = 360
    Top = 280
  end
  object RESTAll: TRESTRequest
    Client = RESTClient
    Params = <>
    Resource = 'v3/covid-19/all'
    Response = RESTResponse1
    Left = 368
    Top = 240
  end
  object RESTHistorical: TRESTRequest
    Client = RESTClient
    Params = <>
    Resource = 'v3/covid-19/historical/all?lastdays=30'
    Response = RESTResponse1
    Left = 400
    Top = 240
  end
  object RESTSpecificHistoricalCountry: TRESTRequest
    Client = RESTClient
    Params = <>
    Resource = 'v3/covid-19/historical/'
    Response = RESTResponse1
    Left = 304
    Top = 240
  end
end
