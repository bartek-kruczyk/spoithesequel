using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace spoithesequel.Admin
{
    public partial class EditProblemTemp : System.Web.UI.Page
    {
        public string KodProblemu;
        public string CSVinputs;
        public string CSVoutputs;

        protected void Page_Load(object sender, EventArgs e)
        {
                KodProblemu = Request.QueryString["KodProblemu"];

                if (!Page.IsPostBack)
                {
                    MultiView1.ActiveViewIndex = 0;

                    var db = new DataBase.DataClasses1DataContext();

                    // wypisanie grup ////////////////////////////////////////////////////////////////
                    var query1 = from n in db.Groups select n.Name;

                    foreach (var grupa in query1)
                    {
                        Groups.Items.Add(grupa);
                    }
                    //////////////////////////////////////////////////////////////////////////////////

                    //Groups.Items.Add("grupa 1");

                    //wypisanie języków //////////////////////////////////////////////////////////////
                    var query2 = from n in db.Languages select n.Name;

                    foreach (var jezyk in query2)
                    {
                        Languages.Items.Add(jezyk);
                    }
                    //////////////////////////////////////////////////////////////////////////////////

                    InOut.Rows[0].Cells[0].Text = "nr";
                    InOut.Rows[0].Cells[1].Text = "wejście";
                    InOut.Rows[0].Cells[2].Text = "wyjście";

                    for (int i = 1; i < InOut.Rows.Count; i++)
                    {
                        InOut.Rows[i].Cells[0].Text = Convert.ToString(i);
                    }

                    //dodawanie zadania /////////////////////////////////////////////////////////////////

                    if (KodProblemu == null)
                    {
                        FormType.Text = "Dodaj problem";
                        EditProblemX.Text = "Dodaj problem";
                        ObecnePary1.Visible = false;
                        GetCSVPairs.Visible = false;
                    }

                    //edycja istniejacego //////////////////////////////////////////////////////////////

                    else
                    {

                        var query = from n in db.Problems where n.ProblemsCode == KodProblemu select n;
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
                        ProblemsTitle.Text = ExistingProblem.Title;
                        ProblemsCode.Text = ExistingProblem.ProblemsCode;

                        string[] inputs = ExistingProblem.Input.Split(';');
                        string[] outputs = ExistingProblem.Output.Split(';');

                        if (inputs.Length <= 20)
                        {
                            for (int i = 1; i < inputs.Length; i++)
                            {
                                InOut.Rows[i].Cells[0].Text = Convert.ToString(i);

                                TextBox Input = (TextBox)InOut.Rows[i].Cells[1].Controls[0];
                                Input.Text = inputs[i - 1];

                                InOut.Rows[i].Cells[1].Controls.Clear();
                                InOut.Rows[i].Cells[1].Controls.Add(Input);


                                TextBox Output = (TextBox)InOut.Rows[i].Cells[2].Controls[0];
                                Output.Text = outputs[i - 1];

                                InOut.Rows[i].Cells[2].Controls.Clear();
                                InOut.Rows[i].Cells[2].Controls.Add(Output);

                                InOut.Rows[i].Visible = true;
                            }

                            if (inputs.Length == 20)
                            {
                                AddNextInOut.Visible = false;
                            }

                            //for (int i = inputs.Length; i < inputs.Length + (5 - inputs.Length); i++)
                            //{
                            //    InOut.Rows[i].v
                            //}
                        }
                        else
                        {
                            ObecnePary0.Text = "To zadanie posiada więcej niż 20 par wejścia-wyjścia. Zaimportuj plik z danymi w formacie *.csv (nr_pary;wejście;wyjście) aby je nadpisać.";
                            InOut.Visible = false;
                        }
                    }
                }
        }

        protected void EditProblemX_Click(object sender, EventArgs e)
        {
            // dodawanie nowego zadania /////////////////////////////////////////////////////////////////
            if (KodProblemu == null)
            {
                if (Page.IsValid)
                {
                    string inputs = "";
                    string outputs = "";

                    if (CSVinputs != null && CSVoutputs != null)
                    {
                        inputs = CSVinputs;
                        outputs = CSVoutputs;
                    }
                    else
                    {
                        for (int i = 1; i < InOut.Rows.Count; i++)
                        {
                            TextBox Input = (TextBox)InOut.Rows[i].Cells[1].Controls[0];
                            TextBox Output = (TextBox)InOut.Rows[i].Cells[2].Controls[0];
                            
                            if ((Input.Text == "" && Output.Text != "") || (Input.Text != "" && Output.Text == ""))
                            {
                                EditSuccessful.Text = "Niektóre z twoich par wej-wyj są niekompletne!";
                                EditSuccessful.Visible = true;
                                return;
                            }
                            else if (Input.Text == "" && Output.Text == "")
                            {
                                continue;
                            }

                            inputs += Input.Text + ";";
                            outputs += Output.Text + ";";
                        }
                    }

                    if (inputs == "")
                    {
                        EditSuccessful.Text = "Nie podałeś sekwencji wyjściowych!";
                        EditSuccessful.Visible = true;
                        return;
                    }
                    else if (outputs == "")
                    {
                        EditSuccessful.Text = "Nie podałeś sekwencji wejściowych!";
                        EditSuccessful.Visible = true;
                        return;
                    }

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
                        EditSuccessful.Text = "Wybierz przynajmniej jeden dozwolony język programowania";
                        EditSuccessful.Visible = true;
                        return;
                    }

                    NewProblem.Input = inputs;
                    NewProblem.Output = outputs;

                    NewProblem.Languages = languages;

                    NewProblem.TimeLimit = int.Parse(TimeLimit.Text);
                    NewProblem.SizeLimit = int.Parse(SizeLimit.Text);

                    NewProblem.OpeningDate = Convert.ToDateTime(OpeningDate.Text + " " + Convert.ToString(OpeningTime.Date.TimeOfDay));
                    NewProblem.ClosingDate = Convert.ToDateTime(ClosingDate.Text + " " + Convert.ToString(ClosingTime.Date.TimeOfDay));

                    NewProblem.AddingDate = DateTime.Now;
                    NewProblem.AddedBy = "Admin";

                    NewProblem.Groups = groups;

                    db.Problems.InsertOnSubmit(NewProblem);
                    db.SubmitChanges();
                }
            }

            // edycja istniejącego zadania /////////////////////////////////////////////////////////////////////////
            else
            {
                if (Page.IsValid)
                {
                    string newInput = "";
                    string newOutput = "";

                    if (CSVinputs != null && CSVoutputs != null)
                    {
                        newInput = CSVinputs;
                        newOutput = CSVoutputs;
                    }
                    else
                    {
                        for (int i = 1; i < InOut.Rows.Count; i++)
                        {
                            TextBox Input = (TextBox)InOut.Rows[i].Cells[1].Controls[0];
                            TextBox Output = (TextBox)InOut.Rows[i].Cells[2].Controls[0];

                            if ((Input.Text == "" && Output.Text != "") || (Input.Text != "" && Output.Text == ""))
                            {
                                EditSuccessful.Text = "Niektóre z twoich par wej-wyj są niekompletne!";
                                EditSuccessful.Visible = true;
                                return;
                            }
                            else if (Input.Text == "" && Output.Text == "")
                            {
                                continue;
                            }

                            newInput += Input.Text + ";";
                            newOutput += Output.Text + ";";
                        }
                    }

                    if (newOutput == "")
                    {
                        EditSuccessful.Text = "Nie podałeś sekwencji wyjściowych!";
                        EditSuccessful.Visible = true;
                        return;
                    }
                    else if (newInput == "")
                    {
                        EditSuccessful.Text = "Nie podałeś sekwencji wejściowych!";
                        EditSuccessful.Visible = true;
                        return;
                    }

                    var db = new DataBase.DataClasses1DataContext();

                    var query = from n in db.Problems where n.ProblemsCode == KodProblemu select n;

                    var ExistingProblem = query.First();

                    ExistingProblem.Title = ProblemsTitle.Text;
                    ExistingProblem.ProblemsCode = ProblemsCode.Text;
                    ExistingProblem.Description = Editor.Content;
                    ExistingProblem.DifficultyLevel = DifficultyLevel.SelectedItem.Text;

                    ExistingProblem.Input = newInput;
                    ExistingProblem.Output = newOutput;

                    //pobranie dozwolonych języków programowania z kontrolki CheckBoxList do
                    //stringu languages
                    string languages = "";

                    for (int i = 0; i < Languages.Items.Count; i++)
                    {
                        if (Languages.Items[i].Selected == true)
                        {
                            languages += Languages.Items[i].Text + ";";
                        }
                    }


                    //sprawdzenie czy został wybrany jakikolwiek język programowania
                    if (languages == "")
                    {
                        EditSuccessful.Text = "Wybierz przynajmniej jeden dozwolony język programowania";
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

                    ExistingProblem.TimeLimit = int.Parse(TimeLimit.Text);
                    ExistingProblem.SizeLimit = int.Parse(SizeLimit.Text);

                    ExistingProblem.OpeningDate = Convert.ToDateTime(OpeningDate.Text + " " + Convert.ToString(OpeningTime.Date.TimeOfDay));
                    ExistingProblem.ClosingDate = Convert.ToDateTime(ClosingDate.Text + " " + Convert.ToString(ClosingTime.Date.TimeOfDay));

                    ExistingProblem.AddingDate = DateTime.Now;
                    ExistingProblem.AddedBy = "Admin";
                    db.SubmitChanges();
                }
            }

            MultiView1.ActiveViewIndex = 1;
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

        protected void AddNextInOut_Click(object sender, EventArgs e)
        {
            int count = 0;
            while (InOut.Rows[count].Visible == true)
            {
                count++;
            }
            
            InOut.Rows[count].Visible = true;

            if (count == InOut.Rows.Count-1)
            {
                AddNextInOut.Visible = false;
            }
        }

        protected void GetCSVPairs_Click(object sender, EventArgs e)
        {

        }
        
    }
}