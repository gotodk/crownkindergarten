using System;
using System.Collections.Generic;
using System.Web;
using FMDBHelperClass;
using FMipcClass;
using System.Collections;
using System.Data;
using FMPublicClass;
using System.Numerics;
using System.Web.Script.Serialization;

public class NoReSet_160427000032
{
 

    /// <summary>
    /// ��ʼ������ֵ���ݼ�,ִ�н��ֻ������ok��err(���������������׼)
    /// </summary>
    /// <returns></returns>
    private DataSet initReturnDataSet()
    {
        DataSet ds = new DataSet();
        DataTable auto2 = new DataTable();
        auto2.TableName = "����ֵ����";
        auto2.Columns.Add("ִ�н��");
        auto2.Columns.Add("��ʾ�ı�");
        auto2.Columns.Add("������Ϣ1");
        auto2.Columns.Add("������Ϣ2");
        auto2.Columns.Add("������Ϣ3");
        auto2.Columns.Add("������Ϣ4");
        auto2.Columns.Add("������Ϣ5");
        ds.Tables.Add(auto2);
        return ds;
    }

    /// <summary>
    /// ��������
    /// </summary>
    /// <param name="parameter_forUI">ǰ̨�������Ĳ���</param>
    /// <returns></returns>
    public DataSet NRS_ADD(DataTable parameter_forUI)
    {
        //����ת������
        Hashtable ht_forUI = new Hashtable();
        for (int i = 0; i < parameter_forUI.Rows.Count; i++)
        {
            ht_forUI[parameter_forUI.Rows[i]["������"].ToString()] = parameter_forUI.Rows[i]["����ֵ"].ToString();
        }
        //��ʼ������ֵ
        DataSet dsreturn = initReturnDataSet().Clone();
        dsreturn.Tables["����ֵ����"].Rows.Add(new string[] { "err", "��ʼ��" });
        //�����Ϸ��Ը�����֤������Ҫ���ݾ���ҵ���߼�����

        //��ʼ�����Ĵ�������ҵ���߼��������ݿ�
        I_Dblink I_DBL = (new DBFactory()).DbLinkSqlMain("");
        Hashtable return_ht = new Hashtable();
        ArrayList alsql = new ArrayList();
        Hashtable param = new Hashtable();
        //�Կ�����guid��ʽ����
        //LID, Lmingcheng, Lguige, Ldanwei, Lpinyin, Lchengbenjia, Lzuidijia, Lshoujia, Lbaoyangzhouqi, Lbaoxiuqi
        string guid = 'L'+CombGuid.GetMewIdFormSequence("ZZZ_WFLJ");
        param.Add("@LID", guid);
        param.Add("@Lmingcheng", ht_forUI["Lmingcheng"].ToString());
        param.Add("@Lguige", ht_forUI["Lguige"].ToString());
        param.Add("@Ldanwei", ht_forUI["Ldanwei"].ToString());

        param.Add("@Lpinyin", ht_forUI["Lpinyin"].ToString());
        param.Add("@Lchengbenjia", ht_forUI["Lchengbenjia"].ToString());
        param.Add("@Lzuidijia", ht_forUI["Lzuidijia"].ToString());
        param.Add("@Lshoujia", ht_forUI["Lshoujia"].ToString());

        param.Add("@Lerpbianhao", ht_forUI["Lerpbianhao"].ToString());
        param.Add("@Lbaoxiuqi", ht_forUI["Lbaoxiuqi"].ToString());
        param.Add("@Lzhuangtai", ht_forUI["Lzhuangtai"].ToString());

        alsql.Add("INSERT INTO   ZZZ_WFLJ(LID, Lmingcheng, Lguige, Ldanwei, Lpinyin, Lchengbenjia, Lzuidijia, Lshoujia, Lerpbianhao, Lbaoxiuqi,Lzhuangtai) VALUES(@LID, @Lmingcheng, @Lguige, @Ldanwei, @Lpinyin, @Lchengbenjia, @Lzuidijia, @Lshoujia, @Lerpbianhao, @Lbaoxiuqi,@Lzhuangtai)");

        return_ht = I_DBL.RunParam_SQL(alsql, param);

        if ((bool)(return_ht["return_float"]))
        {
            dsreturn.Tables["����ֵ����"].Rows[0]["ִ�н��"] = "ok";
            dsreturn.Tables["����ֵ����"].Rows[0]["��ʾ�ı�"] = "�����ɹ���";
        }
        else
        {
            dsreturn.Tables["����ֵ����"].Rows[0]["ִ�н��"] = "err";
            dsreturn.Tables["����ֵ����"].Rows[0]["��ʾ�ı�"] = "ϵͳ���ϣ�����ʧ�ܣ�" + return_ht["return_errmsg"].ToString();
        }
        return dsreturn;
    }

    /// <summary>
    /// �༭����
    /// </summary>
    /// <param name="parameter_forUI">ǰ̨�������Ĳ���</param>
    /// <returns></returns>
    public DataSet NRS_EDIT(DataTable parameter_forUI)
    {
        //����ת������
        Hashtable ht_forUI = new Hashtable();
        for (int i = 0; i < parameter_forUI.Rows.Count; i++)
        {
            ht_forUI[parameter_forUI.Rows[i]["������"].ToString()] = parameter_forUI.Rows[i]["����ֵ"].ToString();
        }


        //��ʼ������ֵ
        DataSet dsreturn = initReturnDataSet().Clone();
        dsreturn.Tables["����ֵ����"].Rows.Add(new string[] { "err", "��ʼ��" });

        //�����Ϸ��Ը�����֤������ʡ��
        if (ht_forUI["idforedit"].ToString().Trim() == "")
        {
            dsreturn.Tables["����ֵ����"].Rows[0]["ִ�н��"] = "err";
            dsreturn.Tables["����ֵ����"].Rows[0]["��ʾ�ı�"] = "û����ȷ���޸�Ŀ�꣡";
            return dsreturn;
        }
        //��ʼ�����Ĵ�������ֻ����ʾ������ֱ��������дҵ���߼�������

        I_Dblink I_DBL = (new DBFactory()).DbLinkSqlMain("");
        Hashtable return_ht = new Hashtable();
        ArrayList alsql = new ArrayList();
        Hashtable param = new Hashtable();
        param.Add("@LID", ht_forUI["idforedit"].ToString());
 
        param.Add("@Lmingcheng", ht_forUI["Lmingcheng"].ToString());
        param.Add("@Lguige", ht_forUI["Lguige"].ToString());
        param.Add("@Ldanwei", ht_forUI["Ldanwei"].ToString());

        param.Add("@Lpinyin", ht_forUI["Lpinyin"].ToString());
        param.Add("@Lchengbenjia", ht_forUI["Lchengbenjia"].ToString());
        param.Add("@Lzuidijia", ht_forUI["Lzuidijia"].ToString());
        param.Add("@Lshoujia", ht_forUI["Lshoujia"].ToString());

        param.Add("@Lerpbianhao", ht_forUI["Lerpbianhao"].ToString());
        param.Add("@Lbaoxiuqi", ht_forUI["Lbaoxiuqi"].ToString());
        param.Add("@Lzhuangtai", ht_forUI["Lzhuangtai"].ToString());

        alsql.Add("UPDATE ZZZ_WFLJ SET Lmingcheng=@Lmingcheng, Lguige=@Lguige, Ldanwei=@Ldanwei, Lpinyin=@Lpinyin, Lchengbenjia=@Lchengbenjia, Lzuidijia=@Lzuidijia, Lshoujia=@Lshoujia, Lerpbianhao=@Lerpbianhao, Lbaoxiuqi=@Lbaoxiuqi,Lzhuangtai=@Lzhuangtai  where LID=@LID ");
   

        return_ht = I_DBL.RunParam_SQL(alsql, param);




        if ((bool)(return_ht["return_float"]))
        {

            dsreturn.Tables["����ֵ����"].Rows[0]["ִ�н��"] = "ok";
            dsreturn.Tables["����ֵ����"].Rows[0]["��ʾ�ı�"] = "�޸ĳɹ���";
        }
        else
        {
            //��ʵҪ��¼��־�����������������ֻ����ʾ
            //dsreturn.Tables.Add(parameter_forUI.Copy());
            dsreturn.Tables["����ֵ����"].Rows[0]["ִ�н��"] = "err";
            dsreturn.Tables["����ֵ����"].Rows[0]["��ʾ�ı�"] = "ϵͳ���ϣ��޸�ʧ�ܣ�" + return_ht["return_errmsg"].ToString();
        }





        return dsreturn;
    }

    /// <summary>
    /// �༭����ǰ��ȡ����
    /// </summary>
    /// <param name="parameter_forUI">ǰ̨�������Ĳ���</param>
    /// <returns></returns>
    public DataSet NRS_EDIT_INFO(DataTable parameter_forUI)
    {
        //����ת������
        Hashtable ht_forUI = new Hashtable();
        for (int i = 0; i < parameter_forUI.Rows.Count; i++)
        {
            ht_forUI[parameter_forUI.Rows[i]["������"].ToString()] = parameter_forUI.Rows[i]["����ֵ"].ToString();
        }


        //��ʼ������ֵ
        DataSet dsreturn = initReturnDataSet().Clone();
        dsreturn.Tables["����ֵ����"].Rows.Add(new string[] { "err", "��ʼ��" });

        //�����Ϸ��Ը�����֤������ʡ��

        //��ʼ�����Ĵ�������ֻ����ʾ������ֱ��������дҵ���߼�������

        I_Dblink I_DBL = (new DBFactory()).DbLinkSqlMain("");
        Hashtable return_ht = new Hashtable();
        Hashtable param = new Hashtable();
        param.Add("@LID", ht_forUI["idforedit"].ToString());

        return_ht = I_DBL.RunParam_SQL("select  top 1 *  from ZZZ_WFLJ where LID=@LID", "���ݼ�¼", param);

        if ((bool)(return_ht["return_float"]))
        {
            DataTable redb = ((DataSet)return_ht["return_ds"]).Tables["���ݼ�¼"].Copy();

            if (redb.Rows.Count < 1)
            {
                dsreturn.Tables["����ֵ����"].Rows[0]["ִ�н��"] = "err";
                dsreturn.Tables["����ֵ����"].Rows[0]["��ʾ�ı�"] = "û���ҵ�ָ������!";
                return dsreturn;
            }
 
            dsreturn.Tables.Add(redb);


            dsreturn.Tables["����ֵ����"].Rows[0]["ִ�н��"] = "ok";
            dsreturn.Tables["����ֵ����"].Rows[0]["��ʾ�ı�"] = "";
        }
        else
        {
            dsreturn.Tables["����ֵ����"].Rows[0]["ִ�н��"] = "err";
            dsreturn.Tables["����ֵ����"].Rows[0]["��ʾ�ı�"] = "������󣬻�ȡʧ�ܣ�" + return_ht["return_errmsg"].ToString();
        }


        return dsreturn;
    }


}
