using System;
using System.Collections.Generic;
using System.ComponentModel;
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
using System.Windows.Media.Media3D;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Chancellery.Pages
{
    /// <summary>
    /// Логика взаимодействия для ViewProduct.xaml
    /// </summary>
    public partial class ViewProduct : Page
    {
        int numberPage;
        ChancelleryEntities db = ChancelleryEntities.GetDB();
        public ViewProduct()
        {
            InitializeComponent();
            ViewPages(0);
        }

        public void ViewPages(int number)
        {
            int count = 14;
            List<Product> products = db.Product.ToList();

            var list = (from a in products
                        join b in db.Producter on a.Producter equals b.ID_Producter
                        select new
                        {
                            a.Name,
                            SourceImage = a.Image,
                            a.Description,
                            a.Discount,
                            producter = b.Producter1,
                            BackgroundSourse = a.Discount > 15 ? "#7fff00" : "Transparent",
                            a.Price,
                            DiscondedPrice = a.Discount == 0 ? "" : Math.Round((a.Price * (100 - a.Discount) / 100), 3).ToString(),
                            TextDecorations = a.Discount != 0 ? "Strikethrough" : "None",
                            Width = ((Panel)Application.Current.MainWindow.Content).ActualWidth - 50,
                        }).ToList();

            if (list.Count() - number < 15)
                count = list.Count();
            else
                count += number;

            if (list.Count() >= number)
                try
                {
                    ListViewProduct.Items.Clear();
                    for (int i = number; i < count; i++)
                        ListViewProduct.Items.Add(list[i]);
                }
                catch
                {
                    MessageBox.Show("Записи не найдены", "Внимение!", MessageBoxButton.OK, MessageBoxImage.Exclamation);
                }  

            if (Filter.Text != null)
                switch (Filter.Text)
                {
                    case "0-9,99%":
                        list = list.Where(w => w.Discount >= 0 && w.Discount <= Convert.ToDecimal(9.99)).ToList();
                        ListViewProduct.Items.Clear();
                        for (int i = 0; i < list.Count(); i++)
                            ListViewProduct.Items.Add(list[i]);
                        if (list == null)
                            MessageBox.Show("Записи не найдены", "Внимение!", MessageBoxButton.OK, MessageBoxImage.Information);
                        break;
                    case "10-14,99%":
                        list = list.Where(w => w.Discount >= 10 && w.Discount <= Convert.ToDecimal(14.99)).ToList();
                        ListViewProduct.Items.Clear();
                        for (int i = 0; i < list.Count(); i++)
                            ListViewProduct.Items.Add(list[i]);
                        if (list == null)
                            MessageBox.Show("Записи не найдены", "Внимение!", MessageBoxButton.OK, MessageBoxImage.Information);
                        break;
                    case "15% и более":
                        list = list.Where(w => w.Discount >= 15).ToList();
                        ListViewProduct.Items.Clear();
                        for (int i = 0; i < list.Count(); i++)
                            ListViewProduct.Items.Add(list[i]);
                        if(list == null)
                            MessageBox.Show("Записи не найдены", "Внимение!", MessageBoxButton.OK, MessageBoxImage.Information);
                        break;
                    case "Все  диапазоны":
                        ListViewProduct.Items.Clear();
                        for (int i = 0; i < 14; i++)
                            ListViewProduct.Items.Add(list[i]);
                        break;
                }
        }

        private void Filter_DropDownClosed(object sender, EventArgs e)
        {
            ViewPages(0);
        }

        private void Sort_DropDownClosed(object sender, EventArgs e)
        {
            CollectionView view = (CollectionView)CollectionViewSource.GetDefaultView(ListViewProduct.Items);

            switch (Sort.Text)
            {
                case "Цена по возрастанию":
                    view.SortDescriptions.Clear();
                    view.SortDescriptions.Add(new SortDescription(nameof(Product.Price), ListSortDirection.Ascending));
                    break;

                case "Цена по убыванию":
                    view.SortDescriptions.Clear();
                    view.SortDescriptions.Add(new SortDescription(nameof(Product.Price), ListSortDirection.Descending));
                    break;
            }
        }

        private void BackPage_Click(object sender, RoutedEventArgs e)
        {
            if(numberPage != 0)
            {
                numberPage -= 15;
                ViewPages(numberPage);
            }    
        }

        private void NextPage_Click(object sender, RoutedEventArgs e)
        {
            numberPage += 15;
            ViewPages(numberPage);
        }

        private void Sort_SelectionChanged()
        {

        }
    }
}
