//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Karnel_Travels.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class ImgRestaurant
    {
        public int Img_Restaurants_Id { get; set; }
        public string Img_Restaurants { get; set; }
        public byte Img_Restaurants_Sort { get; set; }
        public string Restaurant_Code { get; set; }
    
        public virtual Restaurant Restaurant { get; set; }
    }
}
