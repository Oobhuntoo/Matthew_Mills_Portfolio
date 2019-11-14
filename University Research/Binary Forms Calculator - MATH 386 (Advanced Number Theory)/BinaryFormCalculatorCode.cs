using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace BinaryFormApp
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Calculate();
        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {
        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
        }

        private void textBox5_TextChanged(object sender, EventArgs e)
        {
        }

        private void textBox4_TextChanged(object sender, EventArgs e)
        {
        }
		// This function calculates the Greatest Common Divisor of two integers a and b using a recursive implementation of the Euclidean algorithm
        public int GCD(int a, int b)
        {
            return b == 0 ? a : GCD(b, a % b);
        }

        //https://math.berkeley.edu/~mcivor/math115su12/HW/HW5soln.pdf problems 3,4, and 5 are relevant to this project

        public void Calculate()
        {
            int discriminant = Convert.ToInt32(textBox1.Text); //value of given discriminant is retrieved
            int classNumber = 0;  //This is a counter variable that will be incremented each time a reduced form is found
            string classes = ""; // This will contain all of the reduced forms that are found in the form of a tuple
            int upperBound = Convert.ToInt32(Math.Floor(Math.Abs(Math.Sqrt(discriminant / 3)))); //This calculates the actual value from Theorem 2.12 on page 26 of the text

            for (int i = 1; i <= upperBound; i++)    // i represents all possible values of a, while j represents all possible values of b for each value of a. This loop structure is assumed by following the solutions to problems 3,4, and 5 from hyperlinked document above
            {
                for (int j = -i; j <= i; j++)
                {
                    Decimal c = (discriminant + Convert.ToDecimal(Math.Pow(Convert.ToDouble(j), 2))) / (4 * i); // the value of c is calculate using the formula for the discriminant

                    if (c - Math.Floor(c) != 0) 
                    { // this checks if c is an integer value. If not, the value of b and its iteration is discarded
                        continue;
                    }

                    if (((i == Math.Abs(j)) || (i == c)) && (j < 0))
                    { // This checks if there is any equality. If so, and if b's counter variable is less than 0, the value for b and its iteration is discarded
                        continue;
                    }

                    if (Math.Abs(GCD(GCD(i, j), GCD(j, Convert.ToInt32(c)))) != 1) {  // This checks if the gcd(a,b,c) > 1. gcd is like the intersection of factors. So the intersection of the intersections of a,b and b,c is not 1 if and only if they all share a common divisor > 1.
                        continue;
                    }
                    // the gcd(a,b,c) must divide the gcd(a,b), gcd(b,c), and gcd(a,c)
                    int[] formCoefficients = new int[3];  // a 3-tuple is declared and initialized to contain the possible values of the reduced form coefficients

                    formCoefficients[0] = i;
                    formCoefficients[1] = j;
                    formCoefficients[2] = Convert.ToInt32(c);
                      // if the gcd of the 3 numbers is 1, then the form is primitive and reduced, since the loop guarantees that |b| <= a <= c
                     classNumber++;
                     classes += "(" + Convert.ToString(formCoefficients[0]) + "," + formCoefficients[1] + "," + formCoefficients[2] + ")    ";
                }
            }
            textBox4.Text = Convert.ToString(classNumber);  //The computed class number is shown in its respective textbox in the program
            MessageBox.Show(classes);   // the list of reduced forms is shown in a dialouge box
        }   
    }
}
