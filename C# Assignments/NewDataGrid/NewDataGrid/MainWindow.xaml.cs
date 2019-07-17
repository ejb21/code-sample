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

namespace NewDataGrid
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>

    public partial class MainWindow : Window
    {
        string xmlPath = @"Books.xml";

        public MainWindow()
        {
            InitializeComponent();
            BindData();
        }

        public void BindData()
        {
            DataSet ds = new DataSet();
            ds.ReadXml(xmlPath);

            if (ds.Tables.Count != 0)
            {
                DataView dv = new DataView(ds.Tables[0]);
                dgBooks.ItemsSource = dv;
            }
            else
            {
                //dgBooks.Columns
                dgBooks.ItemsSource = null;
            }
        }

        private void btnDeleteRecord(object sender, RoutedEventArgs e)
        {
            DataGrid dg = dgBooks;
            DataGridRow dr = (DataGridRow)dg.ItemContainerGenerator.ContainerFromIndex(dg.SelectedIndex);
            DataGridCell dc = (DataGridCell)dg.Columns[0].GetCellContent(dr).Parent;

            int bookID = Convert.ToInt32(((TextBlock)dc.Content).Text);
            // MessageBox.Show("" + bookID);

            XmlDocument doc = new XmlDocument();
            doc.Load(xmlPath);

            /*
            XmlNodeList nodes = doc.SelectNodes("//Book[@id=\"" + bookID + "\"]");

            for(int i = nodes.Count - 1; i >= 0; i--)
            {
                nodes[i].ParentNode.RemoveChild(nodes[i]);
            }
            */

            XmlNode node = doc.SelectSingleNode("//Book[@id=\"" + bookID + "\"]");
            node.ParentNode.RemoveChild(node);

            doc.Save(xmlPath);

            BindData();
        }

        private void SaveData(object sender, DataGridCellEditEndingEventArgs e)
        {
            DataGrid dg = dgBooks;
            DataGridRow dr = (DataGridRow)dg.ItemContainerGenerator.ContainerFromIndex(dg.SelectedIndex);
            DataGridCell dcID = (DataGridCell)dg.Columns[0].GetCellContent(dr).Parent;
            DataGridCell dcTitle = (DataGridCell)dg.Columns[0].GetCellContent(dr).Parent;
            DataGridCell dcAuthor = (DataGridCell)dg.Columns[0].GetCellContent(dr).Parent;

            int bookID = Convert.ToInt32(((TextBlock)dcID.Content).Text);
            int bookTitle = Convert.ToInt32(((TextBlock)dcTitle.Content).Text);
            int bookAuthor = Convert.ToInt32(((TextBlock)dcAuthor.Content).Text);

            XmlDocument doc = new XmlDocument();
            doc.Load(xmlPath);

            XmlElement root = doc.DocumentElement;
            XmlElement subRoot = (XmlElement)root.FirstChild;

            subRoot.

            doc.ReplaceChild()

            XmlNode node = doc.SelectSingleNode("//Book[@id=\"" + bookID + "\"]");
            node.InnerText =


        }
    }
}
