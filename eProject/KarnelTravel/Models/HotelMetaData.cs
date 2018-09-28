using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace KarnelTravel.Models
{
    [MetadataType(typeof(Hotel.HotelMetaData))]
    public partial class Hotel
    {
        internal sealed class HotelMetaData
        {
            [DisplayName("Hotel ID")]
            [Required]

            public string Hotel_Id { get; set; }

            [DisplayName("Hotel Name")]
            [Required]
            public string Hotel_Name { get; set; }

            [DisplayName("Hotel Address")]
            [Required]
            [DataType(DataType.MultilineText)]
            public string Hotel_Address { get; set; }

            [DisplayName("Hotel Details")]
            [Required]
            public string Hotel_Details { get; set; }

            [DisplayName("TouristSpot ID")]
            [Required]
            public string TouristSpot_Id { get; set; }
        }
    } 
}