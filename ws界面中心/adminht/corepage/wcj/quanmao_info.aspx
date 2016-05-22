﻿<%@ Page Title="" Language="C#" MasterPageFile="~/adminht/MasterPageMain.master" AutoEventWireup="true" CodeFile="quanmao_info.aspx.cs" Inherits="quanmao_info" %>




<asp:Content ID="Content4" ContentPlaceHolderID="sp_head" runat="Server">
    <!-- 往模板页附加的head内容 -->
 
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="sp_daohang" runat="Server">
    <!-- 附加的本页导航栏内容 -->

</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="sp_pagecontent" runat="Server">
    <!-- 附加的右侧主要功能切换区内容,不含导航 -->
 
     
    

    <div class="row">
        <div class="col-xs-0 col-sm-1 hidden-xs"></div>
        <div class="col-xs-12 col-sm-10">

            
             <form runat="server" id="form1" visible="true">

                    <div class="widget-box" id="quyu_zhao" runat="server">
											<div class="widget-header widget-header-small">
												<h5 class="widget-title lighter">搜索客户</h5>
											</div>

											<div class="widget-body">
												<div class="widget-main">
													<div class="form-search">
														<div class="row">
															<div class="col-xs-12 col-sm-6">
																<div class="input-group">
																	<span class="input-group-addon">
																		<i class="ace-icon fa fa-edit"></i>
																	</span>

																	 
                                                                    <asp:TextBox ID="idorname" runat="server" data-rel="tooltip" placeholder="输入客户名称或编号" title="模糊搜索" CssClass="form-control search-query"></asp:TextBox> 
																	<span class="input-group-btn">

                                                                       <span class="ace-icon fa fa-search icon-on-right bigger-110"></span> <asp:Button ID="kaishizhao" runat="server" CssClass="btn btn-purple btn-sm"  Text="搜索" OnClick="kaishizhao_Click"  />
																		
																	</span>
																</div>
															</div>
                                                            <div class="col-xs-12 col-sm-12">

<div id="errmsg" class="red" runat="server">搜索结果：</div>
                                                                 
                                                    <asp:ListBox ID="ssjg" runat="server" Rows="1" SelectionMode="Single" class="col-xs-12 col-sm-12" AutoPostBack="True" OnSelectedIndexChanged="ssjg_SelectedIndexChanged"  >
                                                        <asp:ListItem Selected="True">选择搜索到的客户</asp:ListItem>
                                                </asp:ListBox>
                                                            </div>
														</div>
													</div>

                                                    
												</div>
											</div>
										</div>


            </form>



       

             <div class="widget-box">
            <div class="widget-header widget-header-flat">
                <h4 class="widget-title smaller">客户全貌(........)</h4>

                <div class="widget-toolbar">
                </div>
            </div>

            <div class="widget-body">
                <div class="widget-main" style="word-wrap: break-word; word-break: normal;">

                    <dl>
                        <dt>客户名称/编号：</dt>
                        <dd>........</dd>
                    

                        <dt>省市区：</dt>
                        <dd>........</dd>
                        <dt>地址：</dt>
                        <dd>........</dd>
                        <dt>电话传真：</dt>
                        <dd>........ / ........</dd>
                        <dt>开票信息：</dt>
                        <dd>........</dd>
                        <dt>创建日期：</dt>
                        <dd>........</dd>
                        <dt>所属部门/负责人：</dt>
                        <dd>........</dd>
                        <dt>所有联系人：</dt>
                        <dd>........,........,........</dd>
                    </dl>






                </div>
            </div>
        </div>






        <div class="widget-box">
            <div class="widget-header widget-header-flat">
                <h4 class="widget-title smaller">最近情报</h4>

                <div class="widget-toolbar">
                </div>
            </div>

            <div class="widget-body">
                <div class="widget-main" style="word-wrap: break-word; word-break: normal;">

                    <dl>
                       <dt>情报日期/创建人：</dt>
                        <dd>........ / ........</dd>
                        
                        <dt>情报来源：</dt>
                        <dd>........</dd>
                        <dt>情报设备/品牌：</dt>
                        <dd>........</dd>

                        <dt>情报描述：</dt>
                        <dd>........</dd>
                        <dt>年采血量：</dt>
                        <dd>........</dd>
                        <dt>采购负责人：</dt>
                        <dd>........ / ........</dd>
                        <dt>备用资料1/2/3：</dt>
                        <dd>........</dd>
                    </dl>
                    <hr />

                    <dl>
                        <dt>情报日期/创建人：</dt>
                        <dd>........ / ........</dd>
                        
                        <dt>情报来源：</dt>
                        <dd>........</dd>
                        <dt>情报设备/品牌：</dt>
                        <dd>........</dd>

                        <dt>情报描述：</dt>
                        <dd>........</dd>
                        <dt>年采血量：</dt>
                        <dd>........</dd>
                        <dt>采购负责人：</dt>
                        <dd>........ / ........</dd>
                        <dt>备用资料1/2/3：</dt>
                        <dd>........</dd>
                   
                        
                    </dl>



                </div>
            </div>
        </div>

 
        </div>
        <div class="col-xs-0 col-sm-1 hidden-xs"></div>

       












    </div>
    <!-- /.row -->


</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="sp_script" runat="Server">
    <!-- 附加的body底部本页专属的自定义js脚本 -->
 
</asp:Content>




 

