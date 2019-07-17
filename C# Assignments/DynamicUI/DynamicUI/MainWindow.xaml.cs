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

namespace DynamicUI
{
    public partial class MainWindow : Window
    {
        TextBox txtMessage = new TextBox();

        public MainWindow()
        {
            InitializeComponent();

            Label label = new Label();
            label.Content = "Message:";
            panel.Children.Add(label);

            panel.Children.Add(txtMessage);

            Button button = new Button();
            button.Content = "Go!";
            button.Background = Brushes.Red;
            panel.Children.Add(button);
            button.Click += showMessage;
        }

        private void showMessage( object sender, RoutedEventArgs e )
        {
            MessageBox.Show(txtMessage.Text);
        }
    }
}
