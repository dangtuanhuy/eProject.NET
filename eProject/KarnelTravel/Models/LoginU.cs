using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace KarnelTravel.Models
{
    public class LoginU
    {
        [Required(ErrorMessage = "Username can not null")]
        public string Customer_Id { get; set; }
        [Required(ErrorMessage = "Password can not null")]
        public string Customer_Password { get; set; }
    }
}