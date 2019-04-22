<%@ WebHandler Language="C#" Class="InitEchart" %>

using System;
using System.Web;
using Newtonsoft.Json;
public class InitEchart : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        CDContext db = new CDContext();
        var info=db.chartDatas;
        string jsonData = JsonConvert.SerializeObject(info);
        context.Response.Write(jsonData);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}