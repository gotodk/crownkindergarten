﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminht_corepage_WUC_fordemohome_js_hg : System.Web.UI.UserControl
{
    public bool qx_zysj = false; //仪表盘是否显示重要数据
    protected void Page_Load(object sender, EventArgs e)
    {
        qx_zysj = true;
    }
}