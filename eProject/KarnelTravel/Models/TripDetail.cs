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
    
    public partial class TripDetail
    {
        public int Trip_Id { get; set; }
        public string TouristSpot_Id { get; set; }
        public Nullable<int> Trip_Quantity { get; set; }
        public Nullable<decimal> OrginalPrice { get; set; }
    
        public virtual TouristSpot TouristSpot { get; set; }
        public virtual Trip Trip { get; set; }
    }
}
