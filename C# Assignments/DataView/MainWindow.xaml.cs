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
using System.Data;
using System.Xml;

namespace Assignment2
{
    public partial class MainWindow : Window
    {
        string xmlPath = @"us-states.xml";
        DataSet ds = new DataSet();

        public MainWindow()
        {
            InitializeComponent();
            BindData();
        }

        public void BindData()
        {
            ds.Reset();
            ds.ReadXml(xmlPath);

            if (ds.Tables.Count != 0)
            {
                DataView dv = new DataView(ds.Tables["state"]);
                dgStates.ItemsSource = dv;
            }
            else
            {
                dgStates.ItemsSource = null;
            }
        }

        private void btnDeleteRecord(object sender, RoutedEventArgs e)
        {
            DataRowView drv = (DataRowView)dgStates.SelectedItem;
            drv.Delete();
            ds.WriteXml(xmlPath);
        }

        private void SaveData(object sender, DataGridCellEditEndingEventArgs e)
        {
            ds.WriteXml(xmlPath);
        }

        private void btnAnnex_Click(object sender, RoutedEventArgs e)
        {
            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.Load(xmlPath);
            
            XmlElement root = xmlDoc.DocumentElement;
            XmlElement subRoot = (XmlElement)root.FirstChild;
            XmlElement newElement = xmlDoc.CreateElement(subRoot.Name);
            
            foreach (object child in stateGrid.Children)
            {
                String txtChild = "";
                
                if (child is TextBox)
                {
                    txtChild = (child as TextBox).Text.ToString();

                    if (child.Equals(txtName))
                        newElement.SetAttribute("name", txtChild);

                    else if (child.Equals(txtCapital))
                        newElement.SetAttribute("capital", txtChild);

                    else if (child.Equals(txtCity))
                        newElement.SetAttribute("most-populous-city", txtChild);
                }
            }

            root.AppendChild(newElement);
            xmlDoc.Save(xmlPath);
            BindData();
        }
    }
}
