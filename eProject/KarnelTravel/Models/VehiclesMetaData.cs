using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace KarnelTravel.Models
{
    [MetadataType(typeof(Vehicle.VehiclesMetaData))]
    public partial class Vehicle
    {
        internal sealed class VehiclesMetaData
        {
            [Required]
            [DisplayName("Vehecle ID")]
            public string Vehicle_Id { get; set; }

            [Required]
            [DisplayName("Vehecle Name")]
            public string Vehicle_Name { get; set; }
            [Required]
            [DisplayName("Vehecle Price")]
            [DataType(DataType.Currency)]
            public Nullable<decimal> Vehicle_Price { get; set; }
            [Required]
            [DisplayName("Vehecle Weight")]
            public Nullable<int> Vehicle_Weight { get; set; }

            
            [DisplayName("Vehecle IMG")]
            public string Vehicle_Img { get; set; }
            [Required]
            [DisplayName("Transportation ID")]
            public string Transportation_Id { get; set; }
        } 
    }
}