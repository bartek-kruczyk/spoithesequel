using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace spoithesequel.Admin
{
    public partial class AddNewProblem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //dodanie nowego problemu do bazy
        protected void AddProblem_Click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid)
                {

                    var db = new DataBase.DataClasses1DataContext();

                    DataBase.Problem NewProblem = new DataBase.Problem();

                    NewProblem.Title = ProblemsTitle.Text;
                    NewProblem.ProblemsCode = ProblemsCode.Text;
                    NewProblem.Description = Description.Text;
                    NewProblem.DifficultyLevel = DifficultyLevel.SelectedItem.Text;

                    //pobranie dozwolonych języków programowania z kontrolki CheckBoxList do
                    //stringu languages
                    string languages = "";

                    for (int i = 0; i < Languages.Items.Count; i++)
                    {
                        if (Languages.Items[i].Selected)
                        {
                            languages += Languages.Items[i].Text + ";";
                        }
                    }

                    //sprawdzenie czy został wybrany jakikolwiek język programowania
                    if (languages == "")
                    {
                        AddingSuccessful.Text = "You must choose at least one programming language";
                        AddingSuccessful.Visible = true;
                        return;
                    }

                    NewProblem.Languages = languages;
                    NewProblem.Input = Input.Text;
                    NewProblem.Output = Output.Text;
                    NewProblem.TimeLimit = int.Parse(TimeLimit.Text);
                    NewProblem.SizeLimit = int.Parse(SizeLimit.Text);

                    NewProblem.OpeningDate = OpeningDate.SelectedDate;
                    NewProblem.ClosingDate = ClosingDate.SelectedDate;

                    NewProblem.AddingDate = DateTime.Now;
                    //NewProblem.AddedBy = UprawnionyUser

                    db.Problems.InsertOnSubmit(NewProblem);
                    db.SubmitChanges();

                    AddingSuccessful.Text = "New problem was added succesfully";
                    AddingSuccessful.Visible = true;
                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                AddingSuccessful.Text = "Brak połączenia z bazą.";
                AddingSuccessful.Visible = true;
            }
        }
    }
}