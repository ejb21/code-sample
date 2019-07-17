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

namespace PeronsalInfo
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void close_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void submit_Click(object sender, RoutedEventArgs e)
        {
            string firstName = fnamein.Text;
            string lastName = lnamein.Text;

            MessageBox.Show("Hello, " + firstName + " " + lastName, "Hello", MessageBoxButton.OKCancel, MessageBoxImage.Exclamation);
        }
    }
}
