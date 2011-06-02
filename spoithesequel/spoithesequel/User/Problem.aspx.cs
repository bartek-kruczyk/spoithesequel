using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace spoithesequel.User
{
    public partial class Problem : System.Web.UI.Page
    {
        public string KodProblemu;

        protected void Page_Load(object sender, EventArgs e)
        {
            KodProblemu = Request.QueryString["KodProblemu"];

            if (KodProblemu == null)
            {
                Response.Redirect("~/Default.aspx");
                return;
            }

            SolveProblemLink.NavigateUrl = "~/User/SolveProblem.aspx?KodProblemu=" + KodProblemu;

            var db = new DataBase.DataClasses1DataContext();
            var query = from n in db.Problems where n.ProblemsCode == KodProblemu select n;
            var ExistingProblem = query.First();

            ProblemsTitle.Text = ExistingProblem.Title;
            ProblemsCode.Text = ExistingProblem.ProblemsCode;

            ProblemsDescription.Text = ExistingProblem.Description;

            ProblemsInfo.Rows[0].Cells[1].Text = ExistingProblem.AddedBy;
            ProblemsInfo.Rows[1].Cells[1].Text = ExistingProblem.AddingDate.ToShortDateString();
            ProblemsInfo.Rows[2].Cells[1].Text = ExistingProblem.DifficultyLevel;
            ProblemsInfo.Rows[3].Cells[1].Text = ExistingProblem.TimeLimit.ToString() + " s";
            ProblemsInfo.Rows[4].Cells[1].Text = ExistingProblem.SizeLimit.ToString() + " B";
            ProblemsInfo.Rows[5].Cells[1].Text = ExistingProblem.Languages.Replace(';', ' ');
        }
    }
}