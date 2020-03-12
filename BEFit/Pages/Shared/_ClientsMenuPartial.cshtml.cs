using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BEFit.Domain;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace BEFit.Pages.Shared
{
    public class _ClientsMenuPartialModel : PageModel
    {
        public List<Client> Clients { get; set; }
        public _ClientsMenuPartialModel()
        {
            BFS requestDirector = new BFS();
            Clients = requestDirector.GetAllClients();
        }
    }
}
