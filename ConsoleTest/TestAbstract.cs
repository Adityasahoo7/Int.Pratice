using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleTest
{
    public abstract class Payment
    {
        public int _amount { get; set; }
        public Payment(int amount)
        {
            _amount = amount;
        }

        public abstract void payment();

        public void print()
        {
            Console.WriteLine($"Recept Amount = {_amount}");
        }
    }
    public class credit:Payment
    {
        public credit(int amount) : base(amount)
        {

        }
        public override void payment()
        {
            Console.WriteLine($"Credit Payment {_amount}");
        }
    }

    public class TestAbstract
    {
        static void Main()
        {

            Payment p1 = new credit(1500);
            p1.payment();
            p1.print();
           // Console.WriteLine("Aditya");
        }
    }
}
