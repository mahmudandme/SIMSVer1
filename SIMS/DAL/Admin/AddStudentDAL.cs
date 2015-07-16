using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using SIMS.Models;

namespace SIMS.DAL.Admin
{
    public class AddStudentDAL
    {        
        public List<GenderModel> GetAllGender()
        {
            List<GenderModel> genderModels = new List<GenderModel>();
            string query = String.Format("spGetAllGender");

            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings[1].ConnectionString))
            {
                using (SqlCommand command = new SqlCommand(query,connection))
                {                    
                    connection.Open();
                    SqlDataReader rdr = command.ExecuteReader();
                    while (rdr.Read())
                    {
                        GenderModel genderModel = new GenderModel();
                        genderModel.ID = Convert.ToInt32(rdr[0]);
                        genderModel.Gender = rdr[1].ToString();
                        genderModels.Add(genderModel);
                    }
                    connection.Close(); 
                }
                

            }
            return genderModels;
        }
        public List<YearTermModel> GetAllYearTerm()
        {
            List<YearTermModel> yearTermModels = new List<YearTermModel>();
            string query = String.Format("spGetAllYearTerm");

            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings[1].ConnectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    SqlDataReader rdr = command.ExecuteReader();
                    while (rdr.Read())
                    {
                        YearTermModel yearTermModel = new YearTermModel();
                        yearTermModel.ID = Convert.ToInt32(rdr[0]);
                        yearTermModel.YearTerm = rdr[1].ToString();
                        yearTermModels.Add(yearTermModel);
                    }
                    connection.Close();
                }
            }
            return yearTermModels;
        }

        public List<DepartmentModel> GetAllDepartMent()
        {
            List<DepartmentModel> departmentModels = new List<DepartmentModel>();
            string query = String.Format("spGetAllDepartment");

            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings[1].ConnectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    SqlDataReader rdr = command.ExecuteReader();
                    while (rdr.Read())
                    {
                        DepartmentModel departmentModel = new DepartmentModel();
                        departmentModel.DeptID = Convert.ToInt32(rdr[0]);
                        departmentModel.DepartmentName = rdr[1].ToString();
                        departmentModels.Add(departmentModel);
                    }
                    connection.Close();
                }
            }
            return departmentModels;
        }

        public List<SessionMedel> GetAllSession()
        {
            List<SessionMedel> sessionMedels = new List<SessionMedel>();
            string query = String.Format("spGetAllSession");

            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings[1].ConnectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    SqlDataReader rdr = command.ExecuteReader();
                    while (rdr.Read())
                    {
                        SessionMedel sessionMedel = new SessionMedel();
                        sessionMedel.ID = Convert.ToInt32(rdr[0]);
                        sessionMedel.SessionValue = rdr[1].ToString();
                        sessionMedels.Add(sessionMedel);
                    }
                    connection.Close();
                }
            }
            return sessionMedels;
        }

        public bool IsStudentIdAndDeptIdExist(AddStudentModel addStudentModel)
        {
            bool isStudentIdAndDeptIdExist = false;
            string query = String.Format("spGetStudentByIdAndDeptId");

            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings[1].ConnectionString))
            {
                using (SqlCommand command = new SqlCommand(query,connection))
                {
                    command.CommandType = CommandType.StoredProcedure;                    
                    command.Parameters.AddWithValue("@studentId", addStudentModel.StudentId);
                    command.Parameters.AddWithValue("@departmentId", addStudentModel.DeptId);
                    connection.Open();
                    SqlDataReader rdr = command.ExecuteReader();
                    while (rdr.Read())
                    {
                        isStudentIdAndDeptIdExist = true;
                    }
                    command.Parameters.Clear();
                    connection.Close();
                    
                }
            }
            return isStudentIdAndDeptIdExist;
        }

        public int SaveStudentInformation(AddStudentModel addStudentModel)
        {
            int rowsInserted = 0;
            string query = String.Format("spSaveNewStudentInformation");

            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings[1].ConnectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@studentId",addStudentModel.StudentId);
                    command.Parameters.AddWithValue("@studentName", addStudentModel.Name);
                    command.Parameters.AddWithValue("@phone", addStudentModel.Phone);
                    command.Parameters.AddWithValue("@email", addStudentModel.Email);
                    command.Parameters.AddWithValue("@presentAddress", addStudentModel.PresentAddress);
                    command.Parameters.AddWithValue("@permanentAddress", addStudentModel.PermanentAddress);
                    command.Parameters.AddWithValue("@genderId", addStudentModel.GenderId);
                    command.Parameters.AddWithValue("@nationalityId", addStudentModel.NationalityId);
                    command.Parameters.AddWithValue("@departmentId", addStudentModel.DeptId);
                    command.Parameters.AddWithValue("@sessionId", addStudentModel.SessionId);
                    command.Parameters.AddWithValue("@yearTermId", addStudentModel.YearTermId);
                    command.Parameters.AddWithValue("@code", addStudentModel.Code);
                    command.Parameters.AddWithValue("@password", addStudentModel.Password);

                    connection.Open();
                    rowsInserted = command.ExecuteNonQuery();                   
                    connection.Close();
                    command.Parameters.Clear();
                }
            }
            return rowsInserted;
        }

         
    }
}