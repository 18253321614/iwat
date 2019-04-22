using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Question : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.lblTip.Visible = false;
    }

    protected void btnCheck_Click(object sender, EventArgs e)
    {
        //获取前台输入框的内容
        string passwd = this.tbPasswd.Text.Trim();
        //将从前台获取的内容用MD5进行加密
        string passwdMD5 = MD5Encrypt16(passwd);
        if (passwdMD5 == Password.passwd)
        {
            FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(
            2, //版本号
            "你的用户名", //登录的用户名
            DateTime.Now, //票劵发布时间
            DateTime.Now.AddMinutes(15), //票劵过期时间
            false, //是否在关闭浏览器后仍然保留登录信息
            "", //可加入少量用户数据（注意：不能为 null）
            FormsAuthentication.FormsCookiePath //cookie 路径
            );
            //加密票劵，获取加密后的字串
            string encrypt = FormsAuthentication.Encrypt(ticket);
            //使用加密后的字串建立一个 cookie
            HttpCookie cookie = new HttpCookie(FormsAuthentication.FormsCookieName, encrypt);
            //HttpOnly 属性为 true，表示该 cookie 不能在浏览器端进行存取
            cookie.HttpOnly = true;
            //cookie 的路径，取 Web.config 中 <forms> 属性 path 的值
            cookie.Path = FormsAuthentication.FormsCookiePath;
            //设置 cookie 的过期时间，与票劵的过期时间一致，如果这两个时间不一致，则其中任何一个时间到期时，均视为过期           
            cookie.Expires = ticket.Expiration;
            //将 cookie 增加到客户端
            Response.Cookies.Add(cookie);
            Response.Redirect(FormsAuthentication.GetRedirectUrl("小妮子", false));

            //FormsAuthentication.RedirectFromLoginPage("小妮子", false);
        }
        else
        {
            this.lblTip.Text = "*亲爱的密码输错了";
            this.lblTip.Visible = true;
        }
    }

    /// <summary>
    /// 16位MD5加密
    /// </summary>
    /// <param name="password"></param>
    /// <returns></returns>
    public static string MD5Encrypt16(string password)
    {
        var md5 = new MD5CryptoServiceProvider();
        string t2 = BitConverter.ToString(md5.ComputeHash(Encoding.Default.GetBytes(password)), 4, 8);
        t2 = t2.Replace("-", "");
        return t2.ToLower();
    }

}