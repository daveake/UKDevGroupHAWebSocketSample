object Form1: TForm1
  Width = 915
  Height = 621
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Segoe UI'
  Font.Style = []
  ParentFont = False
  object WebPanel1: TWebPanel
    Left = 0
    Top = 0
    Width = 181
    Height = 621
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    Align = alLeft
    BorderColor = clSilver
    BorderStyle = bsSingle
    ExplicitLeft = 40
    ExplicitTop = 68
    ExplicitHeight = 345
    object WebButton1: TWebButton
      AlignWithMargins = True
      Left = 6
      Top = 6
      Width = 169
      Height = 73
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Align = alTop
      Caption = 'Connect'
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
      OnClick = WebButton1Click
      ExplicitLeft = 28
      ExplicitTop = 124
      ExplicitWidth = 145
    end
    object WebButton2: TWebButton
      AlignWithMargins = True
      Left = 6
      Top = 91
      Width = 169
      Height = 73
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Align = alTop
      Caption = 'Get Config'
      ChildOrder = 1
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
      OnClick = WebButton2Click
      ExplicitLeft = 3
      ExplicitTop = 176
    end
    object WebButton3: TWebButton
      AlignWithMargins = True
      Left = 6
      Top = 176
      Width = 169
      Height = 73
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Align = alTop
      Caption = 'Get States'
      ChildOrder = 1
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
      OnClick = WebButton3Click
      ExplicitLeft = 12
      ExplicitTop = 231
    end
    object WebButton4: TWebButton
      AlignWithMargins = True
      Left = 6
      Top = 261
      Width = 169
      Height = 73
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Align = alTop
      Caption = 'Subscribe'
      ChildOrder = 1
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
      OnClick = WebButton4Click
      ExplicitTop = 300
    end
  end
  object WebPageControl1: TWebPageControl
    Left = 181
    Top = 0
    Width = 734
    Height = 621
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    Align = alClient
    ChildOrder = 1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabIndex = 3
    ParentFont = False
    TabOrder = 1
    ExplicitLeft = 184
    ExplicitWidth = 459
    ExplicitHeight = 480
    object WebPageControl1Sheet1: TWebTabSheet
      Left = 0
      Top = 20
      Width = 734
      Height = 601
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
      Caption = 'Log'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      object WebMemo1: TWebMemo
        Left = 0
        Top = 0
        Width = 734
        Height = 601
        Align = alClient
        AutoSize = False
        HeightPercent = 100.000000000000000000
        SelLength = 0
        SelStart = 0
        WidthPercent = 100.000000000000000000
        ExplicitLeft = 264
        ExplicitTop = 112
        ExplicitWidth = 157
        ExplicitHeight = 165
      end
    end
    object WebPageControl1Sheet2: TWebTabSheet
      Left = 0
      Top = 20
      Width = 734
      Height = 601
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
      Caption = 'Raw JSON'
      ChildOrder = 1
      object WebMemo2: TWebMemo
        Left = 0
        Top = 0
        Width = 734
        Height = 601
        Align = alClient
        AutoSize = False
        HeightPercent = 100.000000000000000000
        SelLength = 0
        SelStart = 0
        WidthPercent = 100.000000000000000000
        ExplicitLeft = 264
        ExplicitTop = 112
        ExplicitWidth = 157
        ExplicitHeight = 165
      end
    end
    object WebPageControl1Sheet3: TWebTabSheet
      Left = 0
      Top = 20
      Width = 734
      Height = 601
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
      Caption = 'Debug'
      ChildOrder = 2
      object WebMemo3: TWebMemo
        Left = 0
        Top = 0
        Width = 734
        Height = 601
        Align = alClient
        AutoSize = False
        HeightPercent = 100.000000000000000000
        SelLength = 0
        SelStart = 0
        WidthPercent = 100.000000000000000000
        ExplicitLeft = 264
        ExplicitTop = 112
        ExplicitWidth = 157
        ExplicitHeight = 165
      end
    end
    object WebPageControl1Sheet4: TWebTabSheet
      Left = 0
      Top = 20
      Width = 734
      Height = 601
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
      Caption = 'Power'
      ChildOrder = 3
      object TMSFNCWidgetGauge1: TTMSFNCWidgetGauge
        Left = 52
        Top = 120
        Width = 317
        Height = 301
        ParentDoubleBuffered = False
        DoubleBuffered = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        TabOrder = 0
        Border.Color = 6908265
        MaximumValue = 200.000000000000000000
        OuterCircle.Width = 0.030000000000000000
        InnerCircle.Color = 15130800
        OuterRim.Color = 9470064
        OuterRim.Width = 2
        Arc.Width = 0.030000000000000000
        Arc.Threshold.Center = 25.000000000000000000
        Arc.Threshold.EndValue = 100.000000000000000000
        GaugeValuesFormat = '0'
        ValueFont.Charset = DEFAULT_CHARSET
        ValueFont.Color = 5197615
        ValueFont.Height = -16
        ValueFont.Name = 'Segoe UI'
        ValueFont.Style = []
        ValueFormat = '000.0'
        Animation = False
        Sections = <>
        ExtraNeedles = <>
      end
      object TMSFNCWidgetGauge2: TTMSFNCWidgetGauge
        Left = 384
        Top = 120
        Width = 333
        Height = 301
        ParentDoubleBuffered = False
        DoubleBuffered = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        TabOrder = 1
        Border.Color = 6908265
        MaximumValue = 400.000000000000000000
        OuterCircle.Width = 0.030000000000000000
        InnerCircle.Color = 15130800
        OuterRim.Color = 9470064
        OuterRim.Width = 2
        Arc.Width = 0.030000000000000000
        Arc.Threshold.Center = 25.000000000000000000
        Arc.Threshold.EndValue = 100.000000000000000000
        GaugeValuesFormat = '0'
        ValueFont.Charset = DEFAULT_CHARSET
        ValueFont.Color = 5197615
        ValueFont.Height = -16
        ValueFont.Name = 'Segoe UI'
        ValueFont.Style = []
        ValueFormat = '000.0'
        Animation = False
        Sections = <>
        ExtraNeedles = <>
      end
    end
  end
  object WebSocketClient1: TWebSocketClient
    OnConnect = WebSocketClient1Connect
    OnDisconnect = WebSocketClient1Disconnect
    OnDataReceived = WebSocketClient1DataReceived
    Left = 92
    Top = 400
  end
end