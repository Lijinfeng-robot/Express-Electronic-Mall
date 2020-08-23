using System.Web;
using System.Web.Mvc;

//@author Jinfeng Li
namespace FIT5032_assignment
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}
