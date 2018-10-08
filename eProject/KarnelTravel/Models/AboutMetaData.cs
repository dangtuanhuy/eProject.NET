using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
namespace KarnelTravel.Models
{
    [MetadataType(typeof(About.AboutMetaData))]
    public partial class About
    {
        internal sealed class AboutMetaData
        {
            public int AboutId { get; set; }

            [Display(Name ="Name")]
            [Required(ErrorMessage ="Name can not null")]
            public string AboutName { get; set; }

            [Display(Name = "Birth")]
            [Required(ErrorMessage = "Birthday can not null")]
            [DataType(DataType.Date,ErrorMessage = "Input data must be a date type")]
            public Nullable<System.DateTime> AboutBirth { get; set; }

            [Display(Name ="Status")]
            public Nullable<bool> AboutGender { get; set; }

            [Display(Name = "Hoppy")]
            public string AboutLike { get; set; }
            public string AboutImg { get; set; }
        }
    }
}