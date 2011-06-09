using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace spoithesequel.Admin
{
    public partial class AddStudentToGroup : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            BindData();
           
        }

        private List<StudentInGroup> getStudentWithoutGroup()
        {
            List<StudentInGroup> list = new List<StudentInGroup>();
            using (var db = new DataBase.DataClasses1DataContext(WebConfigurationManager.ConnectionStrings["dziennikucznia_studentlive_plConnectionString"].ConnectionString))
            {
                var students = from s in db.aspnet_Memberships where s.GroupId == -1 select s;
                foreach (var s in students)
                {
                    list.Add(new StudentInGroup(s.aspnet_User.UserName, s.Email, s.UserId));
                }
                
            }
            return list;
        }

        private List<StudentInGroup> getStudentInGroup(int id)
        {
            List<StudentInGroup> list = new List<StudentInGroup>();
            using (var db = new DataBase.DataClasses1DataContext(WebConfigurationManager.ConnectionStrings["dziennikucznia_studentlive_plConnectionString"].ConnectionString))
            {
                var students = from s in db.aspnet_Memberships where s.GroupId == id select s;
                foreach (var s in students)
                {
                    list.Add(new StudentInGroup(s.aspnet_User.UserName, s.Email, s.UserId));
                }
            }
            return list;
        }

        protected void DropButton_Command(object sender, CommandEventArgs e)
        {
            using (var db = new DataBase.DataClasses1DataContext(WebConfigurationManager.ConnectionStrings["dziennikucznia_studentlive_plConnectionString"].ConnectionString))
            {
                var student = (from s in db.aspnet_Memberships where s.UserId == new Guid(e.CommandArgument.ToString()) select s).FirstOrDefault();
                student.GroupId = -1;
                db.SubmitChanges();
                BindData();
            }
        }

        protected void AddUserToGroup(object sender, CommandEventArgs e)
        {
            string id = Request.QueryString["id"];
            using (var db = new DataBase.DataClasses1DataContext(WebConfigurationManager.ConnectionStrings["dziennikucznia_studentlive_plConnectionString"].ConnectionString))
            {
                var student = (from s in db.aspnet_Memberships where s.UserId == new Guid(e.CommandArgument.ToString()) select s).FirstOrDefault();
                student.GroupId = Convert.ToInt32(id);
                db.SubmitChanges();
                BindData();
            }
        }

        private void BindData()
        {
            string id = Request.QueryString["id"];
            StudentWithoutGroupRepeater.DataSource = getStudentWithoutGroup();
            StudentWithoutGroupRepeater.DataBind();
            StudentInGroupRepeater.DataSource = getStudentInGroup(int.Parse(id));
            StudentInGroupRepeater.DataBind();
        }
        //protected void AddToGroup_Click(object sender, EventArgs e)
        //{
        //    foreach (RepeaterItem control in StudentWithoutGroupRepeater.Controls)
        //    {
        //        string id = Request.QueryString["id"];
        //        CheckBox chkbox = control.FindControl("SetUser") as CheckBox;
        //        HiddenField userId = control.FindControl("IdHiddenField") as HiddenField;
        //        if (chkbox.Checked)
        //        {
        //            using (var db = new DataBase.DataClasses1DataContext(WebConfigurationManager.ConnectionStrings["dziennikucznia_studentlive_plConnectionString"].ConnectionString))
        //            {
        //                var student = (from s in db.aspnet_Memberships where s.UserId == new Guid(userId.ToString()) select s).FirstOrDefault();
        //                student.GroupId = Convert.ToInt32(id);
        //                db.SubmitChanges();
        //                BindData();
        //            }
        //        }
        //    }
        //    BindData();
        //}

        //private void SetCheckBoxForDetalisProductView()
        //{
        //    foreach (RepeaterItem row in StudentWithoutGroupRepeater.Controls)
        //    {
        //        var chkBox = row.FindControl("SetUser") as CheckBox;

        //        IDataItemContainer container = (IDataItemContainer)chkBox.NamingContainer;

        //        if (chkBox.Checked)
        //        {
        //            PersistRowIndex(container.DataItemIndex);
        //        }
        //        else
        //        {
        //            RemoveRowIndex(container.DataItemIndex);
        //        }
        //    }
        //}

        //private void RemoveRowIndex(int index)
        //{
        //    SelectedCustomersIndex.Remove(index);
        //}

        //private void PersistRowIndex(int index)
        //{
        //    if (!SelectedCustomersIndex.Exists(i => i == index))
        //    {
        //        SelectedCustomersIndex.Add(index);
        //    }
        //}

        //private List<Int32> SelectedCustomersIndex
        //{
        //    get
        //    {
        //        if (ViewState[SELECTED_INDEX] == null)
        //        {
        //            ViewState[SELECTED_INDEX] = new List<Int32>();
        //        }

        //        return (List<Int32>)ViewState[SELECTED_INDEX];
        //    }
        //}

        //private void RePopulateCheckBoxes()
        //{
        //    foreach (RepeaterItem row in StudentWithoutGroupRepeater.Controls)
        //    {
        //        var chkBox = row.FindControl("SetUser") as CheckBox;
        //        IDataItemContainer container = (IDataItemContainer)chkBox.NamingContainer;

        //        if (SelectedCustomersIndex != null)
        //        {
        //            if (SelectedCustomersIndex.Exists(i => i == container.DataItemIndex))
        //            {
        //                chkBox.Checked = true;
        //            }
        //        }
        //    }
        //}

        //protected void ChckedChange(object sender, EventArgs e)
        //{
        //    SetCheckBoxForDetalisProductView();
        //    RePopulateCheckBoxes();
        //}
        
    }
}