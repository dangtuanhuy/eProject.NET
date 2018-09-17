using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
namespace Karnel_Travels.Models
{
    [MetadataTypeAttribute(typeof(About.AboutMetaData))]

    public partial class About
    {
        internal sealed class AboutMetaData
        {
            [Display(Name ="ID")]
            public int AboutId { get; set; }

            [Display(Name = "Full Name")]
            public string AboutName { get; set; }

            [Display(Name = "Birthday")]
            [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:dd/MM/yyyy}")]
            [DataType(DataType.Date)]
            public Nullable<System.DateTime> AboutBirth { get; set; }

            [Display(Name = "Gender")]
            public Nullable<bool> AboutGender { get; set; }

            [Display(Name = "Programming")]
            [DataType(DataType.MultilineText)]
            public string AboutLike { get; set; }

            [Display(Name = "Img")]
            public string AboutImg { get; set; }
        }
    }
}