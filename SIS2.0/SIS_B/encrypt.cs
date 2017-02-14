using System;
using System.Diagnostics;
using System.Globalization;
using System.IO;
using System.Security.Cryptography;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIS_B
{
    public static class encrypt
    {
        /// <summary>
        /// The private key is the salt
        /// </summary>
        private static string _privateKey = "P@$$w0rdL3tm3|nC0M3|ng0Iny@nk33&"; // using AES Cryptography
        /// <summary>
        /// The IV or the password key
        /// </summary>
        private static string _passwordKey = "m4Nch3$t3RuN1t3d"; // 16 bytes

        public static string Encrypt(string inputText)
        {

            string data = inputText;
            byte[] utfdata = UTF8Encoding.UTF8.GetBytes(data);
            byte[] saltBytes = UTF8Encoding.UTF8.GetBytes(_privateKey);


            // Our symmetric encryption algorithm
            AesManaged aes = new AesManaged();


            // We're using the PBKDF2 standard for password-based key generation
            Rfc2898DeriveBytes rfc = new Rfc2898DeriveBytes(_passwordKey, saltBytes);


            // Setting our parameters
            aes.BlockSize = aes.LegalBlockSizes[0].MaxSize;
            aes.KeySize = aes.LegalKeySizes[0].MaxSize;

            aes.Key = rfc.GetBytes(aes.KeySize / 8);
            aes.IV = rfc.GetBytes(aes.BlockSize / 8);


            // Encryption
            ICryptoTransform encryptTransf = aes.CreateEncryptor();


            // Output stream, can be also a FileStream
            byte[] encryptBytes;
            using (MemoryStream encryptStream = new MemoryStream())
            {
                using (CryptoStream encryptor = new CryptoStream(encryptStream, encryptTransf, CryptoStreamMode.Write))
                {
                    encryptor.Write(utfdata, 0, utfdata.Length);
                    encryptor.Flush();
                    encryptor.Close();

                    encryptBytes = encryptStream.ToArray();
                }
                encryptStream.Flush();
                encryptStream.Close();
            }


            // Showing our encrypted content
            string encryptedString = Convert.ToBase64String(encryptBytes);
            return encryptedString;

        }

        public static string Decrypt(string base64Input)
        {
            byte[] encryptBytes = Convert.FromBase64String(base64Input);
            byte[] saltBytes = Encoding.UTF8.GetBytes(_privateKey);


            // Our symmetric encryption algorithm
            AesManaged aes = new AesManaged();


            // We're using the PBKDF2 standard for password-based key generation
            Rfc2898DeriveBytes rfc = new Rfc2898DeriveBytes(_passwordKey, saltBytes);


            // Setting our parameters
            aes.BlockSize = aes.LegalBlockSizes[0].MaxSize;
            aes.KeySize = aes.LegalKeySizes[0].MaxSize;

            aes.Key = rfc.GetBytes(aes.KeySize / 8);
            aes.IV = rfc.GetBytes(aes.BlockSize / 8);


            // Now, decryption
            ICryptoTransform decryptTrans = aes.CreateDecryptor();


            // Output stream, can be also a FileStream
            byte[] decryptBytes;
            using (MemoryStream decryptStream = new MemoryStream())
            {
                using (CryptoStream decryptor = new CryptoStream(decryptStream, decryptTrans, CryptoStreamMode.Write))
                {
                    decryptor.Write(encryptBytes, 0, encryptBytes.Length);
                    decryptor.Flush();
                    decryptor.Close();

                    decryptBytes = decryptStream.ToArray();
                }

                decryptStream.Flush();
                decryptStream.Close();
            }

            // Showing our decrypted content
            string decryptedString = UTF8Encoding.UTF8.GetString(decryptBytes, 0, decryptBytes.Length);

            return decryptedString;

        }



    }
}
