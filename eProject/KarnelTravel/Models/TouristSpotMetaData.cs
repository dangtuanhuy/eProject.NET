using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace KarnelTravel.Models
{
    [MetadataType(typeof(TouristSpot.TouristSpotMetaData))]
    public partial class TouristSpot
    {
        public class TouristSpotMetaData
        {
            [Required]
            [DisplayName("TouristSpot Id")]
            public string TouristSpot_Id { get; set; }
            [Required]
            [DisplayName("TouristSpot Name")]
            public string TouristSpot_Name { get; set; }
            [Required]
            [DisplayName("TouristSpot Limit")]
            public Nullable<int> TouristSpot_Limit { get; set; }
            [Required]
            [DisplayName("TouristSpot Price")]
            [DataType(DataType.Currency)]
            public Nullable<decimal> TouristSpot_Price { get; set; }
            [Required]
            [DisplayName("TouristSpot Specific")]
            public string TouristSpot_Specific { get; set; }
            [Required]
            [DisplayName("TouristSpot Status")]
            public Nullable<bool> TouristSpot_Status { get; set; }
            [Required]
            [DisplayName("Location Id")]
            public string Location_Id { get; set; }
        }
    }
}