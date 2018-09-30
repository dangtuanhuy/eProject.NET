using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
namespace KarnelTravel.Models
{
    [MetadataType(typeof(Food.FoodMetaData))]
    public partial class Food
    {
       
        internal sealed class FoodMetaData
        {
            [Display(Name ="Code")]
            [Required]
            public string Food_Code { get; set; }

            [Required]
            [Display(Name = "Food Name")]
            public string Food_Name { get; set; }

            [Display(Name = "Price")]
            [Required]
            [DataType(DataType.Currency)]
            public Nullable<decimal> Food_Price { get; set; }

            [Display(Name = "Spectific")]
            [Required]
            [DataType(DataType.MultilineText)]
            public string Food_Specific { get; set; }


        }

    }
  
}