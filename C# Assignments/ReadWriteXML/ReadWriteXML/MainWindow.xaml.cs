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
using System.Xml;

namespace ReadWriteXML
{
    public partial class MainWindow : Window
    {
        String fileName = "Friends.xml";

        public MainWindow()
        {
            InitializeComponent();

            // Define and load the .xml document
            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.Load(fileName);

            // Obtain root and children
            XmlElement root = xmlDoc.DocumentElement;
            XmlElement subRoot = (XmlElement)root.FirstChild;
            XmlNodeList children = subRoot.ChildNodes;

            // Loop through the children and produce a label/text box for each
            for( int i = 0 ;  i < children.Count ;  i++ )
            {
                Label lblChild = new Label();
                lblChild.Content = children[i].Name;
                TextBox txtChild = new TextBox();

                stpContainer.Children.Add(lblChild);
                stpContainer.Children.Add(txtChild);
            }

            Button btnAdd = new Button();
            btnAdd.Content = "Add Friend";
            btnAdd.Click += addFriend;
            stpContainer.Children.Add(btnAdd);
        }

        private void addFriend(object sender, RoutedEventArgs e)
        {
            // Define and load the .xml document
            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.Load(fileName);

            // Obtain root and children
            XmlElement root = xmlDoc.DocumentElement;
            XmlElement subRoot = (XmlElement)root.FirstChild;

            XmlElement newElement = xmlDoc.CreateElement(subRoot.Name);

            // Loop through stack panel
            foreach ( object child in stpContainer.Children )
            {
                String lblChild = "";

                // Determine if stack panel child is label or text box
                if ( child is Label )
                {
                    lblChild = (child as Label).Content.ToString();
                    XmlElement childElement = xmlDoc.CreateElement(lblChild);
                    newElement.AppendChild(childElement);
                }
                else if ( child is TextBox )
                {

                }
            }

            root.AppendChild(newElement);
            xmlDoc.Save(fileName);
        }
    }
}
