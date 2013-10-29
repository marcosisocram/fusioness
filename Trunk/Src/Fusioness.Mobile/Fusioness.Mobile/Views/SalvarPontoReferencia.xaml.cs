using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Navigation;
using Microsoft.Phone.Controls;
using Microsoft.Phone.Shell;

namespace Fusioness.Mobile.Views
{
    public partial class SalvarPontoReferencia : PhoneApplicationPage
    {
        public SalvarPontoReferencia()
        {
            InitializeComponent();
        }

        private void btCancelar_Click(object sender, EventArgs e)
        {
            NavigationService.GoBack();
        }
    }
}