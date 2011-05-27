using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace spoithesequel
{
    public partial class AddStudentAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //TODO: uwierzytelenienie usera
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
                    AddStudents(strPath);
                    DeleteTempFile(strPath);
                }
                else
                {
                    UploadFileInfoLabel.Visible = true;
                }
            }

        }

        private void AddStudents(string filePath)
        {
            StreamReader reader = new StreamReader(filePath);
            try
            {
                while (!reader.EndOfStream)
                {
                    string[] line = reader.ReadLine().Split(';');
                    Membership.CreateUser(line[0], line[1], line[2]);
                }
            }
            catch {}
            
            finally
            {
                reader.Close();
            }
            
            
        }

        private void DeleteTempFile(string filePath)
        {
            if(File.Exists(filePath))
                File.Delete(filePath);
        }
            
    }
}