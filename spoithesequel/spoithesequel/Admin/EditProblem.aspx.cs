using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace spoithesequel.Admin
{
    public partial class EditProblem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                var db = new DataBase.DataClasses1DataContext();

                var query1 = from n in db.Groups select n.Name;

                foreach (var grupa in query1)
                {
                    Groups.Items.Add(grupa);
                }

                var query = from n in db.Problems where n.Id == 5 select n;

                var ExistingProblem = query.First();

                ProblemsTitle.Text = ExistingProblem.Title;
                ProblemsCode.Text = ExistingProblem.ProblemsCode;

                DifficultyLevel.SelectedValue = ExistingProblem.DifficultyLevel;

                foreach (ListItem checkbox in Languages.Items)
                {
                    if (ExistingProblem.Languages.Contains(checkbox.Text))
                    {
                        checkbox.Selected = true;
                    }
                }

                for (int i = 0; i < Groups.Items.Count - 1; i++)
                {
                    if (ExistingProblem.Groups.Contains(Groups.Items[i].Text))
                    {
                        Groups.Items[i].Selected = true;
                    }
                }


                TimeLimit.Text = ExistingProblem.TimeLimit.ToString();
                SizeLimit.Text = ExistingProblem.SizeLimit.ToString();

                Editor.Content = ExistingProblem.Description;

                OpeningDate.Text = ExistingProblem.OpeningDate.Month.ToString() + "/" + ExistingProblem.OpeningDate.Day.ToString() + "/" + ExistingProblem.OpeningDate.Year.ToString();
                ClosingDate.Text = ExistingProblem.ClosingDate.Month.ToString() + "/" + ExistingProblem.ClosingDate.Day.ToString() + "/" + ExistingProblem.ClosingDate.Year.ToString();

                OpeningTime.Hour = ExistingProblem.OpeningDate.Hour;
                OpeningTime.Minute = ExistingProblem.OpeningDate.Minute;

                ClosingTime.Hour = ExistingProblem.ClosingDate.Hour;
                ClosingTime.Minute = ExistingProblem.ClosingDate.Minute;

                InOut.Rows[0].Cells[0].Text = "nr";
                InOut.Rows[0].Cells[1].Text = "usunąć?";
                InOut.Rows[0].Cells[2].Text = "wejście";
                InOut.Rows[0].Cells[3].Text = "wyjście";

                string[] inputs = ExistingProblem.Input.Split(';');
                string[] outputs = ExistingProblem.Output.Split(';');

                for (int i = 0; i < inputs.Count() - 1; i++)
                {
                    InOut.Rows.Add(new TableRow());
                    InOut.Rows[i + 1].Cells.Add(new TableCell());
                    InOut.Rows[i + 1].Cells.Add(new TableCell());
                    InOut.Rows[i + 1].Cells.Add(new TableCell());
                    InOut.Rows[i + 1].Cells.Add(new TableCell());

                    InOut.Rows[i + 1].Cells[0].Text = Convert.ToString(i + 1);

                    CheckBox temp = new CheckBox();
                    temp.ID = "Usun_" + Convert.ToString(i);

                    InOut.Rows[i + 1].Cells[1].Controls.Add(temp);
                    InOut.Rows[i + 1].Cells[2].Text = inputs[i];
                    InOut.Rows[i + 1].Cells[3].Text = outputs[i];
                }

                if (Session["JestJuz17iMiSieNieChce"]!=null && (bool)Session["JestJuz17iMiSieNieChce"] == true)
                {
                    EditSuccessful.Text = "Wyedytowano pomyślnie";
                    EditSuccessful.Visible = true;
                    Session.Clear();
                }
            }
        }

        //public CheckBoxList ExistingInOut = new CheckBoxList();
        
        public string CSVinputs = "";
        public string CSVoutputs = "";

        protected void EditProblem_Click(object sender, EventArgs e)
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

                    var query = from n in db.Problems where n.Id == 5 select n;

                    var ExistingProblem = query.First();

                    //DataBase.Problem NewProblem = new DataBase.Problem();

                    ExistingProblem.Title = ProblemsTitle.Text;
                    ExistingProblem.ProblemsCode = ProblemsCode.Text;
                    ExistingProblem.Description = Editor.Content;
                    ExistingProblem.DifficultyLevel = DifficultyLevel.SelectedItem.Text;

                    //pobranie dozwolonych języków programowania z kontrolki CheckBoxList do
                    //stringu languages
                    string languages = "";

                    for (int i = 0; i < Languages.Items.Count; i++)
                    {
                        if (Languages.Items[i].Selected ==  true)
                        {
                            languages += Languages.Items[i].Text + ";";
                        }
                    }


                    //sprawdzenie czy został wybrany jakikolwiek język programowania
                    if (languages == "")
                    {
                        EditSuccessful.Text = "You must choose at least one programming language";
                        EditSuccessful.Visible = true;
                        return;
                    }

                    ExistingProblem.Languages = languages;
                    
                    //zbieranie grup
                    
                    string groups = "";

                    

                    for (int i = 0; i < Groups.Items.Count; i++)
                    {
                        if (Groups.Items[i].Selected == true)
                        {
                            groups += Groups.Items[i].Text + ";";
                        }
                    }

                    ExistingProblem.Groups = groups;

                    string newInput = "";
                    string newOutput = "";

                    for (int i = 1; i < InOut.Rows.Count; i++)
                    {
                        CheckBox temp = (CheckBox)InOut.Rows[i].Cells[1].Controls[0];
                        if (temp.Checked == true)
                        {
                            string[] input = ExistingProblem.Input.Split(';');
                            //ExistingProblem.Input = null;

                            for (int j = 0; j < input.Count()-1; j++)
                            {
                                if (j == i)
                                {
                                    continue;
                                }
                                else
                                {
                                    newInput += input[j]+";";
                                }
                            }

                            string[] output = ExistingProblem.Output.Split(';');
                            //ExistingProblem.Output = null;

                            for (int j = 0; j < input.Count() - 1; j++)
                            {
                                if (j == i)
                                {
                                    continue;
                                }
                                else
                                {
                                    newOutput += output[j]+";";
                                }
                            }
                        }
                    }

                    ExistingProblem.Input = newInput;
                    ExistingProblem.Output = newOutput;

                    if (CSVinputs != "" && CSVoutputs != "")
                    {
                        ExistingProblem.Input += CSVinputs;
                        ExistingProblem.Output += CSVoutputs;
                    }
                    else if (Input1.Text != "" && Output1.Text != "")
                    {
                        ExistingProblem.Input += Input1.Text + ";";
                        ExistingProblem.Output += Output1.Text + ";";

                        if (Input2.Text != "" && Output2.Text != "")
                        {
                            ExistingProblem.Input += Input2.Text + ";";
                            ExistingProblem.Output += Output2.Text + ";";
                        }

                        if (Input3.Text != "" && Output3.Text != "")
                        {
                            ExistingProblem.Input += Input3.Text + ";";
                            ExistingProblem.Output += Output3.Text + ";";
                        }
                    }

                    ExistingProblem.TimeLimit = int.Parse(TimeLimit.Text);
                    ExistingProblem.SizeLimit = int.Parse(SizeLimit.Text);

                    ExistingProblem.OpeningDate = Convert.ToDateTime(OpeningDate.Text + " " + Convert.ToString(OpeningTime.Date.TimeOfDay));
                    ExistingProblem.ClosingDate = Convert.ToDateTime(ClosingDate.Text + " " + Convert.ToString(ClosingTime.Date.TimeOfDay));

                    ExistingProblem.AddingDate = DateTime.Now;
                    //NewProblem.AddedBy = UprawnionyUser

                    
                    db.SubmitChanges();

                    //EditSuccessful.Text = "Wyedytowano pomyślnie";
                    //EditSuccessful.Visible = true;

                    Session["JestJuz17iMiSieNieChce"] = true;
                    
                    Response.Redirect("../Admin/EditProblem.aspx");
                }
            //}
            //catch (System.Data.SqlClient.SqlException ex)
            //{
            //    EditSuccessful.Text = "Brak połączenia z bazą.";
            //    EditSuccessful.Visible = true;
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