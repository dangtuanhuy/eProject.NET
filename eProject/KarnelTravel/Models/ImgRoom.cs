//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace KarnelTravel.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class ImgRoom
    {
        public int Img_Rooms_Id { get; set; }
        public string Img_Rooms { get; set; }
        public byte Img_Rooms_Sort { get; set; }
        public string Room_Id { get; set; }
    
        public virtual Room Room { get; set; }
    }
}