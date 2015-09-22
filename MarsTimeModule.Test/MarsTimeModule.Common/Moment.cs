using System;

namespace MarsTimeModule.Common
{
    public class Moment
    {
        #region Fields 

        private readonly int _hours;
        private readonly int _minutes;

        #endregion

        #region Constructor

        public Moment(int hours, int minutes)
        {
            if(hours < 0 || hours > 24) throw new ArgumentException("hours is invalid");
            if (minutes < 0 || minutes >= 100) throw new ArgumentException("minutes are invalid");

            _hours = hours;
            _minutes = minutes;
        }

        #endregion

        #region OpertionOverloads

        public static bool operator >(Moment left, Moment right)
        {
            if (left._hours > right._hours) return true;
            if (left._hours < right._hours) return false;
            return left._minutes > right._minutes;
        }

        public static bool operator <(Moment left, Moment right)
        {
            if (left._hours < right._hours) return true;
            if (left._hours > right._hours) return false;
            return left._minutes < right._minutes; 
        }

        public static bool operator >=(Moment left, Moment right)
        {
            if (left._hours > right._hours) return true;
            if (left._hours < right._hours) return false;
            return left._minutes >= right._minutes;
        }

        public static bool operator <=(Moment left, Moment right)
        {
            if (left._hours < right._hours) return true;
            if (left._hours > right._hours) return false;
            return left._minutes <= right._minutes; 
        }

        #endregion

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
            if (!int.TryParse(momentParts[0].Trim(), out start) || !int.TryParse(momentParts[1].Trim(), out end))
                throw new ArgumentException("Input is not numeric.");


            return new Moment(start, end);
        }

        #region ToString

        public override string ToString()
        {
            return string.Format("{0}:{1}", _hours, _minutes);
        }

        #endregion
    }
}
