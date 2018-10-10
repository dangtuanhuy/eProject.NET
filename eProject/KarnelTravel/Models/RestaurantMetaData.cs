using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
namespace KarnelTravel.Models
{
    [MetadataType(typeof(Restaurant.RestaurantMetaData))]
    public partial class Restaurant
    {
        internal sealed class RestaurantMetaData
        {
            [Display(Name ="Code")]
            public string Restaurant_Code { get; set; }

            [Display(Name = "Name")]
            public string Restaurant_Name { get; set; }

            [Display(Name = "Address")]
            [DataType(DataType.MultilineText)]
            public string Restaurant_Address { get; set; }

            [Display(Name = "Status")]
            public Nullable<bool> Restaurant_Status { get; set; }

            [Display(Name = "Description")]
            [DataType(DataType.MultilineText)]
            public string Restaurant_Description { get; set; }

           
            public string TouristSpot_Id { get; set; }
        }
    }
}