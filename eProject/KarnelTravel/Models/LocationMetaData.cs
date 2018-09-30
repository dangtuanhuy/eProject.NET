using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace KarnelTravel.Models
{
    [MetadataType(typeof(Location.LocationMetaData))]
    public partial class Location
    {
        internal sealed class LocationMetaData
        {
            [Required]
            [DisplayName("Location ID")]
            [Remote("CheckUserName", controller: "Users", ErrorMessage = "Tên đăng nhập đã tồn tại")]
            public string Location_Id { get; set; }
            [Required]
            [DisplayName("Location Name")]
            public string Location_Name { get; set; }
            [Required]
            [DisplayName("Location Location")]
            public string Location_Location { get; set; }
        }
    }
}