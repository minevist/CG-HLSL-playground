using UnityEngine;
using System.Collections;

public class ExtrudingTrail : MonoBehaviour {

    float time = 2f;
    bool autoCalcOrie = true;
    float minDistance = 0.1f;
    bool invertFaces = false;
    private Mesh srcMesh;
    private MeshExtrusion.Edge[] precomputedEdges;

    class ExtrudedTrailSect
    {
        Vector3 point;
        Matrix4x4 matrix;
        float time;
        float height;
    }
    
	// Use this for initialization
	void Start () {

        srcMesh = GetComponent<MeshFilter>().sharedMesh;
        precomputedEdges = MeshExtrusion.BuildManifoldEdges(srcMesh);
	
	}

    ArrayList sections = new ArrayList();

	void LateUpdate () {

        Vector3 position = transform.position;
        float now = Time.time;

        //if (sections.length == 0 || (sections[0].point - position))
        //{

        //}




	
	}
}
