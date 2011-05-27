using System;
using System.IO;
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
            var db = new DataBase.DataClasses1DataContext();

            var query1 = from n in db.Groups select n.Name;

            foreach (var grupa in query1)
            {
                Groups.Items.Add(grupa);
            }
        }

        public string CSVinputs = "";
        public string CSVoutputs = "";

        //dodanie nowego problemu do bazy
        protected void AddProblem_Click(object sender, EventArgs e)
        {
            //try
            //{
                if (Page.IsValid == true)
                {
                    Input1.Text.Trim();
                    Output1.Text.Trim();
                    Input2.Text.Trim();
                    Output2.Text.Trim();
                    Input3.Text.Trim();
                    Output3.Text.Trim();

                    var db = new DataBase.DataClasses1DataContext();

                    DataBase.Problem NewProblem = new DataBase.Problem();

                    NewProblem.Title = ProblemsTitle.Text;
                    NewProblem.ProblemsCode = ProblemsCode.Text;
                    NewProblem.Description = Editor.Content;
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
                    
                    //zbieranie grup
                    string groups = "";

                    for (int i = 0; i < Groups.Items.Count; i++)
                    {
                        groups += Groups.Items[i].Text + ";";
                    }

                    //sprawdzenie czy został wybrany jakikolwiek język programowania
                    if (languages == "")
                    {
                        AddingSuccessful.Text = "You must choose at least one programming language";
                        AddingSuccessful.Visible = true;
                        return;
                    }

                    NewProblem.Languages = languages;

                    if ((CSVinputs == "" || CSVoutputs == "") && (Input1.Text == "" || Output1.Text == ""))
                    {
                        AddingSuccessful.Visible = true;
                        AddingSuccessful.Text = "Nie podałeś żadnej pary WEJ/WYJ dla zadania!";
                        return;
                    }
                    else if (CSVinputs != "" && CSVoutputs != "")
                    {
                        NewProblem.Input = CSVinputs;
                        NewProblem.Output = CSVoutputs;
                    }
                    else
                    {
                        NewProblem.Input = Input1.Text + ";";
                        NewProblem.Output = Output1.Text + ";";

                        if (Input2.Text != "" && Output2.Text != "")
                        {
                            NewProblem.Input += Input2.Text + ";";
                            NewProblem.Output += Output2.Text + ";";
                        }

                        if (Input3.Text != "" && Output3.Text != "")
                        {
                            NewProblem.Input += Input3.Text + ";";
                            NewProblem.Output += Output3.Text + ";";
                        }
                    }

                    NewProblem.TimeLimit = int.Parse(TimeLimit.Text);
                    NewProblem.SizeLimit = int.Parse(SizeLimit.Text);

                    NewProblem.OpeningDate = Convert.ToDateTime(OpeningDate.Text + " " + Convert.ToString(OpeningTime.Date.TimeOfDay));
                    NewProblem.ClosingDate = Convert.ToDateTime(ClosingDate.Text + " " + Convert.ToString(ClosingTime.Date.TimeOfDay));

                    NewProblem.AddingDate = DateTime.Now;
                    NewProblem.AddedBy = "Admin";

                    NewProblem.Groups = groups;

                    db.Problems.InsertOnSubmit(NewProblem);
                    db.SubmitChanges();

                    AddingSuccessful.Text = "Dodano pomyślnie";
                    AddingSuccessful.Visible = true;
                    //Response.Write("<p>Dodano pomyślnie nowy problem.</p> <br/> <br/> <a href=\"../Admin/AddNewProblem/\">Dodaj następny</a>");
                //}
            }
            //catch (System.Data.SqlClient.SqlException ex)
            //{
            //    AddingSuccessful.Text = "Brak połączenia z bazą.";
            //    AddingSuccessful.Visible = true;
            //}
        }

        protected void AsyncFileUpload_UploadedComplete(object sender, AjaxControlToolkit.AsyncFileUploadEventArgs e)
        {
            UploadFileInfoLabel.Visible = false;
            if (AsyncFileUpload.HasFile)
            {
                string fileName = Path.GetFileName(AsyncFileUpload.PostedFile.FileName);
                string strPath = Server.MapPath("~/CSVFiles/" + fileName);
                if ((Path.GetExtension(fileName).Contains(".csv")))
                {
                    AsyncFileUpload.SaveAs(strPath);
                    AddInputs(strPath);
                    DeleteTempFile(strPath);
                }
                else
                {
                    UploadFileInfoLabel.Visible = true;
                }
            }

        }

        private void AddInputs(string filePath)
        {
            StreamReader reader = new StreamReader(filePath);
            try
            {
                while (!reader.EndOfStream)
                {
                    string[] line = reader.ReadLine().Split(';');

                    CSVinputs += line[1] + ";";
                    CSVoutputs += line[2] + ";";
                }
            }
            catch { }

            finally
            {
                reader.Close();
            }


        }

        private void DeleteTempFile(string filePath)
        {
            if (File.Exists(filePath))
                File.Delete(filePath);
        }
    }
}