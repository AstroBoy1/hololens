using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.IO;


public class imageEdit : MonoBehaviour {

    //private Image image;
    public Texture2D texture;
    private Texture2D newTexture;

    public Texture2D[] textures;

	// Use this for initialization
	void Start () {
        for (int i = 0; i < textures.Length; i++)
        {
            texture = textures[i];
            newTexture = texture;
            for (int y = 0; y < texture.height; y++)
            {
                for (int x = 0; x < texture.width; x++)
                {
                    if (texture.GetPixel(x, y).r == 1 && texture.GetPixel(x, y).g == 1 && texture.GetPixel(x, y).b == 1)
                    {
                        newTexture.SetPixel(x, y, new Color(0, 0, 0, 0));
                    }
                }
            }
            newTexture.Apply();
            byte[] bytes = newTexture.EncodeToPNG();
            string name = "/../newImage" + i + ".png";
            //File.WriteAllBytes(Application.dataPath + "/../newImage.png", bytes);
            File.WriteAllBytes(Application.dataPath + name, bytes);
        }
    }
}
