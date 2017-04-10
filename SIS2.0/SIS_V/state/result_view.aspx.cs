using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using SIS_B;

namespace SIS_V.state
{
    public partial class result_view : System.Web.UI.Page
    {
        bus_sis_ugc3 objBus = new bus_sis_ugc3();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                norec_1.Visible = false;
                norec_2.Visible = false;
                CheckIsLogin();
            }
        }
        protected void CheckIsLogin()
        {
            if (Session["is_login"] != null)
            {
                if (Session["is_login"].ToString() == "f")
                {
                    Response.Redirect("~/Login");
                }
                else
                {
                    lbl_ele_name.Text = Session["election"].ToString();
                    lbl_state_name.Text = Session["statename"].ToString();
                    objBus.state_id = int.Parse(Session["state"].ToString());
                    objBus.elec_id = int.Parse(Session["election_id"].ToString());
                    fill_result();
                }
            }
            else
            {
                Response.Redirect("~/Login");
            }
        }
        public void fill_result()
        {
            DataSet ds = objBus.fill_results();
            if (ds.Tables[0].Rows.Count == 0)
            {
                norec_1.Visible = true;
                norec_2.Visible = true;
            }
            else
            {
                lbl_parlimen_total.Text = ds.Tables[3].Rows[0]["win_total_parlimen"].ToString();
                lbl_dun_total.Text = ds.Tables[4].Rows[0]["win_total_dun"].ToString();
                lbl_state1.Text = Session["statename"].ToString();
                lbl_state2.Text = Session["statename"].ToString();
                string cand_imaged;
                ds.Tables[0].Columns.Add("image", typeof(string));
                if (ds.Tables[0].Rows.Count > 0)
                {
                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                    {
                        string base64Stringd = "";
                        if (ds.Tables[0].Rows[i]["logo_image"].ToString() == "")
                        {
                            base64Stringd = "iVBORw0KGgoAAAANSUhEUgAAACgAAAAoCAIAAAADnC86AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6QTJBODAxQjUxOUI1MTFFN0I0QjBBOTE5OUY1QzE2RjEiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6QTJBODAxQjYxOUI1MTFFN0I0QjBBOTE5OUY1QzE2RjEiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDpBMkE4MDFCMzE5QjUxMUU3QjRCMEE5MTk5RjVDMTZGMSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDpBMkE4MDFCNDE5QjUxMUU3QjRCMEE5MTk5RjVDMTZGMSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PtekuW0AAAPpSURBVHja7JdJS2NBEMeN0QnuRMXdKO4L4gKagyiiMagXQRDBj+A38jN4Cwoe1JMHN1AUF0TBLaDikqg5qAjzG2uoaZ6ZidEwMkz68OhX1a/+Vd31r+pnm5ycTPiKkZjwReP/A06KuCIvL8/hcDC5u7sLBoOmhHF5efn4+JiVlVVcXMzr1dUVkthEjN2ioqLBwcGRkREARFheXt7d3Q082q6uLlQIn56e+vv7h4aG1K1PARPl8vLy7e1tcnKy1+vFKDGtrKwgOTg4cLvd9fX1c3NzOzs7vE5PT5eUlHR0dMTsjE9OTg4PD51OZ19fn2zD9fU1k4aGBp6np6fq5fPzM65EDDqK5JqfnydKAiJKkZSWlrINlmU3NzeSB7HMap/PR0DNzc0SKHH/JTqBNDMzw0SC5rDxw7ImPz8foW7+Z4GrqqqUP4uLi7rD5J2pZfN5bmxsxIDH2GpqakpLSyOttra2ACaBCwsLRcucJ4xCAp04gtXV1fX19YhmbR9uEnBa6okZa8QdjiLiP/DbfH0/pBWYCOrq6lwuF2Q9OzuDpnt7e6Z1DrKsrIz9ZL65uakqtre6ulpYdHR0pE6IwW+v4/j4mPISHlgqFBOAOUtLBKOjo0DOzs6S2HgwNja2sLCAreHhYbQiB4nStrS0JF729vbKGorJwMBAa2vr1NRUdFlNTHhD8RLiYgvCwCjkkEfluK5hoQ2FQvKKljVYEPZHASw5TOcxyxN53tjYaJH7/X5gKFtoHx4eVC5rlAvvbYs4G1ZlyomGlkVBpazKeb8d6enpUUTMCYnvb+s+OahzCE1mSDuhwrw1wvP8/DwK4JqaGgHQjcIKR0uzkhymW5vW5VAvLi5YYzksaPJbYFLffCUVKysryRqCgGnkKtYpYbiChCh3d3fZZKke6qLkOdhyKeCrgoICMtwk56/KJbQLG7QSGoyMjAwLv/mwoqJCMouCihNKRbF5f38vlTU2JfMfv2VqxZfTIjvkIsfWWVRmb9YLpazhE714yIeSbrLMvJMg+RlxT0+P9lSPx4MVWqHUI1PFXZPzI43b2toUFevcMsVRnqiYjI+Ps4C5uCimeGUBOYgTieIvTylD2IW1JBFUAd5UhaU4g52gYrS0tAgGvMBps2wpBCposra2xrIfwCQe1IZ2ot7e3m5vb4emqsrOztYbtTlgGr7TsoDRXaGXcC0Ewzyazs5OUXFHyMzMxF37xMQEpQ6YlJQUSiDko+bZbDYaGV+KisKLKul12O12GMUEb4BkjsX9/f2cnJzU1FT8eHl5wRRdJBAI5ObmImQZxRKb4EGt2tpa9tUW/02NA8eB48AfHd8FGABVE0VKqnrP4wAAAABJRU5ErkJggg==";
                        }
                        else
                        {
                            byte[] bytesd = (byte[])ds.Tables[0].Rows[i]["logo_image"];
                            if (bytesd.Length > 0)
                            {
                                base64Stringd = Convert.ToBase64String(bytesd, 0, bytesd.Length);
                            }
                            else
                            {
                                base64Stringd = "iVBORw0KGgoAAAANSUhEUgAAACgAAAAoCAIAAAADnC86AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6QTJBODAxQjUxOUI1MTFFN0I0QjBBOTE5OUY1QzE2RjEiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6QTJBODAxQjYxOUI1MTFFN0I0QjBBOTE5OUY1QzE2RjEiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDpBMkE4MDFCMzE5QjUxMUU3QjRCMEE5MTk5RjVDMTZGMSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDpBMkE4MDFCNDE5QjUxMUU3QjRCMEE5MTk5RjVDMTZGMSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PtekuW0AAAPpSURBVHja7JdJS2NBEMeN0QnuRMXdKO4L4gKagyiiMagXQRDBj+A38jN4Cwoe1JMHN1AUF0TBLaDikqg5qAjzG2uoaZ6ZidEwMkz68OhX1a/+Vd31r+pnm5ycTPiKkZjwReP/A06KuCIvL8/hcDC5u7sLBoOmhHF5efn4+JiVlVVcXMzr1dUVkthEjN2ioqLBwcGRkREARFheXt7d3Q082q6uLlQIn56e+vv7h4aG1K1PARPl8vLy7e1tcnKy1+vFKDGtrKwgOTg4cLvd9fX1c3NzOzs7vE5PT5eUlHR0dMTsjE9OTg4PD51OZ19fn2zD9fU1k4aGBp6np6fq5fPzM65EDDqK5JqfnydKAiJKkZSWlrINlmU3NzeSB7HMap/PR0DNzc0SKHH/JTqBNDMzw0SC5rDxw7ImPz8foW7+Z4GrqqqUP4uLi7rD5J2pZfN5bmxsxIDH2GpqakpLSyOttra2ACaBCwsLRcucJ4xCAp04gtXV1fX19YhmbR9uEnBa6okZa8QdjiLiP/DbfH0/pBWYCOrq6lwuF2Q9OzuDpnt7e6Z1DrKsrIz9ZL65uakqtre6ulpYdHR0pE6IwW+v4/j4mPISHlgqFBOAOUtLBKOjo0DOzs6S2HgwNja2sLCAreHhYbQiB4nStrS0JF729vbKGorJwMBAa2vr1NRUdFlNTHhD8RLiYgvCwCjkkEfluK5hoQ2FQvKKljVYEPZHASw5TOcxyxN53tjYaJH7/X5gKFtoHx4eVC5rlAvvbYs4G1ZlyomGlkVBpazKeb8d6enpUUTMCYnvb+s+OahzCE1mSDuhwrw1wvP8/DwK4JqaGgHQjcIKR0uzkhymW5vW5VAvLi5YYzksaPJbYFLffCUVKysryRqCgGnkKtYpYbiChCh3d3fZZKke6qLkOdhyKeCrgoICMtwk56/KJbQLG7QSGoyMjAwLv/mwoqJCMouCihNKRbF5f38vlTU2JfMfv2VqxZfTIjvkIsfWWVRmb9YLpazhE714yIeSbrLMvJMg+RlxT0+P9lSPx4MVWqHUI1PFXZPzI43b2toUFevcMsVRnqiYjI+Ps4C5uCimeGUBOYgTieIvTylD2IW1JBFUAd5UhaU4g52gYrS0tAgGvMBps2wpBCposra2xrIfwCQe1IZ2ot7e3m5vb4emqsrOztYbtTlgGr7TsoDRXaGXcC0Ewzyazs5OUXFHyMzMxF37xMQEpQ6YlJQUSiDko+bZbDYaGV+KisKLKul12O12GMUEb4BkjsX9/f2cnJzU1FT8eHl5wRRdJBAI5ObmImQZxRKb4EGt2tpa9tUW/02NA8eB48AfHd8FGABVE0VKqnrP4wAAAABJRU5ErkJggg==";
                            }
                        }
                        cand_imaged = "data:image/png;base64," + base64Stringd;
                        ds.Tables[0].Rows[i]["image"] = cand_imaged;
                    }
                }
                dtlst_coalition.DataSource = ds.Tables[0];
                dtlst_coalition.DataBind();
                dtlst_dun.DataSource = ds.Tables[0];
                dtlst_dun.DataBind();
            }
        }
        protected void dtlst_dun_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if ((e.Item.ItemType == ListItemType.Item) || (e.Item.ItemType == ListItemType.AlternatingItem))
            {
                DataRowView drv = e.Item.DataItem as DataRowView;
                DataList dtlst_count_dun = e.Item.FindControl("dtlst_count_dun") as DataList;
                dtlst_count_dun.DataSource = drv.CreateChildView("all_dun");
                dtlst_count_dun.DataBind();
            }
        }

        protected void dtlst_coalition_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if ((e.Item.ItemType == ListItemType.Item) || (e.Item.ItemType == ListItemType.AlternatingItem))
            {
                DataRowView drv = e.Item.DataItem as DataRowView;
                DataList dtlst_count_par = e.Item.FindControl("dtlst_count_par") as DataList;
                dtlst_count_par.DataSource = drv.CreateChildView("all_par");
                dtlst_count_par.DataBind();
            }
        }

        protected void lnk_dun_Click(object sender, EventArgs e)
        {
            string[] strArr = null;
            LinkButton btn = (LinkButton)(sender);
            string str = btn.CommandArgument;
            strArr = str.Split(',');
            Session["coalition_id"] = int.Parse(strArr[0].ToString());
            Session["area_type"] = int.Parse(strArr[1].ToString());
            Response.Redirect("result_desc");
        }

        protected void lnk_par_Click(object sender, EventArgs e)
        {
            string[] strArr = null;
            LinkButton btn = (LinkButton)(sender);
            string str = btn.CommandArgument;
            strArr = str.Split(',');
            Session["coalition_id"] = int.Parse(strArr[0].ToString());
            Session["area_type"] = int.Parse(strArr[1].ToString());
            Response.Redirect("result_desc");
        }

        protected void lnk_par_all_Click(object sender, EventArgs e)
        {
            string[] strArr = null;
            LinkButton btn = (LinkButton)(sender);
            string str = btn.CommandArgument;
            strArr = str.Split(',');
            Session["coalition_id"] = int.Parse(strArr[0].ToString());
            Session["area_type"] = int.Parse(strArr[1].ToString());
            Response.Redirect("result_desc");
        }

        protected void lnk_dun_all_Click(object sender, EventArgs e)
        {
            string[] strArr = null;
            LinkButton btn = (LinkButton)(sender);
            string str = btn.CommandArgument;
            strArr = str.Split(',');
            Session["coalition_id"] = int.Parse(strArr[0].ToString());
            Session["area_type"] = int.Parse(strArr[1].ToString());
            Response.Redirect("result_desc");
        }
    }
}