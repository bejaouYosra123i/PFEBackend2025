using System;
using System.Collections.Generic;

namespace Backend_dotnet.Core.Dtos.General
{
    public class PcRequestDto
    {
        public string FullName { get; set; }
        public string Department { get; set; }
        public string Function { get; set; }
        public string PcType { get; set; }
        public string Reason { get; set; }
        public string RequestedBy { get; set; }
        public Dictionary<string, string> Signatures { get; set; }
        public string Status { get; set; }
    }
} 