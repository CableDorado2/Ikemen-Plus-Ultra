'****************************************************************************
'While the underlying libraries are covered by LGPL, this sample is released 
'as public domain.  It is distributed in the hope that it will be useful, but 
'WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
'or FITNESS FOR A PARTICULAR PURPOSE.  
'*****************************************************************************/

Public Class Form1
    Inherits System.Windows.Forms.Form

#Region " Windows Form Designer generated code "

    Public Sub New()
        MyBase.New()

        'This call is required by the Windows Form Designer.
        InitializeComponent()

        'Add any initialization after the InitializeComponent() call

    End Sub

    'Form overrides dispose to clean up the component list.
    Protected Overloads Overrides Sub Dispose(ByVal disposing As Boolean)
        If disposing Then
            If Not (components Is Nothing) Then
                components.Dispose()
            End If
        End If
        MyBase.Dispose(disposing)
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    Friend WithEvents TextBox1 As System.Windows.Forms.TextBox
    Friend WithEvents TextBox2 As System.Windows.Forms.TextBox
    Friend WithEvents TextBox3 As System.Windows.Forms.TextBox
    Friend WithEvents label1 As System.Windows.Forms.Label
    Friend WithEvents StartStop As System.Windows.Forms.Button
    Friend WithEvents Label2 As System.Windows.Forms.Label
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.TextBox1 = New System.Windows.Forms.TextBox
        Me.TextBox2 = New System.Windows.Forms.TextBox
        Me.StartStop = New System.Windows.Forms.Button
        Me.TextBox3 = New System.Windows.Forms.TextBox
        Me.label1 = New System.Windows.Forms.Label
        Me.Label2 = New System.Windows.Forms.Label
        Me.SuspendLayout()
        '
        'TextBox1
        '
        Me.TextBox1.Location = New System.Drawing.Point(16, 224)
        Me.TextBox1.Name = "TextBox1"
        Me.TextBox1.ReadOnly = True
        Me.TextBox1.TabIndex = 0
        Me.TextBox1.TabStop = False
        Me.TextBox1.Text = "Not Running"
        '
        'TextBox2
        '
        Me.TextBox2.Location = New System.Drawing.Point(24, 32)
        Me.TextBox2.Name = "TextBox2"
        Me.TextBox2.Size = New System.Drawing.Size(240, 20)
        Me.TextBox2.TabIndex = 11
        Me.TextBox2.Text = "c:\lgs.jpg"
        '
        'StartStop
        '
        Me.StartStop.Location = New System.Drawing.Point(88, 144)
        Me.StartStop.Name = "StartStop"
        Me.StartStop.Size = New System.Drawing.Size(75, 40)
        Me.StartStop.TabIndex = 1
        Me.StartStop.Text = "Start"
        '
        'TextBox3
        '
        Me.TextBox3.Location = New System.Drawing.Point(24, 88)
        Me.TextBox3.Name = "TextBox3"
        Me.TextBox3.Size = New System.Drawing.Size(232, 20)
        Me.TextBox3.TabIndex = 31
        Me.TextBox3.Text = "c:\logo.avi"
        '
        'label1
        '
        Me.label1.Location = New System.Drawing.Point(8, 8)
        Me.label1.Name = "label1"
        Me.label1.Size = New System.Drawing.Size(56, 16)
        Me.label1.TabIndex = 5
        Me.label1.Text = "Logo file"
        '
        'Label2
        '
        Me.Label2.Location = New System.Drawing.Point(8, 64)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(56, 16)
        Me.Label2.TabIndex = 32
        Me.Label2.Text = "Output file"
        '
        'Form1
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(292, 262)
        Me.Controls.AddRange(New System.Windows.Forms.Control() {Me.Label2, Me.label1, Me.TextBox3, Me.StartStop, Me.TextBox2, Me.TextBox1})
        Me.Name = "Form1"
        Me.Text = "DxLogoVB"
        Me.ResumeLayout(False)

    End Sub

#End Region

    Const VIDEODEVICE As Integer = 0 ' zero based index of video capture device to use
    Const FRAMERATE As Integer = 15  ' Depends on video device caps.  Generally 4-30.
    Const VIDEOWIDTH As Integer = 640 ' Depends on video device caps
    Const VIDEOHEIGHT As Integer = 480 ' Depends on video device caps

    Dim cam As Capture = Nothing

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles StartStop.Click
        Cursor = Cursors.WaitCursor
        If (cam Is Nothing) Then
            cam = New Capture(VIDEODEVICE, FRAMERATE, VIDEOWIDTH, VIDEOHEIGHT, TextBox3.Text)
            cam.SetLogo(TextBox2.Text)

            cam.Start()
            TextBox1.Text = "Running"
            StartStop.Text = "Stop"
        Else
            cam.Dispose()
            cam = Nothing
            TextBox1.Text = "Not Running"
            StartStop.Text = "Start"
        End If
        Cursor = Cursors.Default

    End Sub
End Class
