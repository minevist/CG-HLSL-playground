using UnityEngine;
using System.Collections;

public class Proc_Mesh : MonoBehaviour
{
    public Vector3[] newVertices;
    public Vector2[] newUV;
    public int[] newTriangles;
    public Material material;
    public Vector3 direction;

    void Update()
    {
        Mesh mesh = new Mesh();
        GetComponent<MeshFilter>().mesh = mesh;
        mesh.vertices = newVertices;

        mesh.uv = newUV;
        mesh.triangles = newTriangles;
       
        GetComponent<Renderer>().material = material;
    }    
}