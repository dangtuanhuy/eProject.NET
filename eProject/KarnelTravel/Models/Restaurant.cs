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
    
    public partial class Restaurant
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Restaurant()
        {
            this.Foods = new HashSet<Food>();
            this.ImgRestaurants = new HashSet<ImgRestaurant>();
        }
    
        public string Restaurant_Code { get; set; }
        public string Restaurant_Name { get; set; }
        public string Restaurant_Address { get; set; }
        public Nullable<bool> Restaurant_Status { get; set; }
        public string Restaurant_Description { get; set; }
        public string TouristSpot_Id { get; set; }
        public Nullable<System.DateTime> Restaurant_Create { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Food> Foods { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ImgRestaurant> ImgRestaurants { get; set; }
        public virtual TouristSpot TouristSpot { get; set; }
    }
}
