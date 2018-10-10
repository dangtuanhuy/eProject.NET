using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace KarnelTravel.Models
{
    [MetadataType(typeof(Customer.CustomerMetaData))]
    public partial class Customer
    {
        internal sealed class CustomerMetaData
        {
            [Display(Name = "Username")]
            [Required(ErrorMessage ="Username can not null")]
            [Remote("CheckCustomer", controller: "Register",ErrorMessage ="Username is Exits")]
            public string Customer_Id { get; set; }

            [Display(Name = "Password")]
            [Required(ErrorMessage = "Password can not null")]
            [DataType(DataType.Password)]
            public string Customer_Password { get; set; }

            [Display(Name = "Last Name")]
            [Required(ErrorMessage = "First Name can not null")]
            public string Customer_LastName { get; set; }

            [Display(Name = "First Name")]
            [Required(ErrorMessage = "Last Name can not null")]
            public string Customer_FirstName { get; set; }

            [Display(Name = "Birthday")]
            [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}", ApplyFormatInEditMode = true)]
            [DataType(DataType.DateTime, ErrorMessage = "Input data must be a date type")]
          
            public Nullable<System.DateTime> Customer_Bithday { get; set; }

            [Display(Name = "Gender")]
            [Required(ErrorMessage = "Gender can not null")]
            public Nullable<bool> Customer_Gender { get; set; }

            [Display(Name = "Phone")]
            [Required(ErrorMessage = "Phone can not null")]
            public string Customer_Phone { get; set; }


            [Display(Name = "Address")]
            [Required(ErrorMessage = "Address can not null")]
            [DataType(DataType.MultilineText)]
            public string Customer_Address { get; set; }

            [Display(Name ="Email")]
            [Required(ErrorMessage = "Email can not null")]
            [DataType(DataType.EmailAddress,ErrorMessage = "Email Invalidate")]
            public string Customer_Email { get; set; }

            [Display(Name = "Passport")]
            [Required(ErrorMessage = "Passport can not null")]
          
            public string Customer_Possport { get; set; }
        }
    }

}