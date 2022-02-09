VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   7710
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   9705
   LinkTopic       =   "Form1"
   ScaleHeight     =   7710
   ScaleWidth      =   9705
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdlimpiar 
      Caption         =   "limpiar"
      Height          =   255
      Left            =   8040
      TabIndex        =   10
      Top             =   7320
      Width           =   1095
   End
   Begin VB.CommandButton cmdquitar 
      Caption         =   "quitar"
      Height          =   255
      Left            =   8040
      TabIndex        =   9
      Top             =   6840
      Width           =   1095
   End
   Begin VB.ListBox lsttiempo 
      Height          =   2010
      Left            =   7560
      TabIndex        =   8
      Top             =   4560
      Width           =   1935
   End
   Begin VB.CommandButton cmdfin 
      Caption         =   "detener"
      Height          =   495
      Left            =   2760
      TabIndex        =   7
      Top             =   6960
      Width           =   1935
   End
   Begin VB.CommandButton cmdpausa 
      Caption         =   "pausar"
      Default         =   -1  'True
      Height          =   495
      Left            =   2760
      TabIndex        =   6
      Top             =   5400
      Width           =   1935
   End
   Begin VB.CommandButton cmdgrabar 
      Caption         =   "grabar"
      Height          =   495
      Left            =   2760
      TabIndex        =   5
      Top             =   6120
      Width           =   1935
   End
   Begin VB.CommandButton cmdempezar 
      Caption         =   "empezar"
      Height          =   615
      Left            =   2760
      TabIndex        =   4
      Top             =   4560
      Width           =   1935
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   600
      Top             =   4560
   End
   Begin VB.Label lbl3 
      Caption         =   "00"
      BeginProperty Font 
         Name            =   "MS Reference Sans Serif"
         Size            =   72
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3255
      Left            =   720
      TabIndex        =   2
      Top             =   960
      Width           =   2175
   End
   Begin VB.Label lbl2 
      Caption         =   "00"
      BeginProperty Font 
         Name            =   "MS Reference Sans Serif"
         Size            =   72
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3255
      Left            =   3360
      TabIndex        =   1
      Top             =   960
      Width           =   2175
   End
   Begin VB.Label lbl1 
      Caption         =   "00"
      BeginProperty Font 
         Name            =   "MS Reference Sans Serif"
         Size            =   72
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3375
      Left            =   6000
      TabIndex        =   0
      Top             =   960
      Width           =   2535
   End
   Begin VB.Label Label1 
      Caption         =   ":    :"
      BeginProperty Font 
         Name            =   "MS Reference Sans Serif"
         Size            =   72
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2055
      Left            =   2760
      TabIndex        =   3
      Top             =   840
      Width           =   3735
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdempezar_Click()
Timer1.Enabled = True
cmdempezar.Caption = "continuar"
cmdempezar.Enabled = False
End Sub

Private Sub cmdfin_Click()
Timer1.Enabled = False
cmdempezar.Enabled = True
cmdempezar.Caption = "empezar"
lbl1 = "00"
lbl2 = "00"
lbl3 = "00"
End Sub

Private Sub cmdgrabar_Click()
lsttiempo.AddItem (lbl3.Caption & ":" & lbl2.Caption & ":" & lbl1.Caption)
End Sub

Private Sub cmdlimpiar_Click()
lsttiempo.Clear
End Sub

Private Sub cmdpausa_Click()
Timer1.Enabled = False
cmdempezar.Enabled = True
End Sub

Private Sub cmdquitar_Click()
If lsttiempo.ListIndex <> -1 Then
lsttiempo.RemoveItem lsttiempo.ListIndex
End If
End Sub

Private Sub Timer1_Timer()
lbl1.Caption = Val(lbl1.Caption) + 1
If lbl1.Caption = "100" Then
lbl1.Caption = "00"
lbl2.Caption = "0" & Val(lbl2.Caption) + 1
  If lbl2.Caption > 9 Then
  lbl2.Caption = Val(lbl2.Caption)
  End If
End If
If lbl2.Caption = "60" Then
lbl2.Caption = "00"
lbl3.Caption = "0" & Val(lbl3.Caption) + 1
  If lbl3.Caption > 9 Then
  lbl3.Caption = Val(lbl3.Caption)
  End If
End If
End Sub
