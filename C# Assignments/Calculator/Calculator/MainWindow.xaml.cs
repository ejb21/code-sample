using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Calculator
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        double operandOne;
        double operandTwo;
        string operation;
        bool noDec = false;
        bool noNeg = false;
        bool noOp = true;

        public MainWindow()
        {
            InitializeComponent();
        }

        private void btnOperand_Click(object sender, RoutedEventArgs e)
        {
            Button operand = sender as Button;
            lblDisplay.Content += operand.Content.ToString();
            noOp = false;
        }

        private void btnOperator_Click(object sender, RoutedEventArgs e)
        {
            if (!noOp)
            {
                operandOne = Convert.ToDouble(lblDisplay.Content);
                Button op = sender as Button;
                operation = op.Content.ToString();
                lblDisplay.Content = "";
                lblCalculation.Content += operandOne.ToString() + " " + operation + " ";
                noDec = false;
                noNeg = false;
                noOp = true;
            }
            else return;
        }

        private void btnEquals_Click(object sender, RoutedEventArgs e)
        {
            if (!noOp)
            {
                operandTwo = Convert.ToDouble(lblDisplay.Content);
                lblCalculation.Content += operandTwo.ToString();

                switch (operation)
                {
                    case "÷":
                        if (operandTwo == 0)
                        {
                            lblDisplay.Content = "÷0";
                            noOp = true;
                            noNeg = true;
                            noDec = true;
                            break;
                        }
                        else
                        {
                            lblDisplay.Content = operandOne / operandTwo;
                            break;
                        }

                    case "×":
                        lblDisplay.Content = operandOne * operandTwo;
                        break;

                    case "–":
                        lblDisplay.Content = operandOne - operandTwo;
                        break;

                    case "+":
                        lblDisplay.Content = operandOne + operandTwo;
                        break;
                }
            }
            else lblDisplay.Content = operandOne;
        }

        private void btnDecimal_Click(object sender, RoutedEventArgs e)
        {
            if (!noDec)
            {
                Button dec = sender as Button;
                lblDisplay.Content += dec.Content.ToString();
                noDec = true;
            }
            else return;
        }

        private void btnNegative_Click(object sender, RoutedEventArgs e)
        {
            if (!noNeg)
            {
                lblDisplay.Content = "-" + lblDisplay.Content;
                noNeg = true;
            }
            else return;
        }

        private void btnClear_Click(object sender, RoutedEventArgs e)
        {
            lblDisplay.Content = "";
            lblCalculation.Content = "";
            operation = "";
            operandOne = 0;
            operandTwo = 0;
            noDec = false;
            noNeg = false;
        }

        private void keyHandler(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.D0 || e.Key == Key.NumPad0) btnOperand_Click(btn0, null);
            else if (e.Key == Key.D1 || e.Key == Key.NumPad1) btnOperand_Click(btn1, null);
            else if (e.Key == Key.D2 || e.Key == Key.NumPad2) btnOperand_Click(btn2, null);
            else if (e.Key == Key.D3 || e.Key == Key.NumPad3) btnOperand_Click(btn3, null);
            else if (e.Key == Key.D4 || e.Key == Key.NumPad4) btnOperand_Click(btn4, null);
            else if (e.Key == Key.D5 || e.Key == Key.NumPad5) btnOperand_Click(btn5, null);
            else if (e.Key == Key.D6 || e.Key == Key.NumPad6) btnOperand_Click(btn6, null);
            else if (e.Key == Key.D7 || e.Key == Key.NumPad7) btnOperand_Click(btn7, null);
            else if (e.Key == Key.D8 || e.Key == Key.NumPad8) btnOperand_Click(btn8, null);
            else if (e.Key == Key.D9 || e.Key == Key.NumPad9) btnOperand_Click(btn9, null);
            else if (e.Key == Key.Add) btnOperator_Click(btnPlus, null);
            else if (e.Key == Key.Subtract) btnOperator_Click(btnMinus, null);
            else if (e.Key == Key.Multiply) btnOperator_Click(btnMultiply, null);
            else if (e.Key == Key.Divide) btnOperator_Click(btnDivide, null);
            else if (e.Key == Key.OemPeriod || e.Key == Key.Decimal) btnDecimal_Click(btnDecimal, null);
            else if (e.Key == Key.Escape) btnClear_Click(btnClear, null);
            else if (e.Key == Key.Enter) btnEquals_Click(btnEquals, null);
            else return;
        }
    }
}