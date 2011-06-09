using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using spoithesequel.DataBase;

namespace spoithesequel.Admin
{
    public partial class AddGroup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AddGroupButton_Click(object sender, EventArgs e)
        {
            using (var db = new DataBase.DataClasses1DataContext(WebConfigurationManager.ConnectionStrings["dziennikucznia_studentlive_plConnectionString"].ConnectionString))
            {
                Group @group = new Group();
                @group.Name = GroupNameTextBox.Text;
                db.Groups.InsertOnSubmit(@group);
                db.SubmitChanges();
                GroupNameRepeater.DataBind();
            }
        }
    }
}