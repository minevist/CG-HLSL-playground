using UnityEngine;
using System.Collections;

public class Proc_Cube : MonoBehaviour
{
    public int[] newTriangles;
    public Material material;
    public float width = 1;
    public float depth = 1;
    public float height = 1;

    void Update()
    {
        Vector3[] newVertices = new Vector3[8];
        newVertices[0] = new Vector3(0, 0, 0);
        newVertices[1] = new Vector3(0, 0, depth);
        newVertices[2] = new Vector3(width, 0, depth);
        newVertices[3] = new Vector3(width, 0, 0);
        newVertices[4] = new Vector3(0, height, 0);
        newVertices[5] = new Vector3(0, height, depth);
        newVertices[6] = new Vector3(width, height, depth);
        newVertices[7] = new Vector3(width, height, 0);

        Mesh mesh = new Mesh();
        GetComponent<MeshFilter>().mesh = mesh;
        mesh.vertices = newVertices;

        mesh.triangles = newTriangles;

        GetComponent<Renderer>().material = material;
    }
}