using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
namespace KarnelTravel.Models
{
    [MetadataType(typeof(Feedback.FeedBackMetaData))]
    public partial class Feedback

    {
        internal sealed class FeedBackMetaData
        {
            public int FeedbackId { get; set; }

            [Required(ErrorMessage ="Can not null")]
            public string SenderName { get; set; }

            [Required(ErrorMessage = "Can not null")]
            [DataType(DataType.EmailAddress,ErrorMessage ="Email Erro")]
            public string SenderMail { get; set; }

            [Required(ErrorMessage = "Can not null")]
            public string FeedBackTitle { get; set; }

            [Required(ErrorMessage = "Can not null")]
            [DataType(DataType.MultilineText)]
            public string FeedBackContent { get; set; }
        }
    }
}