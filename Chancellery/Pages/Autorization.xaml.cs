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

namespace Chancellery.Pages
{
    /// <summary>
    /// Логика взаимодействия для Autorization.xaml
    /// </summary>
    public partial class Autorization : Page
    {
        public static string role;
        ChancelleryEntities db = ChancelleryEntities.GetDB();
        public Autorization()
        {
            InitializeComponent();
        }

        private void LoginGuest_Click(object sender, RoutedEventArgs e)
        {
            role = "Гость";
            NavigationService.Content = new Pages.ViewProduct();
        }

        private void Login_Click(object sender, RoutedEventArgs e)
        {
            var user = db.User.Where(w => w.Login == login.Text & w.Password == pass.Password);
            if (user != null)
            {
                role = "gjkmpjdfntkm";
                NavigationService.Content = new Pages.ViewProduct();
            }
            else
                MessageBox.Show("Логин или пароль введены неправельно", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
        }
    }
}
