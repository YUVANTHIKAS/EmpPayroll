using PayrollService;
using System;
using System.Net;
using System.Numerics;
using System.Reflection;

namespace EmployeeManagement
{
    class Program
    {
        static void Main(string[] args)
        {
            //Payroll employee = new Payroll()
            //{
            //    Name = "yuvanthika",
            //    Salary = 20000,
            //    Start_Date = "04-05-2023",
            //    Gender = 'F',
            //    Phone = "123456888880",
            //    Address = "TamilNadu",
            //    Department = "IT",
            //    Basic_pay = 10090,
            //    Deductions = 500,
            //    Taxable_pay = 100,
            //    Income_tax = 106,
            //    Net_pay = 1000
            //};
            Operations operations = new Operations();
            //operations.AddEmployee_payroll(employee);
            //operations.DeleteEmployee_payroll(14);
            //operations.GetAllEmployee_payroll();
            //Payroll employee1 = new Payroll()
            //{
            //    Id = 13,
            //    Name = "yuvanthika",
            //    Salary = 25000,
            //    Start_Date = "04-05-2023",
            //    Gender = 'F',
            //    Phone = "12348888890",
            //    Address = "TamilNadu",
            //    Department = "IT",
            //    Basic_pay = 10090,
            //    Deductions = 500,
            //    Taxable_pay = 100,
            //    Income_tax = 200,
            //    Net_pay = 1090
            //};
            //operations.UpdateEmployee_payroll(employee1);
            //operations.ParticularRange("2023-01-01");
            //operations.Calculations();
            List<Payroll> list = new List<Payroll>();
            list.Add(new Payroll()
            {
                Name = "yuvan",
                Salary = 50000,
                Start_Date = "01-05-2002",
                Gender = 'M',
                Phone = "1239567890",
                Address = "andhra",
                Department = "Finance",
                Basic_pay = 20000,
                Deductions = 500,
                Taxable_pay = 100,
                Income_tax = 1000,
                Net_pay = 45000
            });
            list.Add(new Payroll()
            {
                Name = "malini",
                Salary = 90000,
                Start_Date = "09-06-2014",
                Gender = 'F',
                Phone = "1238887890",
                Address = "Poomagal road",
                Department = "Engineering",
                Basic_pay = 10000,
                Deductions = 500,
                Taxable_pay = 100,
                Income_tax = 1000,
                Net_pay = 35000
            });
            operations.UsingWithThread(list);
            operations.UsingWithoutThread(list);
        }
    }
}
        