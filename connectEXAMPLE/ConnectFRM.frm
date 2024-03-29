VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form ConnectFRM 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Connect as..."
   ClientHeight    =   2340
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   2400
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2340
   ScaleWidth      =   2400
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox nicknameTXT 
      Height          =   285
      Left            =   120
      MaxLength       =   20
      TabIndex        =   6
      Text            =   "NickName here"
      Top             =   1200
      Width           =   2175
   End
   Begin MSWinsockLib.Winsock Winsock 
      Left            =   1920
      Top             =   1680
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin VB.CommandButton ConnectCMD 
      Caption         =   "&Connect"
      Default         =   -1  'True
      Height          =   375
      Left            =   720
      TabIndex        =   4
      Top             =   1920
      Width           =   975
   End
   Begin VB.TextBox IPtxt 
      Height          =   285
      Left            =   120
      TabIndex        =   3
      Top             =   840
      Width           =   2175
   End
   Begin VB.Frame Frame1 
      Height          =   735
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   2415
      Begin VB.CommandButton ClientCMD 
         Caption         =   "C&lient"
         Height          =   375
         Left            =   1320
         TabIndex        =   2
         Top             =   240
         Width           =   975
      End
      Begin VB.CommandButton ServerCMD 
         Caption         =   "&Server"
         Height          =   375
         Left            =   120
         TabIndex        =   1
         Top             =   240
         Width           =   975
      End
   End
   Begin VB.Label Label1 
      Caption         =   "© 2000 One"
      BeginProperty Font 
         Name            =   "MS Serif"
         Size            =   6
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   135
      Left            =   0
      TabIndex        =   7
      Top             =   2160
      Width           =   855
   End
   Begin VB.Label YouripLBL 
      Alignment       =   2  'Center
      Height          =   255
      Left            =   120
      TabIndex        =   5
      Top             =   1560
      Width           =   2175
   End
End
Attribute VB_Name = "ConnectFRM"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
'                   One Computer Software                    '
'                       DeI3oe@aol.com                       '
'                    EASY Winsock Example                    '
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'

Private Sub ClientCMD_Click()
IPtxt.Text = "Server's IP here" 'tells u to put the servers ip in the txtbox
Me.Caption = "Connect as Client" 'recaptions form to fit user
IPtxt.Enabled = True 'needed button to connect
nicknameTXT.Enabled = True 'needed button to connect
ServerCMD.Enabled = False 'unneeded button to connect to client
ClientCMD.Enabled = False 'unneeded button to connect to client
ConnectCMD.Enabled = True 'needed button to connect

End Sub

Private Sub ConnectCMD_Click()
If nicknameTXT.Text = "" Then Exit Sub 'wont connect till a name has been entered!

If Me.Caption = "Connect as Server" Then 'connects u to the client
    ServerFRM.Winsock.Close 'closes any previous connections
    ServerFRM.Winsock.LocalPort = CLng(187) '187 is the port
    ServerFRM.Winsock.Listen 'listens to see if client wants to connect
    ServerFRM.nickSERVER.Caption = nicknameTXT.Text 'put the username for the server in a lbl on serverfrm
End If

If Me.Caption = "Connect as Client" Then 'connects u to the server
    If IPtxt.Text = "Server's IP here" Then Exit Sub 'just incase u forgot to put IP in
    If IPtxt.Text = "" Then Exit Sub 'just incase u forgot to put IP in
        ClientFRM.Winsock.Close 'closes any previous connections
        ClientFRM.Winsock.Connect IPtxt.Text, "187" 'sends ur IP to connect to server:187 is the port
        ClientFRM.nickCLIENT.Caption = nicknameTXT.Text 'puts username for client in a lbl on clientfrm
End If

End Sub

Private Sub Form_Load()
ConnectCMD.Enabled = False 'wont allow u to connect until u select necessary options
YouripLBL.Caption = "Your IP:  " & Winsock.LocalIP 'shows u your IP address
IPtxt.Enabled = False 'disabled till select server or client
nicknameTXT.Enabled = False 'disabled till select server or client

End Sub

Private Sub ServerCMD_Click()
Me.Caption = "Connect as Server" 'recaptions form to fit user

IPtxt.Enabled = True 'needed button to connect
nicknameTXT.Enabled = True 'needed button to connect
ServerCMD.Enabled = False 'unneeded button to connect to server
ClientCMD.Enabled = False 'unneeded button to connect to server
IPtxt.Enabled = False 'unneeded txtbox to server
ConnectCMD.Enabled = True 'needed button to connnect

End Sub
