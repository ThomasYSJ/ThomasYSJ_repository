Attribute VB_Name = "ģ��1"
Option Explicit

Sub ����һ������()
Dim t&, d As Object, arr, x&, j As Byte, i&, brr(1 To 281759, 1 To 101), k&
t = Timer: Set d = CreateObject("scripting.Dictionary"): arr = Sheets("����").[a2 :c281760]
For x = 1 To UBound(arr, 1)
	j = arr(x, 2) - 42402
	If d.Exists(arr(x, 1)) Then
		i = d(arr(x, 1)): brr(i, j) = brr(i, j) + arr(x, 3)
	Else
		k = k + 1: d(arr(x, 1)) = k: brr(k, 1) = arr(x, 1): brr(k, j) = arr(x, 3)
	End If
Next x
Sheets("����").[a:a].NumberFormatLocal = "@"
Sheets("����").Cells(2, 1).Resize(k, 101) = brr
MsgBox "����ʱ����" & Format(Timer - t, "0.0000s")
End Sub

Sub һ������()
    Dim t&, d As Object, arr, x&, j As Byte, i&, brr(1 To 100000, 1 To 101), k&, m&, n&
    Set d = CreateObject("scripting.Dictionary")
    For m = 0 To 6
        arr = Sheets("����").Range("a" & 2 + 100000 * m & ":c" & 2 - 1 + 100000 * (m + 1))
        For x = 1 To UBound(arr, 1)
            j = arr(x, 2) - 42368
            If d.Exists(arr(x, 1)) Then
                i = d(arr(x, 1)): brr(i, j) = brr(i, j) + arr(x, 3)
            Else
                k = k + 1: d(arr(x, 1)) = k: brr(k, 1) = arr(x, 1): brr(k, j) = arr(x, 3)
            End If
        Next x
        n = Sheets("����").Cells(Rows.Count, 1).End(xlUp).Row
        Sheets("����").Cells(n + 1, 1).Resize(k, 101) = brr: k = 0: d.RemoveAll
    Next m
    MsgBox "����ʱ����" & Format(Timer - t, "0.0000s")
End Sub

Sub ��������()
    Dim t&, d As Object, k As Byte, arr, h As Byte, j%, brr, i&, n&
    t = Timer: Set d = CreateObject("scripting.Dictionary")
    For k = 0 To 5
        arr = Sheets("����").Range("a" & 2 + 100000 * k & ":a" & 1 + 100000 * (k + 1))
        For h = 0 To 3
            For j = 2 + 100 * h To 1 + 100 * (h + 1)
                brr = Sheets("����").Range("a" & 2 + 100000 * k & ":a" & 1 + 100000 * (k + 1)).Offset(0, j - 1)
                For i = 1 To 100000
                    d(arr(i, 1)) = d(arr(i, 1)) + brr(i, 1)
                Next i
                Sheets("����").Cells(2 + n, j).Resize(d.Count, 1) = Application.Transpose(d.Items): d.RemoveAll
            Next j
        Next h
        n = Sheets("����").[b1000000].End(xlUp).Row - 1
    Next k
    MsgBox "����ʱ����" & Format(Timer - t, "0.0000s")
End Sub
