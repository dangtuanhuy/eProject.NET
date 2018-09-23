using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
namespace KarnelTravel.Areas.Management.Models
{
    public class LoginModel
    {
        [Required(ErrorMessage ="Username can not null")]
        public string Username { get; set; }
        [Required(ErrorMessage = "Password can not null")]
        public string Password { get; set; }
    }
}