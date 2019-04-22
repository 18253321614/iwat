using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;

/// <summary>
/// DBContext 的摘要说明
/// </summary>
public class CDContext:DbContext
{
    public CDContext():base("connectionString")
    {}

    public DbSet<ChartData> chartDatas { get; set; }
}