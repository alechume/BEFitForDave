using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BEFit.Domain
{
    public class Client
    {
        public int ClientId { get; set; }
        public string NickName { get; set; }
        public int? UserId { get; set; }
    }
}
