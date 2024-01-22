'****************************************************************************
'While the underlying libraries are covered by LGPL, this sample is released 
'as public domain.  It is distributed in the hope that it will be useful, but 
'WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
'or FITNESS FOR A PARTICULAR PURPOSE.  
'*****************************************************************************/

Imports DESCombineLib
Imports DirectShowLib

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
    Friend WithEvents Label1 As System.Windows.Forms.Label
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.Button1 = New System.Windows.Forms.Button
        Me.Label1 = New System.Windows.Forms.Label
        Me.SuspendLayout()
        '
        'Button1
        '
        Me.Button1.Location = New System.Drawing.Point(104, 128)
        Me.Button1.Name = "Button1"
        Me.Button1.Size = New System.Drawing.Size(75, 32)
        Me.Button1.TabIndex = 0
        Me.Button1.Text = "Start"
        '
        'Label1
        '
        Me.Label1.Location = New System.Drawing.Point(16, 16)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(256, 96)
        Me.Label1.TabIndex = 1
        Me.Label1.Text = "Input: c:\1.avi" & Chr(10) & "Output: c:\test.avi" & Chr(10) & "Assumes c:\1.avi is a video-only file" & Chr(10) & "Compresses output using: Microsoft Video 1"
        '
        'Form1
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(292, 262)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.Button1)
        Me.Name = "Form1"
        Me.Text = "Form1"
        Me.ResumeLayout(False)

    End Sub

#End Region

    Private ds As DESCombine

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click

        Try
            If ds Is Nothing Then
                Dim ibfVideoCompressor As DirectShowLib.IBaseFilter

                ' Get the video compressor
                ibfVideoCompressor = GetVideoCompressor("Microsoft Video 1")

                ' FPS, BPP, Width, Height
                ds = New DESCombine(25, 16, 354, 288)
                AddHandler ds.Completed, AddressOf Me.Done

                ' Add a file which only contains video (use AddAVFile if the file contains
                ' both audio and video, and you want to *use* both the audio and video
                ' from the file).
                ds.AddVideoFile("c:\1.avi", 0, -1)

                ' Create the output graph using the specified:
                '    Output file
                '    Video compressor
                '    Audio compressor
                '    Video callback routine
                '    Audio callback routine
                ds.RenderToAVI("c:\test.avi", ibfVideoCompressor, Nothing, Nothing, Nothing)

                ' Run the graph
                ds.StartRendering()
                Button1.Text = "Cancel"
            Else
                ds.Cancel()
            End If

        Catch ex As Exception
            MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
            ds.Dispose()
            ds = Nothing
        End Try

    End Sub

    ' Walk the list of video compressors looking for one by name
    Private Function GetVideoCompressor(ByVal sName As String) As DirectShowLib.IBaseFilter

        Dim dsd() As DsDevice = DsDevice.GetDevicesOfCat(FilterCategory.VideoCompressorCategory)
        GetVideoCompressor = Nothing

        For Each dev As DsDevice In dsd
            If (dev.Name = sName) Then

                ' Found it
                Dim o As Object = Nothing
                Dim grf As Guid = GetType(DirectShowLib.IBaseFilter).GUID

                dev.Mon.BindToObject(Nothing, Nothing, grf, o)
                GetVideoCompressor = DirectCast(o, DirectShowLib.IBaseFilter)

                Exit For
            End If
        Next

    End Function

    Private Sub Done(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim e1 As DESCombineLib.CompletedArgs = e

        ' Close down the graph
        ds.Dispose()
        ds = Nothing

        ' This isn't the right way to do this, but hey, it's just a sample.
        CheckForIllegalCrossThreadCalls = False

        ' Reset the button text
        Button1.Text = "Start"

        CheckForIllegalCrossThreadCalls = True

        ' Show the results
        MessageBox.Show(e1.Result.ToString(), "Results")

    End Sub

End Class
