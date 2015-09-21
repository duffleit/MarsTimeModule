using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MarsTimeModule.Common
{
    public class Moment
    {
        private readonly int _start;
        private readonly int _end;

        private Moment(int start, int end)
        {
            _start = start;
            _end = end;
        }

        public static Moment Parse(string moment)
        {
            moment = moment.Replace(".", ":");
            moment = moment.Replace("_", ":");
            moment = moment.Replace(" ", ":");

            var momentParts = moment.Split(':');
            if (momentParts.Length != 2)
                throw new ArgumentException("Invalid moment to parse.");

            int start;
            int end;
            if (!int.TryParse(momentParts[0], out start) || !int.TryParse(momentParts[1], out end))
                throw new ArgumentException("Input is not numeric.");


            return new Moment(start, end);
        }

        public override string ToString()
        {
            return string.Format("{0}:{1}", _start, _end);
        }
    }
}
