using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SIMS.BLL.Admin;
using SIMS.Models;

namespace SIMS.UI.Admin
{
    public partial class AddStudent : System.Web.UI.Page
    {
        AddNationalityBLL addNationalityBll = new AddNationalityBLL();
        AddStudentBLL addStudentBll = new AddStudentBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetAllNationalityInDropDownList();
                ListItem listItemNationality = new ListItem("Select nationality","-1");
                nationalityDropDownList.Items.Insert(0, listItemNationality);

                GetAllDepartmentInDropDownList();
                ListItem listItemDepartment = new ListItem("Select Department", "-1");
                departmentDropDownList.Items.Insert(0, listItemDepartment);

                GetAllGenderInDropDownList();
                ListItem listItemGender = new ListItem("Select gender", "-1");
                genderDropDownList.Items.Insert(0, listItemGender);

                GetAllYearTermInDropDownList();
                ListItem listItemYearTerm = new ListItem("Select year-term", "-1");
                yearTermDropDownList.Items.Insert(0, listItemYearTerm);

                GetAllSessionInDropDownList();
                ListItem listItemSession = new ListItem("Select session", "-1");
                sessionDropDownList.Items.Insert(0, listItemSession);

            }
        }

        private void GetAllNationalityInDropDownList()
        {
            nationalityDropDownList.DataSource = addNationalityBll.GetAllNationality();
            nationalityDropDownList.DataTextField = "Name";
            nationalityDropDownList.DataValueField = "ID";
            nationalityDropDownList.DataBind();
        }

        private void GetAllGenderInDropDownList()
        {
            genderDropDownList.DataSource = addStudentBll.GetAllGender();
            genderDropDownList.DataTextField = "Gender";
            genderDropDownList.DataValueField = "ID";
            genderDropDownList.DataBind();
        }
        private void GetAllDepartmentInDropDownList()
        {
            departmentDropDownList.DataSource = addStudentBll.GetAllDepartment();
            departmentDropDownList.DataTextField = "DepartmentName";
            departmentDropDownList.DataValueField = "DeptID";
            departmentDropDownList.DataBind();
        }
        private void GetAllYearTermInDropDownList()
        {
            yearTermDropDownList.DataSource = addStudentBll.GetAllYearTerm();
            yearTermDropDownList.DataTextField = "YearTerm";
            yearTermDropDownList.DataValueField = "ID";
            yearTermDropDownList.DataBind();
        }
        private void GetAllSessionInDropDownList()
        {
            sessionDropDownList.DataSource = addStudentBll.GetAllSession();
            sessionDropDownList.DataTextField = "SessionValue";
            sessionDropDownList.DataValueField = "ID";
            sessionDropDownList.DataBind();
        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            AddStudentModel addStudentModel = new AddStudentModel();
            addStudentModel.StudentId = studentIdTextBox.Text;
            addStudentModel.Name = studentNameTextBox.Text;
            addStudentModel.Phone = phoneNumberTextBox.Text;
            addStudentModel.Email = emailTextBox.Text;
            addStudentModel.PresentAddress = presentAddressTextBox.Text;
            addStudentModel.PermanentAddress = permanentAddressTextBox.Text;
            addStudentModel.GenderId = Convert.ToInt32(genderDropDownList.SelectedValue);
            addStudentModel.NationalityId = Convert.ToInt32(nationalityDropDownList.SelectedValue);
            addStudentModel.DeptId = Convert.ToInt32(departmentDropDownList.SelectedValue);
            addStudentModel.YearTermId = Convert.ToInt32(yearTermDropDownList.SelectedValue);
            addStudentModel.SessionId = Convert.ToInt32(sessionDropDownList.SelectedValue);

        }
    }
}