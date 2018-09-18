using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
namespace Karnel_Travels.Models
{
   [MetadataTypeAttribute(typeof(Trip.TripMetaData))]
    public partial class Trip
    {
        internal sealed class TripMetaData
        {
            [Display(Name ="ID")]
            public string Trip_Id { get; set; }
            [Display(Name = "Name")]
            public string Trip_Name { get; set; }
            [Display(Name = "Details")]
            public string Trip_Details { get; set; }
        }
    }
}