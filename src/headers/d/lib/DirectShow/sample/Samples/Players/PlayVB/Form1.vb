'****************************************************************************
'While the underlying libraries are covered by LGPL, this sample is released 
'as public domain.  It is distributed in the hope that it will be useful, but 
'WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
'or FITNESS FOR A PARTICULAR PURPOSE.  
'*****************************************************************************/

Imports DirectShowLib
Imports System.Runtime.InteropServices

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
    Friend WithEvents Button1 As System.Windows.Forms.Button
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.Button1 = New System.Windows.Forms.Button
        Me.SuspendLayout()
        '
        'Button1
        '
        Me.Button1.Location = New System.Drawing.Point(104, 80)
        Me.Button1.Name = "Button1"
        Me.Button1.TabIndex = 0
        Me.Button1.Text = "Play"
        '
        'Form1
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(292, 262)
        Me.Controls.Add(Me.Button1)
        Me.Name = "Form1"
        Me.Text = "Form1"
        Me.ResumeLayout(False)

    End Sub

#End Region

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim hr As Integer
        Dim ev As EventCode

        Dim fg As FilterGraph
        Dim ifg2 As IFilterGraph2
        Dim imc As IMediaControl
        Dim ime As IMediaEvent

        ' Get a filtergraph object
        fg = New FilterGraph
        ifg2 = DirectCast(fg, IFilterGraph2)

        ' Get the IMediaControl interface from the fg object
        imc = DirectCast(fg, IMediaControl)

        ' Get the IMediaEvent interface from the fg object
        ime = DirectCast(fg, IMediaEvent)

        ' Build the graph
        hr = ifg2.RenderFile("c:\1.avi", Nothing)
        DsError.ThrowExceptionForHR(hr)

        ' Run the graph
        hr = imc.Run()
        DsError.ThrowExceptionForHR(hr)

        ' Wait for the entire file to finish playing
        hr = ime.WaitForCompletion(-1, ev)
        DsError.ThrowExceptionForHR(hr)

        ' Release the graph (and all its interfaces)
        Marshal.ReleaseComObject(fg)

    End Sub

End Class
