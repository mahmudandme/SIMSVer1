using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SIMS.DAL.Admin;
using SIMS.Models;

namespace SIMS.BLL.Admin
{
    public class AddStudentBLL
    {
       AddStudentDAL addStudentDal = new AddStudentDAL();

        public List<GenderModel> GetAllGender()
        {
            return addStudentDal.GetAllGender();
        }

        public List<YearTermModel> GetAllYearTerm()
        {
            return addStudentDal.GetAllYearTerm();
        }

        public List<DepartmentModel> GetAllDepartment()
        {
            return addStudentDal.GetAllDepartMent();
        }

        public List<SessionMedel> GetAllSession()
        {
            return addStudentDal.GetAllSession();
        }
        public bool IsStudenrExist(AddStudentModel addStudentModel)
        {
            return addStudentDal.IsStudentIdAndDeptIdExist(addStudentModel);
        }
        public int SaveNewStudentInformation(AddStudentModel addStudentModel)
        {
            return addStudentDal.SaveStudentInformation(addStudentModel);
        }

    }
}