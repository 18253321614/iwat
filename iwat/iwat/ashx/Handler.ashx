<%@ WebHandler Language="C#" Class="Handler" %>

using System;
using System.Web;
using System.Text;

public class Handler : IHttpHandler {

    public void ProcessRequest (HttpContext context)
    {
            //获取前台传过来的值
        string weight = context.Request["data"].ToString();
            //转化为double类型
        double weightD = System.Convert.ToDouble(weight);
            //获取当前月份、天、时
        int month = DateTime.Now.Month;
        int day = DateTime.Now.Day;
        int hour = DateTime.Now.Hour;
        if (weight!="" && weightD!=0)
        {
            StringBuilder sb = new StringBuilder();
            if (hour < 10)
            {
                sb.Append(month);
                sb.Append(".");
                sb.Append(day);
                sb.Append("早");
            }
            else if (hour >= 10 && hour < 14)
            {
                sb.Append(month);
                sb.Append(".");
                sb.Append(day);
                sb.Append("中午");
            }
            else if (hour >= 14 && hour < 19)
            {
                sb.Append(month);
                sb.Append(".");
                sb.Append(day);
                sb.Append("下午");
            }
            else if (hour>=19)
            {
                sb.Append(month);
                sb.Append(".");
                sb.Append(day);
                sb.Append("晚");
            }
            string date = sb.ToString();
                //创建model对象
            ChartData chartData = new ChartData();
            chartData.weight = weightD;
            chartData.time = date;
                //创建上下文对象
            CDContext dbContext = new CDContext();
            dbContext.chartDatas.Add(chartData);
            dbContext.SaveChanges();
            context.Response.Write("success");
        }
        else
        {
            context.Response.Write("false");
        }

    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}