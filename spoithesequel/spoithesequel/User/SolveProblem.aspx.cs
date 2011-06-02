using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace spoithesequel.User
{
    public partial class SolveProblem : System.Web.UI.Page
    {
        public string KodProblemu;

        protected void Page_Load(object sender, EventArgs e)
        {
            KodProblemu = Request.QueryString["KodProblemu"];

            if (!Page.IsPostBack)
            {
                MultiView1.ActiveViewIndex = 0;
            }
            var db = new DataBase.DataClasses1DataContext();

            //wypisanie języków
            var query2 = from n in db.Languages select n.Name;

            foreach (var jezyk in query2)
            {
                Languages.Items.Add(jezyk);
            }
            ///////////////////

            if (KodProblemu != null)
            {
                var query1 = from n in db.Problems where n.ProblemsCode == KodProblemu select n;
                DataBase.Problem ExistingProblem = query1.First();

                ProblemsCode.Text = ExistingProblem.ProblemsCode;
            }
            
        }

        public string CSVinputs;
        public string CSVoutputs;

        protected void AsyncFileUpload_UploadedComplete(object sender, AjaxControlToolkit.AsyncFileUploadEventArgs e)
        {
            if (AsyncFileUpload.HasFile)
            {
                string fileName = Path.GetFileName(AsyncFileUpload.PostedFile.FileName);
                string strPath = Server.MapPath("~/CSVFiles/" + fileName);

                    
                AsyncFileUpload.SaveAs(strPath);
                //AddInputs(strPath);
                //DeleteTempFile(strPath);
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

        protected void Send_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }
    }
}