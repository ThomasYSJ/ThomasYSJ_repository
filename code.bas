Attribute VB_Name = "模块1"
Option Explicit

Sub 试验一级汇总()
Dim t&, d As Object, arr, x&, j As Byte, i&, brr(1 To 281759, 1 To 101), k&
t = Timer: Set d = CreateObject("scripting.Dictionary"): arr = Sheets("数据").[a2 :c281760]
For x = 1 To UBound(arr, 1)
	j = arr(x, 2) - 42402
	If d.Exists(arr(x, 1)) Then
		i = d(arr(x, 1)): brr(i, j) = brr(i, j) + arr(x, 3)
	Else
		k = k + 1: d(arr(x, 1)) = k: brr(k, 1) = arr(x, 1): brr(k, j) = arr(x, 3)
	End If
Next x
Sheets("汇总").[a:a].NumberFormatLocal = "@"
Sheets("汇总").Cells(2, 1).Resize(k, 101) = brr
MsgBox "运行时长：" & Format(Timer - t, "0.0000s")
End Sub

Sub 一级汇总()
    Dim t&, d As Object, arr, x&, j As Byte, i&, brr(1 To 100000, 1 To 101), k&, m&, n&
    Set d = CreateObject("scripting.Dictionary")
    For m = 0 To 6
        arr = Sheets("数据").Range("a" & 2 + 100000 * m & ":c" & 2 - 1 + 100000 * (m + 1))
        For x = 1 To UBound(arr, 1)
            j = arr(x, 2) - 42368
            If d.Exists(arr(x, 1)) Then
                i = d(arr(x, 1)): brr(i, j) = brr(i, j) + arr(x, 3)
            Else
                k = k + 1: d(arr(x, 1)) = k: brr(k, 1) = arr(x, 1): brr(k, j) = arr(x, 3)
            End If
        Next x
        n = Sheets("汇总").Cells(Rows.Count, 1).End(xlUp).Row
        Sheets("汇总").Cells(n + 1, 1).Resize(k, 101) = brr: k = 0: d.RemoveAll
    Next m
    MsgBox "运行时长：" & Format(Timer - t, "0.0000s")
End Sub

Sub 二级汇总()
    Dim t&, d As Object, k As Byte, arr, h As Byte, j%, brr, i&, n&
    t = Timer: Set d = CreateObject("scripting.Dictionary")
    For k = 0 To 5
        arr = Sheets("数据").Range("a" & 2 + 100000 * k & ":a" & 1 + 100000 * (k + 1))
        For h = 0 To 3
            For j = 2 + 100 * h To 1 + 100 * (h + 1)
                brr = Sheets("数据").Range("a" & 2 + 100000 * k & ":a" & 1 + 100000 * (k + 1)).Offset(0, j - 1)
                For i = 1 To 100000
                    d(arr(i, 1)) = d(arr(i, 1)) + brr(i, 1)
                Next i
                Sheets("汇总").Cells(2 + n, j).Resize(d.Count, 1) = Application.Transpose(d.Items): d.RemoveAll
            Next j
        Next h
        n = Sheets("汇总").[b1000000].End(xlUp).Row - 1
    Next k
    MsgBox "运行时长：" & Format(Timer - t, "0.0000s")
End Sub
