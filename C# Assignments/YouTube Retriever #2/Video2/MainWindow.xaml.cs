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
using VideoLibrary;
using System.IO;

namespace Video2
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

        public static void vidRip()
        {
            using (var service = Client.For(YouTube.Default))
            {
                while (true)
                {
                    string id = 
                    
                    var video = service.GetVideo("https://youtube.com/watch?v=" + id);

                    Console.Write("Finished! Would you like to save the video to Downloads? [y/n] ");

                    char opt = Console.ReadKey().KeyChar;

                    Console.WriteLine();

                    string folder;

                    if (char.ToUpper(opt) == 'Y')
                        folder = GetDefaultFolder();
                    else
                    {
                        Console.Write("Please tell us where you'd like to save it: ");
                        folder = Console.ReadLine();
                    }

                    string path = Path.Combine(folder, video.FullName);

                    Console.WriteLine("Saving...");

                    File.WriteAllBytes(path, video.GetBytes());

                    Console.WriteLine("Done.");
                }
            }
        }

        static string GetDefaultFolder()
        {
            var home = Environment.GetFolderPath(
                Environment.SpecialFolder.UserProfile);

            return Path.Combine(home, "Downloads");
        }
    }

    private void btn_rip_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
