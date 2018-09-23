using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace KarnelTravel.Models
{
    public class Encrypt
    {
        public static string MD5_Encode(string strSoure)
        {
            MD5 md5 = MD5.Create();
            byte[] data = md5.ComputeHash(Encoding.Default.GetBytes(strSoure));
            //Create Obj builder
            StringBuilder strBuilder = new StringBuilder();
            //check database
            for (int i = 0; i < data.Length; i++)
            {
                //exchange byte to hex
                strBuilder.Append(data[i].ToString("x2"));
            }
            return strBuilder.ToString();
        }
        public static bool MD5_Verify(string strSoure, string hashSoure)
        {
            string hashTemp = MD5_Encode(strSoure);
            //compare
            if (String.Compare(hashTemp, hashSoure, true) == 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        internal static void MD5_Encode()
        {
            throw new NotImplementedException();
        }
    }
}