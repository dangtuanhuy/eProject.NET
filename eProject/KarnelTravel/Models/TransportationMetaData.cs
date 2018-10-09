using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace KarnelTravel.Models
{
    [MetadataType(typeof(Transportation.TransportationMetaData))]
public partial class Transportation
    {
        internal sealed class TransportationMetaData
        {
            [Required]
            [DisplayName("Transportation Id")]
            public string Transportation_Id { get; set; }
            [Required]
            [DisplayName("Transportation Name")]
            public string Transportation_Name { get; set; }
            [Required]
            [DisplayName("Transportation Details")]
            [DataType(DataType.MultilineText)]
            public string Transportation_Details { get; set; }
           
            [DisplayName("Transportation IMG")]
            public string Transportation_Img { get; set; }
            [Required]
            [DisplayName("TouristSpot Id")]
            public string TouristSpot_Id { get; set; }
        }
    }
}