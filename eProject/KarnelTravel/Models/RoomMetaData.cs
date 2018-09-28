using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace KarnelTravel.Models
{
    [MetadataType(typeof(Room.RoomMetaData))]
    public partial class Room
    {
        internal sealed class RoomMetaData
        {
            [DisplayName("Room ID")]
            [Required]
            public string Room_Id { get; set; }

            [Required]
            [DisplayName("Room Type")]
            public string Room_Type { get; set; }

            [Required]
            [DisplayName("Room Name")]
            public string Room_Name { get; set; }

            [Required]
            [DisplayName("Room Start")]
            public Nullable<System.TimeSpan> Room_Start { get; set; }

            [Required]
            [DisplayName("Room Stop")]
            public Nullable<System.TimeSpan> Room_Stop { get; set; }

            [Required]
            [DisplayName("Room Cost")]
            [DataType(DataType.Currency) ]
            public Nullable<decimal> Room_Cost { get; set; }

            [Required]
            [DisplayName("Hotel ID")]
            public string Hotel_Id { get; set; }
        }
    }
}