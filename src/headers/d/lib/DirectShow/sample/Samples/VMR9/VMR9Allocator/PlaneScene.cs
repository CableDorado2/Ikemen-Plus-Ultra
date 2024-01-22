/****************************************************************************
While the underlying libraries are covered by LGPL, this sample is released 
as public domain.  It is distributed in the hope that it will be useful, but 
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
or FITNESS FOR A PARTICULAR PURPOSE.  
*****************************************************************************/

using System;
using System.Diagnostics;
using System.Runtime.InteropServices;

using Microsoft.DirectX;
using Microsoft.DirectX.Direct3D;

namespace DirectShowLib.Sample
{
	public class PlaneScene : IDisposable
	{
    private const int E_FAIL = unchecked((int) 0x80004005);

    private CustomVertex.PositionColoredTextured[] vertices;
    private VertexBuffer vertexBuffer = null;

    private int time = 0;

    public PlaneScene()
    {
      vertices = new CustomVertex.PositionColoredTextured[4];

      vertices[0].Position = new Vector3(-1.0f,  1.0f, 0.0f); // top left
      vertices[1].Position = new Vector3(-1.0f, -1.0f, 0.0f); // bottom left
      vertices[2].Position = new Vector3( 1.0f,  1.0f, 0.0f); // top right
      vertices[3].Position = new Vector3( 1.0f, -1.0f, 0.0f); // bottom right

      vertices[0].Color = unchecked((int)0xffffffff); // low left
      vertices[1].Color = unchecked((int)0xff0000ff); // high left
      vertices[2].Color = unchecked((int)0xffffffff); // low right
      vertices[3].Color = unchecked((int)0xff0000ff); // high right

      vertices[0].Tu = 0.0f; vertices[0].Tv = 0.0f; // low left
      vertices[1].Tu = 0.0f; vertices[1].Tv = 1.0f; // high left
      vertices[2].Tu = 1.0f; vertices[2].Tv = 0.0f; // low right
      vertices[3].Tu = 1.0f; vertices[3].Tv = 1.0f; // high right
    }

    ~PlaneScene()
    {
      Dispose();
    }

    #region Membres de IDisposable

    public void Dispose()
    {
      if (vertexBuffer != null)
      {
        vertexBuffer.Dispose();
        vertexBuffer = null;
      }
    }

    #endregion

    [DllImport("kernel32.dll")]
    private static extern int GetTickCount();

    public int Init(Device d3dDev)
    {
      try
      {
        d3dDev.RenderState.CullMode = Cull.None;
        d3dDev.RenderState.Lighting = false;

        d3dDev.RenderState.AlphaBlendEnable = true;
        d3dDev.RenderState.SourceBlend = Blend.SourceAlpha;
        d3dDev.RenderState.DestinationBlend = Blend.InvSourceAlpha;
        d3dDev.RenderState.AlphaTestEnable = true;
        d3dDev.RenderState.ReferenceAlpha = 0x10;
        d3dDev.RenderState.AlphaFunction = Compare.Greater;

        d3dDev.SamplerState[0].AddressU = TextureAddress.Clamp;
        d3dDev.SamplerState[0].AddressV = TextureAddress.Clamp;
        d3dDev.SamplerState[0].MagFilter = TextureFilter.Linear;
        d3dDev.SamplerState[0].MinFilter = TextureFilter.Linear;
        d3dDev.SamplerState[0].MipFilter = TextureFilter.Linear;

        vertexBuffer = new VertexBuffer(
          typeof(CustomVertex.PositionColoredTextured),
          4, 
          d3dDev,
          Usage.WriteOnly,
          CustomVertex.PositionColoredTextured.Format,
          Pool.Managed
          );

        Surface backBuffer = d3dDev.GetBackBuffer(0, 0, BackBufferType.Mono);
        SurfaceDescription backBufferDesc = backBuffer.Description;

        float aspect = (float)backBufferDesc.Width / (float)backBufferDesc.Height;
        Matrix matProj = Matrix.PerspectiveFovLH((float)Math.PI / 4, aspect, 1.0f, 100.0f);
        d3dDev.SetTransform(TransformType.Projection, matProj);

        Vector3 from = new Vector3(1.0f, 1.0f, -3.0f);
        Vector3 at = new Vector3(0.0f, 0.0f, 0.0f);
        Vector3 up = new Vector3(0.0f, 1.0f, 0.0f);
        Matrix matView = Matrix.LookAtLH(from, at, up);
        d3dDev.SetTransform(TransformType.View, matView);

        time = GetTickCount();

        backBuffer.Dispose();
      }
      catch(DirectXException e)
      {
        return e.ErrorCode;
      }
      catch
      {
        return E_FAIL;
      }

      return 0;
    }

    public int DrawScene(Device d3dDev, Texture texture)
    {
      if (vertexBuffer == null)
        return E_FAIL;

      // get the difference in time
      int currentTime = GetTickCount();
      double difference = time - currentTime ;

      // figure out the rotation of the plane
      float x = (float) (-Math.Cos(difference / 2000.0));
      float y = (float) (Math.Cos(difference / 2000.0));
      float z = (float) (Math.Sin(difference / 2000.0));

      // update the two rotating vertices with the new position
      vertices[0].Position = new Vector3(x, y, z);
      vertices[3].Position = new Vector3(-x, -y, -z);

      // Adjust the color so the blue is always on the bottom.
      // As the corner approaches the bottom, get rid of all the other
      // colors besides blue
      int mask0 = (int) (255 * (( y + 1.0) / 2.0));
      int mask3 = (int) (255 * (( -y + 1.0 ) / 2.0));
      vertices[0].Color = unchecked((int) 0xff0000ff | (mask0 << 16) | (mask0 << 8));
      vertices[3].Color = unchecked((int) 0xff0000ff | (mask3 << 16) | (mask3 << 8));

      try
      {
        // write the new vertex information into the buffer
        vertexBuffer.SetData(vertices, 0, LockFlags.None);

        // clear the scene so we don't have any articats left
        d3dDev.Clear(ClearFlags.Target, 0x00ffffff, 1.0f, 0);

        d3dDev.BeginScene();
        d3dDev.SetTexture(0, texture);

        d3dDev.SetTextureStageState(0, TextureStageStates.AlphaOperation, (int)TextureOperation.Modulate);
        d3dDev.SetTextureStageState(0, TextureStageStates.AlphaArgument1, (int)TextureArgument.TextureColor);
        d3dDev.SetTextureStageState(0, TextureStageStates.AlphaArgument2, (int)TextureArgument.Diffuse);
        d3dDev.SetTextureStageState(0, TextureStageStates.ColorArgument1, (int)TextureArgument.TextureColor);

        d3dDev.SetStreamSource(0, vertexBuffer, 0);
        d3dDev.VertexFormat = CustomVertex.PositionColoredTextured.Format;
        d3dDev.DrawPrimitives(PrimitiveType.TriangleStrip, 0, 2);
        d3dDev.SetTexture(0, null);
        d3dDev.EndScene();
      }
      catch(DirectXException e)
      {
        return e.ErrorCode;
      }
      catch
      {
        return E_FAIL;
      }

      return 0;
    }

    public void SetSrcRect(float fTU, float fTV)
    {
      vertices[0].Tu = 0.0f; vertices[0].Tv = 0.0f; // low left
      vertices[1].Tu = 0.0f; vertices[1].Tv = fTV;  // high left
      vertices[2].Tu = fTU;  vertices[2].Tv = 0.0f; // low right
      vertices[3].Tu = fTU;  vertices[3].Tv = fTV;  // high right
    }
  }
}
