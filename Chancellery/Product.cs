//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Chancellery
{
    using System;
    using System.Collections.Generic;
    
    public partial class Product
    {
        public int ID_Product { get; set; }
        public string Articul { get; set; }
        public string Name { get; set; }
        public string Unit { get; set; }
        public decimal Price { get; set; }
        public decimal MaxDiscount { get; set; }
        public int Producter { get; set; }
        public int Supplier { get; set; }
        public int Category { get; set; }
        public decimal Discount { get; set; }
        public int QuantityInStock { get; set; }
        public string Description { get; set; }
        public string Image { get; set; }
    
        public virtual Category Category1 { get; set; }
        public virtual MaxDiscount MaxDiscount1 { get; set; }
        public virtual Producter Producter1 { get; set; }
        public virtual Supplier Supplier1 { get; set; }
    }
}
