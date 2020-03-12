using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace BEFit.Pages
{
    public class FilterModel : PageModel
    {
        public class Person
        {
            public string FirstName { get; set; }
            public string LastName { get; set; }
            public int Age { get; set; }
        }
        public JsonResult OnPost([FromBody]Person person)
        {
            System.Threading.Thread.Sleep(1000);
            return new JsonResult(person);
        }
    }
}
