﻿<%@ Page Title="" Language="C#" MasterPageFile="~/adminht/MasterPageMain.master" AutoEventWireup="true" CodeFile="edit_khda.aspx.cs" Inherits="wcj_edit_khda" %>

<%@ Register Src="~/pucu/wuc_css.ascx" TagPrefix="uc1" TagName="wuc_css" %>
<%@ Register Src="~/pucu/wuc_content.ascx" TagPrefix="uc1" TagName="wuc_content" %>
<%@ Register Src="~/pucu/wuc_script.ascx" TagPrefix="uc1" TagName="wuc_script" %>




<asp:Content ID="Content1" ContentPlaceHolderID="sp_head" runat="Server">
    <!-- 往模板页附加的head内容 -->
    <uc1:wuc_css runat="server" ID="wuc_css" />

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="sp_daohang" runat="Server">
    <!-- 附加的本页导航栏内容 -->

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="sp_pagecontent" runat="Server">
    <!-- 附加的右侧主要功能切换区内容,不含导航 -->
    <uc1:wuc_content runat="server" ID="wuc_content"  />
 
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="sp_script" runat="Server">

       <!-- 附加的body底部本页专属的自定义js脚本 -->
    <uc1:wuc_script runat="server" ID="wuc_script" />
         <!-- 某些字段，在编辑时禁用，不想用新页面的情况使用 -->
    <script type="text/javascript">
             jQuery(function ($) {
                 if (getUrlParam("fff") == "1") {

                     
                 }
                 else
                 {
                     $("label[for='lxr_list']").closest(".form-group").hide();
                 }

                 window.setInterval(function () {
                 //弹窗特殊条件，隐藏的弹窗的条件
                 var YYname_str = $("#YYname").val();
                 $("#searchopenyhbspgogo_YYname").attr("teshuwhere", "   YYname like '%" + YYname_str + "%'");
                 $("#searchopenyhbspgogo_YYname").html("检索");

                 }, 500);

                 var dfx_str = "#show_searchopenyhbspgogo_YYssbumen";
                 var oldzhi = $(dfx_str).text();
                 var jiancha_UAid = window.setInterval(function () {

                     if ($(dfx_str).text() != oldzhi) {
                         var re = /\[.*?\]/ig;
                         var arr = $(dfx_str).text().match(re);

                         if (arr != null) {//如果能匹配成功即arr数组不为空，循环输出结果
                             for (var i = 0; i < arr.length; i++) {
                                 var arr_z = arr[i].split(':');
                                 if (arr_z[0] == "[名称")
                                 { $("#YYssbumen_name").val($.trim(arr_z[1]).replace("]", "")); }

                             }
                         }

                         oldzhi = $(dfx_str).text();
                     }
                 }, 500);




                 var dfx_str_kh = "#show_searchopenyhbspgogo_YYfuwufuzeren";
                 var oldzhi_kh = $(dfx_str_kh).text();
                 var jiancha_YYID = window.setInterval(function () {

                     if ($(dfx_str_kh).text() != oldzhi_kh) {
                         var re = /\[.*?\]/ig;
                         var arr = $(dfx_str_kh).text().match(re);

                         if (arr != null) {//如果能匹配成功即arr数组不为空，循环输出结果
                             for (var i = 0; i < arr.length; i++) {
                                 var arr_z = arr[i].split(':');
                                 if (arr_z[0] == "[姓名")
                                 { $("#YYfuwufuzeren_name").val($.trim(arr_z[1]).replace("]", "")); }

                             }
                         }

                         oldzhi = $(dfx_str).text();
                     }
                 }, 500);

 


                 //获取默认个人库存信息
                 zdy_ajaxdb("");
                 function callback_zdy_ajaxdb(xml) {
                     //解析xml并显示在界面上
                     if ($(xml).find('返回值单条>执行结果').text() != "ok") {
                         bootbox.alert("查找数据失败!" + $(xml).find('返回值单条>提示文本').text());
                         return false;
                     };
                     $("#YYssbumen").val($(xml).find('数据记录>suoshuquyu').text());
                     $("#YYssbumen_name").val($(xml).find('数据记录>suoshuquyu_show').text());
             
                 };
                 function zdy_ajaxdb(cs) {
                     $.ajax({
                         type: "POST",
                         url: url1 + "?guid=" + randomnumber(),
                         dataType: "xml",
                         data: "ajaxrun=info&jkname=" + encodeURIComponent("获取某些个人资料") + "&idforedit=<%=UserSession.唯一键%>&spspsp=gerenziliao",
                         success: callback_zdy_ajaxdb, //请求成功
                         error: errorForAjax//请求出错 
                         //complete: complete//请求完成
                     });

                 };


        });
        </script>
</asp:Content>

